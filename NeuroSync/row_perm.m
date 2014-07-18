function VVp = row_perm(VV)
%random row permutation
nneuron=size(VV,1);
rr=randperm(nneuron);
VVp=zeros(size(VV));
j=1;
for i=rr
    VVp(j,:)=VV(i,:);
    j=j+1;
end;
