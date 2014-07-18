function  [X,pdf,xMin,xMax]=histoshift_nodiag2(ima,thres,nf,nname)

%calculate the histogram of shifts from an element of the diagonal to the
%other elements to the rigth with a correlation greater that theshold
%It is not considered the diagonal, so it is not counted the correlation of
%the element with itself
ima=triu(ima,1); 
ima(ima<thres)=0;  %set to zero correlation values less that theshold
% ima=ima-diag(diag(ima)); %It is not considered the diagonal
xMin = 0; % 
xMax = floor(size(ima,2)/2-1); % maximum number of shifts to the right, covering as much half of the values to the rigth
N = xMax^2; % number of elements different to zero in the upper part of the matrix without the diagonal, covering as much half of the values to the rigth
nBins=xMax;
area = (xMax-xMin)*N/nBins; % Average area

X=zeros(1,nBins);
for i=1:xMax
    tmp=ima(i,i:nBins+i-1);
    ind=tmp>0;
    X(ind)=X(ind)+1;
end;
% [height,center] =hist(X,nBins); %histogram 
pdf=X/area; % scaled histogram as a pdf
pdf=pdf./sum(pdf);  %makes sure the sum is one
figure;
bar(0:xMax-1, pdf); title('pdf');%plot pdf
% figure;
% bar(0:xMax, X); title('histogram');%plot pdf

assignin('base',nname,pdf); %leave the array in base workspace

%save pdf in file
s = ['save ' nf ' pdf'];
eval(s);
end

