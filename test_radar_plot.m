% example of vulnerability value: There are 11 kinds of disruption
% scenarios with seven different functionality, generating 77 kinds of
% vulnerability value.
% plot one radar circle for each disruption scenario.

vulnerability_value=[0.7252    0.8504    0.8475    0.7295    0.7926    0.8610    0.8427    0.8449    0.7973    0.7477    0.8331    0.8126    0.7489
                    0.8166    0.9282    0.9291    0.8494    0.9068    0.9192    0.9230    0.9266    0.8976    0.8835    0.9062    0.8921    0.8639
                    0.8284    0.9303    0.9356    0.9414    0.9393    0.9328    0.9218    0.9409    0.9527    0.9511    0.9449    0.9456    0.9418
                    0.8349    0.9410    0.9455    0.9526    0.9464    0.9317    0.9322    0.9459    0.9608    0.9604    0.9470    0.9518    0.9516
                    0.8386    0.9292    0.9346    0.9356    0.9414    0.9442    0.9211    0.9450    0.9522    0.9495    0.9498    0.9451    0.9368
                    0.8175    0.9116    0.9182    0.9214    0.9258    0.9374    0.9040    0.9339    0.9372    0.9326    0.9404    0.9342    0.9247
                    0.7984    0.8978    0.9040    0.9131    0.9135    0.9268    0.8894    0.9222    0.9261    0.9209    0.9275    0.9232    0.9178];

fun_type={'V^{S}' 'V^{\epsilon}' 'V^{A^{p}}' 'V^{A^{c15}}' 'V^{A^{c30}}' 'V^{A^{c45}}' 'V^{A^{c60}}'};
dis_scena={'R' 'I^N' 'I^E' 'I^P' 'I^{B^s}' 'I^{B^f}' 'I^{S}' 'I^{\epsilon}' 'I^{A^{p}}' 'I^{A^{c15}}' 'I^{A^{c30}}' 'I^{A^{c45}}' 'I^{A^{c60}}'};
color_map=[0,0,0
    148,103,189;
    164,84,156;
    227,119,194;
    255,127,14;
    214,39,40;
    140,86,75;
    127,127,127;
    31,119,180;
    188,189,34;
    124,125,55;
    44,160,44;
    72,128,128]/255;

figure
H(1)=radar_plot(vulnerability_value(:,1),[0.7 1],color_map(1,:),0.1,3,1,fun_type);
for j=2:13
    H(j)=radar_plot(vulnerability_value(:,j),[0.7 1],color_map(j,:),0.1,3,0,fun_type);
end


leg=legend(H,dis_scena);
leg.ItemTokenSize = [7,7];
axis off

