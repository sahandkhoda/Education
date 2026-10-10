%% Uppgift 4a %%

clear
clc
close all

% === PARAMETERS ===
h          = 6.626*10^(-34);        % Planck's constant [J·s]
m_e        = 9.109*10^(-31);        % Electron rest mass [kg]
c          = 3*10^8;                % Speed of light [m/s]
theta_rad  = 0 : pi/12 : pi;        % Scatter angle [rad]
theta_deg  = rad2deg(theta_rad);    % Scatter angle [deg] (x-axis)
lambda_red = 630*10^(-9);           % Red light wavelength [m]

% Scattered wavelength
lambda_C = lambda_red + (h/(m_e*c)) * (1-cos(theta_rad));

% Difference in wavelength after Compton scattering
delta_lambda = lambda_C - lambda_red;

% === FIGURE ===

figure(1)
title('Compton Scattering Wavelength Shift as a Function of Scatter Angle')
xlabel('Angle, θ [deg]','FontSize', 13)
%ylabel('Scattered Wavelength, \lambda'' [m]', 'FontSize', 13);
ylabel('Wavelength Shift, Δ\lambda [m]', 'FontSize', 13);

hold on

plot(theta_deg,delta_lambda), grid on;

hold off

%% Uppgift 4b %%

clear
clc
close all

% === PARAMETERS ===

h         = 6.626*10^(-34);             % Planck's constant [J·s]
c         = 3*10^8;                     % Speed of light [m/s]
lambda    = (400:30:700)*10^(-9);       % Light wavelength [m]
f         = c ./ lambda;                % Light frequency [Hz]
eV        = 1.60218e-19;                % 1 electron volt in Joule [J]
phi_eV    = 1.22;                       % Work function Φ [eV]
phi_Joule = phi_eV * eV;                % Work function Φ [J]

% === CALCULATE ===
E_photon = h*f;
E_k_Joule = E_photon - phi_Joule;
E_k_eV = E_k_Joule / eV;

lambda_550nm = 550e-9;
frequency_550nm = c / lambda_550nm;
E_photon_550nm = h * frequency_550nm;
E_k_550nm_Joule = E_photon_550nm - phi_Joule;
E_k_550nm_eV = E_k_550nm_Joule / eV;
disp(['Kinetic Energy at 550 nm: ', num2str(E_k_550nm_eV), ' eV']);

% === FIGURE ===

figure(2)
title('Kinetic Energy of Electrons in Photoelectric Emission')
xlabel('Wavelength, \lambda [m]','FontSize', 13)
ylabel('Electron Energy, E_k [eV]', 'FontSize', 13);

hold on

plot(lambda,E_k_eV), grid on;

hold off


%% Uppgift 4c %%

clear
clc
close all

% === PARAMETERS ===

h         = 6.626*10^(-34);             % Planck's constant [J·s]
c         = 3*10^8;                     % Speed of light [m/s]
lambda    = (400:30:700)*10^(-9);       % Light wavelength [m]
f         = c ./ lambda;                % Light frequency [Hz]
eV        = 1.60218e-19;                % 1 electron volt in Joule [J]
phi_eV    = 2*10^3;                     % Work function Φ [eV]
phi_Joule = phi_eV * eV;                % Work function Φ [J]

% === CALCULATE ===
E_photon = h*f;
E_k_Joule = E_photon - phi_Joule;
E_k_eV = E_k_Joule / eV;

lambda_550nm = 550e-9;
frequency_550nm = c / lambda_550nm;
E_photon_550nm = h * frequency_550nm;
E_k_550nm_Joule = E_photon_550nm - phi_Joule;
E_k_550nm_eV = E_k_550nm_Joule / eV;
disp(['Kinetic Energy at 550 nm: ', num2str(E_k_550nm_eV), ' eV']);

% === FIGURE ===

figure(3)
title('Kinetic Energy of Electrons in Photoelectric Emission')
xlabel('Wavelength, \lambda [m]','FontSize', 13)
ylabel('Electron Energy, E_k [eV]', 'FontSize', 13);

hold on

plot(lambda,E_k_eV), grid on;

hold off