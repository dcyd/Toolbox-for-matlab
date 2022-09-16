function H=radar_plot(data,lim,color,face_alpha,number_of_tick,is_background,labels)
% input:
%   data: n*1 vector;
%   lim: axis limits
%   color: color of this circle
%   face_alpha
%   number_of_tick： >1, the number of ticks;


[n,~]=size(data); % get the number of variable

if is_background

    % plot background
    axis equal
    hold on
    theta_last=pi/2;
    for i=1:n
        theta=2*pi/n*i+pi/2;
        plot([0,(number_of_tick-1)*100*cos(theta)],[0,(number_of_tick-1)*100*sin(theta)],'k-','linewidth',1);
        for j=1:number_of_tick-1
           plot([j*100*cos(theta_last),j*100*cos(theta)],[j*100*sin(theta_last),j*100*sin(theta)],'--','linewidth',0.75,'color',[0.5,0.5,0.5]);
        end
        hold on
        text_around(((number_of_tick-1)*100+10)*cos(theta),((number_of_tick-1)*100+10)*sin(theta),labels{i},theta); % set label
        theta_last=theta;
    end

    % set ticks
    i=1;
    theta=2*pi/n*i+pi/2;
    for j=0:number_of_tick-1
        text_around(j*100*cos(theta),j*100*sin(theta),num2str(lim(1)+(lim(2)-lim(1))/(number_of_tick-1)*j),theta+pi/2,9);
    end
    
    % set labels
    texts=findobj(gca,'Type','Text');
    minx=-(number_of_tick-1)*100;
    maxx=(number_of_tick-1)*100;
    miny=-(number_of_tick-1)*100;
    maxy=(number_of_tick-1)*100;
    for i=1:length(texts)
        rect=get(texts(i),'Extent');
        x=rect(1);
        y=rect(2);
        dx=rect(3);
        dy=rect(4);
        if x<minx
            minx=x;
        elseif x+dx>maxx
            maxx=x+dx;
        end
        if y<miny
            miny=y;
        elseif y+dy>maxy
            maxy=y+dy;
        end
    end
    axis([minx-50,maxx+50,miny-20,maxy+20]);
end


% plot radar
adj_data=zeros(n,1);
point=zeros(n,2);
for i=1:n
    theta=2*pi/n*i+pi/2;

    if data(i)<lim(1)
        adj_data(i)=0;
    elseif data(i)>lim(2)
        adj_data(i)=(number_of_tick-1)*100;
    else
        adj_data(i)=(data(i)-lim(1))/(lim(2)-lim(1))*(number_of_tick-1)*100;
    end
    point(i,1:2)=[adj_data(i)*cos(theta);adj_data(i)*sin(theta)];
end

H = plot([point(:,1);point(1,1)],[point(:,2);point(1,2)],'-','linewidth',1.5,'Color',color);
fill(point(:,1),point(:,2),color,'EdgeColor','none','FaceAlpha',face_alpha);
% alpha(face_alpha);

end




% write text function
function text_around(x,y,txt,theta,fontsize)
    if nargin==4
        fontsize=10;
    end
    section=mod(theta+pi/12,2*pi);
    if section>pi+pi/6
        %上对齐
        if section>1.5*pi+pi/6
            %左对齐
            text(x,y,txt,'VerticalAlignment','cap','HorizontalAlignment','left','Fontsize',fontsize);
        elseif section>1.5*pi
            %中对齐
            text(x,y,txt,'VerticalAlignment','cap','HorizontalAlignment','center','Fontsize',fontsize);
        else
            %右对齐
            text(x,y,txt,'VerticalAlignment','cap','HorizontalAlignment','right','Fontsize',fontsize);
        end
    elseif section>pi
        %中、右对齐
        text(x,y,txt,'VerticalAlignment','middle','HorizontalAlignment','right','Fontsize',fontsize);
    elseif section>pi/6
        %下对齐
        if section>0.5*pi+pi/6
            %右对齐
            text(x,y,txt,'VerticalAlignment','bottom','HorizontalAlignment','right','Fontsize',fontsize);
        elseif section>0.5*pi
            %中对齐
            text(x,y,txt,'VerticalAlignment','bottom','HorizontalAlignment','center','Fontsize',fontsize);
        else
            %左对齐
            text(x,y,txt,'VerticalAlignment','bottom','HorizontalAlignment','left','Fontsize',fontsize);
        end
    else
        %中、左对齐
        text(x,y,txt,'VerticalAlignment','middle','HorizontalAlignment','left','Fontsize',fontsize);
    end
end