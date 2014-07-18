function d = hilbertdist(u,V)
%hilbert distance between a vector u and a matrix V
uh=hilbert(u);
Vh=hilbert(V')';
uhi=imag(uh);
Vhi=imag(Vh);
m=size(V,1);
d=zeros(m,1);
for i=1:m
    d1=atan2((uhi.*V(i,:)-u.*Vhi(i,:)),((u.*V(i,:)+uhi.*Vhi(i,:))+eps));
    d2=unwrap(d1); 
    dm=mean(abs(d2));
    d(i)=dm;
end

end
