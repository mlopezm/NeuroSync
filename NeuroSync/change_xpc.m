function VV = change_xpc(VV,pc)
%pc is the percentage of number of signals to be changed to the signal with
%the last signal in the ensemble
nneuron=size(VV,1);
r=randperm(nneuron-1);
lim=floor((nneuron-1)*pc/100);
rr=r(1,1:lim);
for i=rr
    VV(i,:)=VV(nneuron,:);
end;
