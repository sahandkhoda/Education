%% SCHWARZSCHILD RADIUS VS. MASS

close all; clear; clc;

figure(1)

mass = logspace(0, 36, 1000);  % Vary mass from 1 to 10^36
schwarzschild_radius = 2 * mass / (3e8)^2;  % Using Equation (2)
loglog(mass, schwarzschild_radius);

title('Schwarzschild Radius vs. Mass');
xlabel('Mass (grams)');
ylabel('Schwarzschild Radius (cm)');

%% TEMPERATURE OF A PLANCK MASS BLACK HOLE VS. MASS BLACK HOLE

close all; clear; clc;

figure(2)

mass = logspace(-5, 5, 1000);  % Vary mass logarithmically
temperature = 1 ./ (8 * pi * mass);  % Using Equation (14)
loglog(mass, temperature);

title('Temperature of a Planck Mass Black Hole vs. Mass');
xlabel('Mass');
ylabel('Temperature');

%% HAWKING-BEKENSTEIN DECAY TIME VS. MASS

close all; clear; clc;

figure(3)

mass = logspace(0, 36, 1000);  % Vary mass from 1 to 10^36
decay_time = mass;  % Using Equation (18)
loglog(mass, decay_time);

title('Hawking-Bekenstein Decay Time vs. Mass');
xlabel('Mass (grams)');
ylabel('Decay Time (seconds)');

%% GRAPHENE BEHAVIOR IN TWO DIMENSIONS

close all; clear; clc;

figure(4)

x = linspace(-pi, pi, 1000);
y = cos(x);  % Using Equation (20) as an example
plot(x, y);

title('Graphene Behavior in Two Dimensions');
xlabel('X');
ylabel('Y');

%% Plot 3D surface

close all; clear; clc;

% Define mass range
mass = logspace(1, 36, 100);

% Calculate Schwarzschild radius using Equation (2)
schwarzschild_radius = 2 * mass / (3e8)^2;

% Plot 3D surface
figure(5);

surf(mass, schwarzschild_radius, zeros(size(mass)), 'EdgeColor', 'none');

title('Black Hole Mass and Schwarzschild Radius Relationship');
xlabel('Mass (grams)');
ylabel('Schwarzschild Radius (cm)');
zlabel('Placeholder');

%% NUMBER OF PLACK OSCILLATORS VS MASS
% Define mass range
mass = logspace(1, 36, 100);

% Calculate number of Planck oscillators using Equation (12)
planck_oscillators = mass ./ (pi * (1.6e-35)^2);

% Create bar chart
figure;
bar(log10(mass), log10(planck_oscillators));
title('Number of Planck Oscillators vs. Mass');
xlabel('Log(Mass)');
ylabel('Log(Number of Planck Oscillators)');

%% GRAPHENE BEHAVIOR SIMULATION

close all; clear; clc;

% Generate graphene behavior
x = linspace(-pi, pi, 1000);
y_graphene = cos(x);  % Using Equation (20) as an example

% Generate neutrino equation behavior
y_neutrino = sin(x);

% Plot comparison
figure;
plot(x, y_graphene, 'DisplayName', 'Graphene');
hold on;
plot(x, y_neutrino, 'DisplayName', 'Neutrino Equation');
legend('Location', 'best');
title('Graphene Behavior vs. Neutrino Equation');
xlabel('X');
ylabel('Y');

%% 

% Constants
h_bar = 1.0545718e-34;  % Planck constant / (2*pi) in J*s
c = 299792458;          % Speed of light in m/s
k = 1.380649e-23;       % Boltzmann constant in J/K
G = 6.67430e-11;        % Gravitational constant in m^3/kg/s^2

% Define a range of mass values
mass_values = logspace(0, 36, 1000);  % Mass values up to 10^36

% Calculate entropy based on the relation S = (k * c * A) / (4 * h_bar * G)
area = (mass_values.^2) / (4 * pi * G);  % Assuming Schwarzschild black hole for simplicity
entropy_mass = (k * c * area) / (4 * h_bar * G);

% Plot entropy as a function of mass
figure;
loglog(mass_values, entropy_mass, 'LineWidth', 2);
xlabel('Mass');
ylabel('Entropy');
title('Entropy as a function of Mass for a Black Hole');
grid on;

%%

% Define a range of area values
area_values = logspace(0, 80, 1000);  % Area values for the black hole

% Calculate entropy based on the relation S = (k * c * A) / (4 * h_bar * G)
entropy_area = (k * c * area_values) / (4 * h_bar * G);

% Plot entropy as a function of area
figure;
loglog(area_values, entropy_area, 'LineWidth', 2);
xlabel('Area');
ylabel('Entropy');
title('Entropy as a function of Area for a Black Hole');
grid on;