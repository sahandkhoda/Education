%% Uppgift 4 %%

clc
clear
close all

% === PARAMETERS ===

L = 0.4e-9;                         % Box width [m]
x = linspace(0,L,1000);             %  [m]
h_bar = (6.63e-34) / (2*pi);        %  [J*s]


m = 9.1e31; %[kg]

% Energy levels
E_1 = (1*pi*h_bar)^2/(2*m*L^2);
E_2 = (2*pi*h_bar)^2/(2*m*L^2);
E_3 = (3*pi*h_bar)^2/(2*m*L^2);

% Stationära tillstånd och kontroll av normalisering
psi_1 = sqrt(2/L) * sin(1*pi*x/L);
norm1 = trapz(x,(abs(psi_1)).^2);
psi_2 = sqrt(2/L) * sin(2*pi*x/L);
norm2 = trapz(x,(abs(psi_2)).^2);
psi_3 = sqrt(2/L) * sin(3*pi*x/L);
norm3 = trapz(x,(abs(psi_3)).^2);


% === FIGURE ===

figure(1)
title('Particle in a box - three first stationaty states')
xlabel('Position, x [m]')
ylabel('Wave function \psi')

hold on
plot(x,psi_1, 'LineWidth',2)
plot(x,psi_2, 'LineWidth',2)
plot(x,psi_3, 'LineWidth',2)
hold off
legend('\psi_1','\psi_2','\psi_3', 'fontsize' , 25 ,'Location','southwest')
grid on