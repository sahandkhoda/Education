%% COMPARISON OF DIFFERENT BLACK HOLE PROPERTIES

close all; clear; clc;



% Constants in appropriate units
h = 6.626e-27;          % Planck's constant in erg seconds
c = 3.0e10;             % Speed of light in cm/s
k = 1.38e-16;           % Boltzmann constant in erg/K
G = 6.674e-8;           % Gravitational constant in cm³/(g·s²)
h_bar = h / (2 * pi);   % Planck constant over 2*pi

% Define mass range in grams
mass = logspace(1, 36, 100);

% Calculate various properties

% Temperature vs Mass
temperature = (h * c^3) ./ (8 * pi * k * mass * G);

% Entropy vs Mass
entropy = (k * mass.^2) ./ (pi * h_bar * c);

% Schwarzschild radius vs Mass
schwarzschild_radius = (2 * G * mass) ./ c^2;

% Subplot 1: Temperature vs Mass
subplot(3, 1, 1);
loglog(mass, temperature);
xlabel('Mass (m) [g]');
ylabel('Temperature (T) [K]');
title('Temperature vs Mass');

% Subplot 2: Entropy vs Mass
subplot(3, 1, 2);
loglog(mass, entropy);
xlabel('Mass (m) [g]');
ylabel('Entropy');
title('Entropy vs Mass');

% Subplot 3: Schwarzschild radius vs Mass
subplot(3, 1, 3);
loglog(mass, schwarzschild_radius);
xlabel('Mass (m) [g]');
ylabel('Schwarzschild radius (R) [cm]');
title('Schwarzschild radius vs Mass');

% Adjust the spacing between subplots
sgtitle('Comparison of Different Black Hole Properties'); % Add a super title

% Display the plot