function r_new = RVGeneratorHistMethod(binedge,v,n)
% n : is number of desired RV to be generated
% binedge : edge of each bin 
% v : vector corresponding the probability of each bin

binwidth = binedge(2)-binedge(1);
cdf = cumsum(v);
cdf = [0, cdf];
u = rand(1,n); % uniform random variable between [0,1]

p = @(r) find(r<cdf,1,'first'); % find the 1st index s.t. r<F(i)

i = arrayfun(p,u); % it gives you i-th bin with [x_{i},x_{i+1}]

r_new = binedge(i) + 1./(v(i-1)/binwidth) .* (u - cdf(i)); % new random variable

% Uncomment this, for visualtization of the random variable distribution
%     histogram(r_new,16,'Normalization','pdf');
%     title('Generated Histogram from simulated data','FontSize',20);
%     xlabel('AOD','FontSize',20);
%     ylabel('Probability','FontSize',20);

end