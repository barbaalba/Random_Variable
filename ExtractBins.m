function [binedge, prob, bincenter] = ExtractBins(fig)
% To Extract bin edge and corresponding probabilty of each bin from
% experimental data
%
% fig: The given figure generated with histogram (fig = gcf;)
% 

axObjs = fig.Children;
dataObjs = axObjs.Children;

prob = dataObjs.Values;
binedge = dataObjs.BinEdges;
binwidth = dataObjs.BinWidth;
bincenter = binedge + binwidth/2;
bincenter(end) = [];

end