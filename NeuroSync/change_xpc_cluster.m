function VV = change_xpc_cluster(VV,pc)
%pc is the percentage of number of signals to be changed to the signal with
%the last signal in the ensemble
nneuron=size(VV,1);
% r=randperm(nneuron-1);
lim=floor((nneuron)*pc/100);
% rr=r(1,1:lim);
for i=1:lim
    VV(i,:)=VV(1,:);
end;
