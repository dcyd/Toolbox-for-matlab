function [p] = ksgof(h, boundaries, bmin,type, varargin)
%KSgof estimates p-value for a goodness of given fit using Kolmogorov-Smirnov test
%against theretical ccdf generated for distribution chosen in 'type'
%distributions with p-values less than 0.1 are ruled out
% ------
% Notes:
% ------
%
% 1. h: experimental dataset
%
% 2. boundaries: edges of the binned data.
%
% 3. bmin: the lower bound above which you fit any model. 
%
% 4. type: String consisting of one of the five valid types shown 
%          below: 
%          (1) 'pl', (2) 'expn', (3) 'stexp', (4) 'lgnorm', 
%          (5) 'plcut'.
%
% 5. varargin: Depending on the type, ksgof expects the number of 
%              parameters. 
%              (1) for 'pl', varargin{1} = alpha
%              (2) for 'expn', varargin{1} = lambda
%              (3) for 'stexp', varargin{1} = lambda, varargin{2} = beta
%              (4) for 'lgnorm', varargin{1} = mu, varargin{2} = sigma
%              (5) for 'plcut',  varargin{1} = alpha, varargin{2} = lambda
%
% 6. p: estimated p-value.

% Reshape the input vectors
h = reshape(h, numel(h), 1);
boundaries = reshape(boundaries, numel(boundaries), 1);

ind = find(boundaries>=bmin, 1);
h = h(ind:end);     
b = boundaries(ind:end);
x = b(1:end-1);

% empirical ccdf
temp = cumsum(h(end:-1:1));
e_ccdf = 1-temp(end:-1:1)./sum(h); 


switch type
    % Power law
    case 'pl'
        alpha = varargin{1};
        t_ccdf = 1 - (x./bmin).^(1-alpha); % theretical ccdf
        [~,p] = kstest2(e_ccdf,t_ccdf); 
    % Exponential
    case 'expn'
        lambda = varargin{1};
%         syms x lambda bmin
%         f = (lambda*exp(lambda*bmin)).*exp(-lambda.*x);
%         cdf = int(f,x);
        t_ccdf = exp(-lambda.*(x-bmin)); % theretical ccdf
        [~,p] = kstest2(e_ccdf,t_ccdf); 
    % Stretched Exponential
    case 'stexp'
        lambda = varargin{1}; beta = varargin{2};
%         syms t x bmin lambda beta 
%         assume(x >= 0);
%         assume(bmin>0);
%         assume(t>=0);
%         assume(beta>=0);
%         assume(lambda>=0);
%         f = exp(-lambda*t^beta)*t^(beta-1);
%         C = beta*lambda*exp(lambda*bmin^beta);
%         cdf = int(C*f,t,x,bmin);
        t_ccdf = 1-exp(bmin^beta*lambda).*exp(-lambda.*x.^beta); % theretical ccdf 
        [~,p] = kstest2(e_ccdf,t_ccdf); 
%         figure;
%         plot(e_ccdf);
%         hold on;
%         plot(t_ccdf);

    % Log normal
    case 'lgnorm'
        mu = varargin{1}; sigma = varargin{2};
%         syms t x bmin mu sigma C
%         assume(x >= 0);
%         assume(bmin>0);
%         assume(t>=0);
%         assume(sigma>=0);
%         f = (1/t)*exp(-(log(t)-mu)^2/(2*sigma^2));
%         C = (2/(pi*sigma^2))^(1/2)*((erfc((log(bmin)-mu)/(2^(1/2)*sigma))).^(-1));
%         cdf = int(C*f,t,x,bmin);
%        Ccdf = erf((mu-log(bmin))/(2^(1/2)*sigma));
        t_ccdf = 1/2 - (1/2).*erf((mu-log(x))./(2^(1/2)*sigma));   
        [~,p] = kstest2(e_ccdf,t_ccdf);
%         figure;
%         plot(e_ccdf);
%         hold on;
%         plot(t_ccdf);
    % Power law with exponential cut off
    case 'plcut'
        alpha = varargin{1}; lambda = varargin{2};
%         syms t x bmin alpha lambda C
%         assume(x > 0);
%         assume(bmin>0);
%         assume(t>=0);
%         assume(alpha>=1);
%         assume(lambda>0);
        C = lambda.^(1-alpha)./igamma((1-alpha),lambda*bmin);
%         f = C*t^(-alpha)*exp(-lambda*t);
%         cdf = int(f,t,x,bmin);
        t_ccdf = 1 - C.*lambda.^(alpha-1).*igamma(1 - alpha, lambda.*x); %theretical ccdf
        [~,p] = kstest2(e_ccdf,t_ccdf);
    otherwise, fprintf('(KSGOF) Error: Invalid type argument'); return;
end

if p < 0.01
    p = 0;
end

end

