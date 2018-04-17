function PSNR=myPSNR(A,B)
A=double(A);
B=double(B);
[M,N]=size(A);
MSE=0;
for m=1:M
    for n=1:N
        MSE=MSE+(A(m,n)-B(m,n))^2;
    end
end
MSE=MSE/(M*N);
PSNR=10*log10(255*255/MSE);