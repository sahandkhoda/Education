
kvec=-N/2:N/2-1;

N=2*randi([5 8]);

x_vec = (0:N-1)/N;

f2_fun = @(x) cos(4*pi*x)/2 - 2*sin(6*pi*x);
fk2 = zeros(1,N);

for k = (-N/2):(N/2-1)
    
    for j = 1:N
        x_j = x_vec(j);
        fk2(k) = f2_fun(x_j) * exp(-2*pi*1i*k*x_j);
    end
    
    fk2 = (1/N) * fk2;
    
end

plot(xv,fv)
hold on