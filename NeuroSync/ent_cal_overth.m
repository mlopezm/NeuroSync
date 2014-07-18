function  [ent,pos,minimum]=ent_cal_overth(ima)

% entropy calculations of the distribution of correlation values vs
% threshold (only values over threshold are computed)

ima=triu(ima,1); %take the upper triangular of correlation matrix
nBins=100;
m= 100; %elements to iterate
ent=zeros(1,m);
for i=0:m-1 %move the threshold from 0 to 1
    X=ima(ima>i/m);  %build a new vector with just the correlation values over thereshold
    xMin = min(X); % sample minimum
    xMax = max(X); % sample maximum
    N = length(X); % sample size

    if (N<nBins) 
        nBins=N;
    end

    h=hist(X,nBins); %histogram 
    if N>0
        pdf=h/N; % scaled histogram as a pdf
        ent(i+1)=-sum(pdf(pdf>0).*log2(pdf(pdf>0)));
    else
        ent(i+1)=0;
    end
end

figure;
plot((0:1/m:1-1/m),ent); title('Entropy vs Thresholds'); %plot entropy

minimum=min(ent);
pos_min= find(ent==minimum);
pos=pos_min/m;
end

