function cal_distance(Spikes,mode,bs) 
 %bs is the size of block to use several rows o columns as a vector
 
 %calculate string date
 sd=datestr(now,30);
 sd(sd==' ') = '';
 
if (bs>1)
        
    SpikesT=Spikes';
    N=size(Spikes,1);
    T=size(Spikes,2);
    bSpikes=[]; %build the vectorized blocks of spikes 
    for z=0:1:N-bs
        tmp=SpikesT(z*T+1:(z+bs)*T)'; %we work with the transpose as the vectorization is done by column
        bSpikes=[bSpikes tmp]; %a colum of bSpike is formed from "bs" columns of SpikeT, shifting one by one
    end;
    DistSpikes= pdist(bSpikes',mode); %transpose again
    % resolve problem of divide by 0
    if (strcmp(mode,'jaccard')|| strcmp(mode,'spearman')||strcmp(mode,'correlation')||strcmp(mode,'cosine')||strcmp(mode,'hamming'))
        DistSpikes(isnan(DistSpikes)) = 1;
    end;
    % First the values are normalized 0-1 
    if max(max(DistSpikes))>1
        DistSpikes= DistSpikes/max(max(DistSpikes));
%     else
%         DistSpikes= DistSpikes;
    end;
%     t1=ones(1,numel(SimSpikes));
%     SimSpikes=t1-SimSpikes;
        
    
    bSpikesT=[];
    for z=0:1:T-bs
        tmp=Spikes(z*N+1:(z+bs)*N)';
        bSpikesT=[bSpikesT tmp];
    end;
    DistSpikesT= pdist(bSpikesT',mode);
    % resolve problem of divide by 0
    if (strcmp(mode,'jaccard')|| strcmp(mode,'spearman')||strcmp(mode,'correlation')||strcmp(mode,'cosine')||strcmp(mode,'hamming'))
        DistSpikesT(isnan(DistSpikesT)) = 1;
    end;
    %  First the  values are normalized 0-1 
    if max(max(DistSpikesT))>1
        DistSpikesT= DistSpikesT/max(max(DistSpikesT));
%     else
%         SimSpikesT= DistSpikesT;
    end;
%      t2=ones(1,numel(SimSpikesT));
%      SimSpikesT=t2-SimSpikesT;
    
     
    MDistSpikesT=squareform(DistSpikesT);
    MDistSpikes=squareform(DistSpikes);
    MSimSpikesT=ones(size(MDistSpikesT))-MDistSpikesT; %it is done an inversion of
    % values to represent similarity instead of distance
    MSimSpikes=ones(size(MDistSpikes))-MDistSpikes;
%     MSimSpikesT=squareform(SimSpikesT);
%     MSimSpikes=squareform(SimSpikes);
    
    x=sprintf('MSimSpikes_b%s_%s_%s',num2str(bs),mode,sd);
    xx=sprintf('MSimSpikesT_b%s_%s_%s',num2str(bs),mode,sd);
    xxx=sprintf('MDistSpikes_b%s_%s_%s',num2str(bs),mode,sd);
    xxxx=sprintf('MDistSpikesT_b%s_%s_%s',num2str(bs),mode,sd);
    assignin('base',x,MSimSpikes);
    assignin('base',xx,MSimSpikesT);
    assignin('base',xxx,MDistSpikes);
    assignin('base',xxxx,MDistSpikesT); 
    ss='.\files\distances\';
    s = ['save ' ss x '  MSimSpikes']; %save matrices in files in corresponding directory
    eval(s); 
    s = ['save ' ss xx '  MSimSpikesT']; %save matrices in files in corresponding directory
    eval(s);
    s = ['save ' ss xxx '  MDistSpikes']; %save matrices in files in corresponding directory
    eval(s);
    s = ['save ' ss xxxx '  MDistSpikesT']; %save matrices in files in corresponding directory
    eval(s);
else  %bs=1
    DistSpikes= pdist(Spikes,mode); 
        % resolve problem of divide by 0
    if (strcmp(mode,'jaccard')|| strcmp(mode,'spearman')||strcmp(mode,'correlation')||strcmp(mode,'cosine')||strcmp(mode,'hamming'))
        DistSpikes(isnan(DistSpikes)) = 1;
    end;
    % First the  values are normalized 0-1 
    if max(max(DistSpikes))>1
        DistSpikes= DistSpikes/max(max(DistSpikes));
%     else
%         SimSpikes= DistSpikes;
    end;
%     t1=ones(1,numel(SimSpikes));
%     SimSpikes=t1-SimSpikes;
    
    DistSpikesT= pdist(Spikes',mode);
        % resolve problem of divide by 0
    if (strcmp(mode,'jaccard')|| strcmp(mode,'spearman')||strcmp(mode,'correlation')||strcmp(mode,'cosine')||strcmp(mode,'hamming'))
        DistSpikesT(isnan(DistSpikesT)) = 1;
    end;
    %  First the  values are normalized 0-1 
    if max(max(DistSpikesT))>1
        DistSpikesT= DistSpikesT/max(max(DistSpikesT));
%     else
%         SimSpikesT= DistSpikesT;
    end;
%      t2=ones(1,numel(SimSpikesT));
%      SimSpikesT=t2-SimSpikesT;
    
    
    MDistSpikesT=squareform(DistSpikesT);
    MDistSpikes=squareform(DistSpikes);
    MSimSpikesT=ones(size(MDistSpikesT))-MDistSpikesT; %it is done an inversion of
    % values to represent similarity instead of distance
    MSimSpikes=ones(size(MDistSpikes))-MDistSpikes;
%     MSimSpikesT=squareform(SimSpikesT);
%     MSimSpikes=squareform(SimSpikes);
    
    x=sprintf('MSimSpikes_b%s_%s_%s',num2str(bs),mode,sd);
    xx=sprintf('MSimSpikesT_b%s_%s_%s',num2str(bs),mode,sd);
    xxx=sprintf('MDistSpikes_b%s_%s_%s',num2str(bs),mode,sd);
    xxxx=sprintf('MDistSpikesT_b%s_%s_%s',num2str(bs),mode,sd);
    assignin('base',x,MSimSpikes);
    assignin('base',xx,MSimSpikesT);
    assignin('base',xxx,MDistSpikes);
    assignin('base',xxxx,MDistSpikesT);  
    ss='.\files\distances\';
    s = ['save ' ss x '  MSimSpikes']; %save matrices in files in corresponding directory
    eval(s); 
    s = ['save ' ss xx '  MSimSpikesT']; %save matrices in files in corresponding directory
    eval(s);
    s = ['save ' ss xxx '  MDistSpikes']; %save matrices in files in corresponding directory
    eval(s);
    s = ['save ' ss xxxx '  MDistSpikesT']; %save matrices in files in corresponding directory
    eval(s);
end;


