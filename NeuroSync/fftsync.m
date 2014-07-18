function  Y2=fftsync(ima)

%plot FFT of matrix


imad=double(ima);
figure; imshow(imad,[min(min(imad)) max(max(imad))],'InitialMagnification',100); title(' ORIGINAL  Image');



%%%%FFT
 Y=fft2(imad);
 Y2=fftshift(Y);
 imaFFT_plot=log(abs(Y2)+0.1);  %aplicamos log para poder representarla
 figure; imshow(imaFFT_plot,[min(min(imaFFT_plot)) max(max(imaFFT_plot))],'InitialMagnification',100); title(' FFT Transformed Image');
 
 
% EnergiaIma=sum(sum(imad.^2));
% EnergiaImaFFT=sum(sum(Y2.^2));
end

