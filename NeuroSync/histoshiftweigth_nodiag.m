function  [X,pdf,xMin,xMax]=histoshiftweigth_nodiag(ima,thres,nf)

%calculate the histogram of weighted (by the correlation value) shifts from an element of the diagonal to the
%other elements to the rigth with a correlation greater that theshold
%It is not considered the diagonal, so it is not counted the correlation of
%the element with itself

ima(ima<=thres)=0;  %set to zero correlation values less that theshold
ima=ima-diag(diag(ima)); %It is not considered the diagonal
xMin = 0; % sample minimum
xMax = size(ima,1)-1; % sample maximum
N = length(triu(ima)>0); % number of elements different to zero in the upper part of the matrix
nBins=xMax+1;

X=zeros(1,nBins);
for i=1:xMax
    tmp=ima(i,i:nBins);
    ind=tmp>0;
    X(ind)=X(ind)+tmp(ind);
end;
% [height,center] =hist(X,nBins); %histogram 
area = (xMax-xMin)*sum(X)/nBins; % Average area
pdf=X/area; % scaled histogram as a pdf
figure;
bar(0:xMax, pdf); title('pdf');%plot pdf
% figure;
% bar(0:xMax, X); title('histogram');%plot pdf

%save pdf in file
s = ['save ' nf ' pdf'];
eval(s);
end

