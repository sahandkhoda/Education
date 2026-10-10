% U5

% ____________________________________________

close all
clear
clc

% Given data
b = 1; % m
wR = 3; % m/s
wL = 1; % m/s
aL = 0.4; % m/s^2
R_bar = 1; % m
T = 1; % s
n_it = 200; % Maximum iterations
tol = 1e-8; % Tolerance
% Initial guess
xRa0 = 2.9;

%exakta anlytiska R
aR_exact = 1.2;

% Define your functions here
f = @(aR) (b*(aR *T + wR + T*aL +wL)) / (2 * (aR*T + wR - aL * T - wL)) - 1; % Your f function in terms of aR
df = @(aR) (b/2) * (T*(aR*T+wR-aL*T-wL) - T*(aR*T+wR+aL*T+wL))/((aR*T+wR-aL*T-wL)^2);% Your df function (derivative) in terms of aR
%df2 = @(aR) ((b*T)*(aL*T-wR))/((aR*T)-(aL*T)+wR-wL)^2;
%
% Solve using Newton-Raphson
[aR_values ,  yRa] = NewtonRaphson(f,df,xRa0,n_it,tol);
%[aR_values2 , yRa2] = NewtonRaphson(f,df2,xRa0,n_it,tol);

% Calculate the absolute errors
for k = 1 : length(aR_values)
    errorx(k) = abs(aR_exact - aR_values(k));

end

% Plot the absolute errors
figure;
%plot(errorx, '-o'); % Using a semilog plot to better capture exponential decay
%hold on
figure (1)
plot(aR_values,yRa);
%plot(aR_values2,yRa2,'m');
xlabel('Iteration');
ylabel('Absolute Error |f(aR)|');
title('Convergence of Newton-Raphson method');

grid on;

%kvadratisk konvergens
for k = 1 : length(errorx) - 1
    ratio(k) = errorx(k + 1) / errorx(k);
    ratio2(k) = errorx(k + 1) / (errorx(k)^2);
end

for k = 1 : length(errorx)-2
qvec(k) = log ( errorx(k+2)/errorx(k+1) ) / log( errorx(k+1)/errorx(k));
end




aR_values
yRa

%U.6.b

% Given data
b = 1; % m
wR = 3; % m/s
wL = 1; % m/s
aL = 0.4; % m/s^2
R_bar = 1; % m
T = 2; % s
n_it = 200; % Maximum iterations
tol = 1e-8; % Tolerance
% Initial guess
xRa0 = 2.9;

%exakta anlytiska R
aR_exact = 1.2;

% Define your functions here
f = @(aR) (b*(aR *T + wR + T*aL +wL)) / (2 * (aR*T + wR - aL * T - wL)) - 1; % Your f function in terms of aR
df = @(aR) (b/2) * (T*(aR*T+wR-aL*T-wL) - T*(aR*T+wR+aL*T+wL))/((aR*T+wR-aL*T-wL)^2);% Your df function (derivative) in terms of aR

% Solve using Newton-Raphson
[aR_values ,  yRa] = NewtonRaphson(f,df,xRa0,n_it,tol);
%[aR_values2 , yRa2] = NewtonRaphson(f,df2,xRa0,n_it,tol);
figure(2)
plot(aR_values, yRa);

%%%%%%%%%%%%%%%%%%%------------U5----------%%%%%%%%%%%%%%%%%%%%%%%%
options = odeset('RelTol',1e-6,'AbsTol', 1e-8, 'Refine',1);

x0 = 0; y0 = 0; theta0 = 0;
s0 = [x0, y0, theta0];

t_start = 0;
T_end = 2;
tspan = [t_start, T_end];

%U5a
aLa = 0.4; aRa = 1.2; wRa = 3; wLa = 1;
%funktionen 
[ta, sa] = ode45(@(t,s) fvel(t, s, b, aLa, aRa, wLa, wRa) ,tspan,s0,options);
xa = sa(:,1); 
ya = sa(:,2);

figure(3)
plot(xa, ya, 'b')
axis('equal');
legend('aR = aL, wR<wL');
grid off;

%Anledningen till varför rörelsemönstret bete sig så är för att vi har tre
%olika skilda rörelse vilkor