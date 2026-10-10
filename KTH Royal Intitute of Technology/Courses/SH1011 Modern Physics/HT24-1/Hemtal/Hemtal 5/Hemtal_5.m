%% Uppgift 5 %%

clc
clear
close all

% === PARAMETERS ===
hbar = 1.055e-34;  % Planck's constant / 2pi [J*s]
m = 9.11e-31;      % Electron mass (kg)
k_B = 8.617e-5;    % Boltzmann's constant (eV/K)
E_F = 4.69;        % Fermienergy (eV)
T = 295;           % Temperature (K)

% Energy
E = linspace(0, 5, 1000);  % Energi between 0 och 5 eV

% The density of statees g(E)
g_E = (1 / (2 * pi^2)) * ((2 * m / hbar^2)^(3/2)) .* (E.^(1/2));

% The Fermi distribution f(E)
f_E = 1 ./ (exp((E - E_F) / (k_B * T)) + 1);

% The number of electrons per unit of energy g(E) * f(E)
n_E = g_E .* f_E;


% === FIGURE ===

figure (1);
title('Density of states and energy distribution of electrons in sodium', 'FontSize', 14);
xlabel('Energy (eV)', 'FontSize', 12);
ylabel('Density of states / number of electrons per unit of energy (eV^{-1})', 'FontSize', 12);

hold on

plot(E, g_E, 'k-', 'LineWidth', 2);
plot(E, n_E, 'g--', 'LineWidth', 2);
hold off;

legend('g(E)', 'g(E)f(E)', 'Location', 'Best');
grid on;
%xlim([0 5]);
%ylim([0 max(n_E) * 1.1]);
