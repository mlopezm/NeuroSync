function  [X,pdf,xMin,xMax]=histoshift(ima,thres,nf)

%calculate the histogram of shifts statring from an element of the diagonal to the
%rigth with a correlation greater that theshold

ima(ima<=thres)=0;  %set to zero correlation values less that theshold
xMin = 0; % 
xMax = size(ima,1)-1; % maximum number of shifts to the right
N = length(triu(ima)>0); % number of elements different to zero in the upper part of the matrix plus the diagonal
nBins=xMax+1;
area = (xMax-xMin)*N/nBins; % Average area

X=zeros(1,nBins);
for i=1:xMax
    tmp=ima(i,i:nBins);
    ind=tmp>0;
    X(ind)=X(ind)+1;
end;
% [height,center] =hist(X,nBins); %histogram 
pdf=X/area; % scaled histogram as a pdf
figure;
bar(0:xMax, pdf); title('pdf');%plot pdf
% figure;
% bar(0:xMax, X); title('histogram');%plot pdf

%save pdf in file
s = ['save ' nf ' pdf'];
eval(s);
end

