function  [height,pdf,xMin,xMax]=histog_nodiag(ima,nBins,Corr_cut,nf,nname)
X=ima(triu(true(size(ima)),1)); %take the upper triangular of correlation matrix, without diagonal
% ima=triu(ima,0); 
X(X<Corr_cut)=0;  %build a new vector with just the correlation values over corr_cut
xMin = min(X); % sample minimum
xMax = max(X); % sample maximum
N = length(X); % sample size

area = (xMax-xMin)*N/nBins; % Average area

[height,center] =hist(X,nBins); %histogram 
pdf=height/area; % scaled histogram as a pdf
pdf=pdf./sum(pdf);  %makes sure the sum is one
figure;
bar(center, pdf); title('pdf');%plot pdf
% figure;
% bar(center, height); title('histogram') %plot histogram

assignin('base',nname,pdf); %leave the array in base workspace

%save pdf in file
s = ['save ' nf ' pdf'];
eval(s);



end

