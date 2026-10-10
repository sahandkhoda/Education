%U1-2B

clear all; close all; clc;

alpha = 400;
PA = pi/5;
L = 1;

for j=1:5

    M_vec = [4 5 6 7 8];
    N = 2^M_vec(j);
    x_values = (0:N-1)/N;
    f_values = exp(-alpha*(x_values-PA).^2);

    
    %Beräknar koefficienterna
    fk = 1/N * fftshift(fft(f_values));
    kvec = (-N/2:N/2-1);

    %approx. av Df
    fprim = (1i*2*pi/L*kvec).*fk;
    fprimv = N*ifft(ifftshift(fprim));
    fprimv = real(fprimv);
    
    %approx. av D2f
    fbis = ((1i*2*pi/1*kvec).^2).*fk;
    fbisv = (N*ifft(ifftshift(fbis)));
    fbisv = real(fbisv);

    %Analytiska värden för derivator
    ana_fprim = -2*alpha*(x_values-PA).*exp(-alpha*(x_values-PA).^2);
    ana_fbis = ((-2*alpha*(x_values-PA)).^2-2*alpha).*exp(-alpha*(x_values-PA).^2);
    
    %beräknar felet
    e1 = abs(fprimv-ana_fprim);
    e2 = abs(fbisv-ana_fbis);

    %beräknar 2-norm 
    norm2_fprim(j) = sqrt((1/(N)) * sum(e1.^2));
    norm2_fbis(j) = sqrt((1/(N)) * sum(e2.^2));

    
    N_vec(j) = 2^M_vec(j);
end

figure(1)
loglog(N_vec, norm2_fprim, 'r');
hold on
loglog(N_vec, norm2_fbis, 'b');
xlabel('N värdet');
ylabel('Felet');
legend('Första derivatan', 'Andra derivatan');
