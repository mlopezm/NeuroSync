 load VV1;
 s1s=VV(5,:);
 s1=zeros(size(s1s));
 s1(s1s==30)=1;
 s2s=VV(10,:);
 s2=zeros(size(s2s));
 s2(s2s==30)=1;
 x1=hilbert(s1);
 x2=hilbert(s2);
 x1i=imag(x1);
 x2i=imag(x2);

 d=atan2((x1i.*s2-s1.*x2i),((s1.*s2+x1i.*x2i)+eps));
 duw=unwrap(d); mduw=mean(abs(duw))
 dd=diff(duw); mdd=mean(abs(dd))
 ddd=diff(dd); mddd=mean(abs(ddd))
 figure;
 subplot(5,1,1);plot(s1);title('Signal 1');subplot(5,1,2);plot(s2);title('Signal 2');subplot(5,1,3);plot(duw);title('Phase difference');
 subplot(5,1,4);plot(dd);title('Difference of Phase difference ~ velocity');subplot(5,1,5);plot(ddd);title('Difference of Difference of Phase difference~acceleration');
 
load VV2;
 s1s=VV(5,:);
 s1=zeros(size(s1s));
 s1(s1s==30)=1;
 s2s=VV(240,:);
 s2=zeros(size(s2s));
 s2(s2s==30)=1;
 x1=hilbert(s1);
 x2=hilbert(s2);
 x1i=imag(x1);
 x2i=imag(x2);

 d=atan2((x1i.*s2-s1.*x2i),((s1.*s2+x1i.*x2i)+eps));
 duw=unwrap(d); mduw=mean(abs(duw))
 dd=diff(duw);  mdd=mean(abs(dd))
 ddd=diff(dd); mddd=mean(abs(ddd))
 figure;
 subplot(5,1,1);plot(s1);title('Signal 1');subplot(5,1,2);plot(s2);title('Signal 2');subplot(5,1,3);plot(duw);title('Phase difference');
 subplot(5,1,4);plot(dd);title('Difference of Phase difference ~ velocity');subplot(5,1,5);plot(ddd);title('Difference of Difference of Phase difference~acceleration');
 
 
 %using CUSUM
 cus=cumsum(duw);
 figure;
 plot(cus);title('CUS');
 
 
 
 