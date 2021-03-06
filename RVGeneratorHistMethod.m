function r_new = RVGeneratorHistMethod(binedge,prob,n)
% To Generate random number from a given histogram pdf
% n : is number of desired RV to be generated
% binedge : edge of each bin 
% prob : vector corresponding the probability of each bin

binwidth = binedge(2)-binedge(1);
cdf = cumsum(prob);
cdf = [0, cdf];
u = rand(1,n); % uniform random variable between [0,1]

p = @(r) find(r<cdf,1,'first'); % find the 1st index s.t. r<F(i)

i = arrayfun(p,u); % it gives you i-th bin with [x_{i},x_{i+1}]

r_new = binedge(i) + 1./(prob(i-1)/binwidth) .* (u - cdf(i)); % new random variable

% Uncomment this, for visualtization of the random variable distribution
%     histogram(r_new,16,'Normalization','pdf');
%     title('Generated Histogram from simulated data','FontSize',20);
%     xlabel('Random Variables','FontSize',20);
%     ylabel('Probability','FontSize',20);

end