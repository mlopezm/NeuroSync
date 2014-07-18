function  [height,pdf,xMin,xMax]=histog(ima,nBins,Corr_cut,dest_file,nname)

X=ima(triu(true(size(ima)))); %take the upper triangular of correlation matrix
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
s = ['save ' dest_file ' pdf'];
eval(s); 

end

