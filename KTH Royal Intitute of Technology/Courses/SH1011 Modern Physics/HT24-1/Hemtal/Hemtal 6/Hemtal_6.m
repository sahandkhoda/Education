%% Question 2 b)

clc
clear
close all

% === PARAMETERS ===

c = 3*10^8;
e = 1.602*10^(-19);

% Conversion factors
eV_to_J = e;
J_to_eV = e^(-1);
u = 1.66053906660 * 10^(-27);

% Masses
m_Pa_230 = 230.034541 * u;
m_Th_230 = 230.033132 * u;
m_e = 0.00054857 * u;
m_v = 0;


% === CASE 1: BETA-MINUS DECAY ===

% Mass defect
m_initial_C1 = m_Th_230;
m_final_C1   = m_Pa_230 + m_e + m_v;

delta_m_C1 = m_initial_C1 - m_final_C1;
delta_E_C1 = delta_m_C1 * c^2;

delta_E_J_C1 = delta_E_C1;
delta_E_eV_C1 = delta_E_J_C1 * J_to_eV;


% === CASE 2: BETA-PLUS DECAY ===

% Mass defect
m_initial_C2 = m_Pa_230;
m_final_C2   = m_Th_230 + m_e + m_v;

delta_m_C2 = m_initial_C2 - m_final_C2;
delta_E_C2 = delta_m_C2 * c^2;

delta_E_J_C2 = delta_E_C2;
delta_E_eV_C2 = delta_E_J_C2 * J_to_eV;


% === CASE 3: ELECTRON CAPTURE ===
m_initial_C3 = m_Pa_230 + m_e;
m_final_C3   = m_Th_230 + m_v;

delta_m_C3 = m_initial_C3 - m_final_C3;
delta_E_C3 = delta_m_C3 * c^2;

delta_E_J_C3 = delta_E_C3;
delta_E_eV_C3 = delta_E_J_C3 * J_to_eV;


%% Question 4

clc
clear
close all

% === PARAMETERS ===

A0_Tc = 1100;               % Initial activity for 99mTc in MBq
A0_I = 300;                 % Initial activity for 123I in MBq
T_half_Tc = 6.02;           % Half-life of 99mTc in hours
T_half_I = 13.22;           % Half-life of 123I in hours

% Time vector
t_vec = 0:0.1:50;               % Time in hours (from 0 to 50 hours)

% Calculate the activity over time
A_Tc = A0_Tc * (0.5).^(t_vec/T_half_Tc);        % Activity for 99mTc
A_I = A0_I * (0.5).^(t_vec/T_half_I);           % Activity for 123I

% === FIGURE ===

figure(1)
title('Activity of 99mTc and 123I over time', 'FontSize', 14);
xlabel('Time (t) [h]', 'FontSize', 12);
ylabel('Activity (A) [MBq]', 'FontSize', 12);

hold on;
plot(t_vec, A_Tc, 'r-', 'LineWidth', 1);
plot(t_vec, A_I, 'b-', 'LineWidth', 1);
hold off;
legend('99mTc', '123I', 'Location', 'northeast');
grid on;