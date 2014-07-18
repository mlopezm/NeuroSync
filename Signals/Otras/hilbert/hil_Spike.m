 load VV1.mat
 s1=VV(5,:);
 s1s=zeros(size(s1));
 s1s(s1==30)=1;
 x=hilbert(s1s);
 xr=real(x);
 xi=imag(x);
 xabs=abs(x);
 xang=angle(x);
 polar(xang,xabs);
 xang=unwrap(angle(x));
 figure;
 subplot(2,1,1);plot(xang);title('Signal Angle');subplot(2,1,2);plot(xr);title('Signal');
 figure;
 subplot(2,1,1);plot(xabs);title('Signal Instantaneous Amplitude');subplot(2,1,2);plot(xr);title('Signal');
 figure;
 subplot(2,1,1);plot(xr);title('Signal real part of analytic signal');subplot(2,1,2);plot(xr);title('Signal');
 figure;
 subplot(2,1,1);plot(xi);title('Signal imaginary part of analytic signal');subplot(2,1,2);plot(xr);title('Signal');