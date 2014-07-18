function KL = kldiv2(pVect1,pVect2,varargin)
%KLDIV Kullback-Leibler or Jensen-Shannon divergence between two distributions.
%   KLDIV(X,P1,P2) returns the Kullback-Leibler divergence between two
%   distributions .  P1 is a length-M vector of probabilities representing distribution 1, and P2 is a
%   length-M vector of probabilities representing distribution 2.  Thus, the
%   probability of value X(i) is P1(i) for distribution 1 and P2(i) for
%   distribution 2.  Both distribution are so considered to be given over the same values universe.
%   The Kullback-Leibler divergence is given by:
%
%       KL(P1(x),P2(x)) = sum[P1(x).log(P1(x)/P2(x))]
%
%   KLDIV(X,P1,P2,'sym') returns a symmetric variant of the Kullback-Leibler
%   divergence, given by [KL(P1,P2)+KL(P2,P1)]/2.  See Johnson and Sinanovic
%   (2001).
%
%   KLDIV(X,P1,P2,'js') returns the Jensen-Shannon divergence, given by
%   [KL(P1,Q)+KL(P2,Q)]/2, where Q = (P1+P2)/2.  See the Wikipedia article
%   for "KullbackLeibler divergence".  This is equal to 1/2 the so-called
%   "Jeffrey divergence."  See Rubner et al. (2000).
%  Based on code at:
%  http://www.mathworks.com/matlabcentral/fileexchange/13089-kldiv/content/kldiv.m


%make sure sum of probabilities is 1 and none is zero
pVect1=pVect1./sum(pVect1);
pVect2=pVect2./sum(pVect2);
pVect1=pVect1+eps.*ones(size(pVect1));
pVect2=pVect2+eps.*ones(size(pVect2));

if ~isequal(size(pVect1),size(pVect1))
    error('All inputs must have same dimension.')
end
% Check probabilities sum to 1:
if (abs(sum(pVect1) - 1) > .00001) || (abs(sum(pVect2) - 1) > .00001),
    error('Probablities don''t sum to 1.')
end

if ~isempty(varargin),
    switch varargin{1},
        case 'js',
            logQvect = log2((pVect2+pVect1)/2);
            KL = .5 * (sum(pVect1.*(log2(pVect1)-logQvect)) + ...
                sum(pVect2.*(log2(pVect2)-logQvect)));

        case 'sym',
            KL1 = sum(pVect1 .* (log2(pVect1)-log2(pVect2)));
            KL2 = sum(pVect2 .* (log2(pVect2)-log2(pVect1)));
            KL = (KL1+KL2)/2;
            
        otherwise
            error(['Last argument' ' "' varargin{1} '" ' 'not recognized.'])
    end
else
    KL = sum(pVect1 .* (log2(pVect1)-log2(pVect2)));
end








