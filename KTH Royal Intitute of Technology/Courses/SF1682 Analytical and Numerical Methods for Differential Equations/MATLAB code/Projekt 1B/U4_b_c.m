%% U4 Projekt 1B

close all; clear; clc; format short;

% === TIME ===

t_start = 0;
t_end   = 3;
tspan = [t_start, t_end];


% === INITIAL VALUES ===

% Position and velocity
z1     = 0;     z1prim = 0;
z2     = 0;     z2prim = 0;
z_initial = [z1, z2, z1prim, z2prim];


% === CONSTANTS ===

% Mass [kg]
m1 = 465;
m2 = 55;
m_vec = [m1,m2];

% Damping [kg/s]
c1 = 310;
c2 = 1250;
c_vec = [c1,c2];

% Stiffness [kg/s^2]
k1_ref = 5350;      k1 = k1_ref;
k2_ref = 136100;    k2 = k2_ref;
k_vec = [k1,k2];



% === EIGENVALUES AND EIGENVECTORS ===

% The coefficient matrix
H_mat = [
       0   ,      0      ,    1   ,     0       ;
       0   ,      0      ,    0   ,     1       ;
    -k1/m1 ,    k1/m1    , -c1/m1 ,   c1/m1     ;
     k1/m2 , (-k1-k2)/m2 ,  c1/m2 , (-c1-c2)/m2 ;
    ];

% Extract the eigenvalues
eigenvalues = eig(H_mat);

% Compute diagonal matrix
diagonalmatrix = diag(eigenvalues);

% Display the eigenvalues
disp('Eigenvalues of matrix A in a diagonal matrix');
disp(diagonalmatrix);

% Eigenvalues of matrix H:
%   lamda1 = -14.2045 +48.6619i
%   lamda2 = -14.2045 -48.6619i
%   lamda3 = -0.3106 + 3.3140i
%   lamda4 = -0.3106 - 3.3140i
% Note, the real part of the eigenvalues are all negative.

delta_t = zeros(length(eigenvalues) , 1);
for i = 1:length(eigenvalues)
    delta_t(i) = abs(2 * real(eigenvalues(i))) / (abs(eigenvalues(i))^2);
end

% Given we have two different sets of eigenvalues, 
% we get two "hmax" values. 
h_vec = [min(delta_t), max(delta_t)];       % TA REDA PÅ VARFÖR VI TAR MINSTA VÄRDET!!!!!
hmax = h_vec(1);
alfa_vec = [0.9 , 1 , 1.1 , 1.5];


% === ANONYMOUS FUNCTION ===

qc = @(t,z) quartercar(k_vec, c_vec, m_vec, t, z);


% EULER FORWARD

% Time step : 5e-3
[t_FE_09_vec, z_FE_09_mat] = EulerForward(qc, tspan, z_initial, hmax * alfa_vec(1));
    z1_FE_09 = z_FE_09_mat(:,1);
    z2_FE_09 = z_FE_09_mat(:,2);
    z3_FE_09 = z_FE_09_mat(:,3);
    z4_FE_09 = z_FE_09_mat(:,4);

% Time step : 5e-4
[t_FE_10_vec, z_FE_10_mat] = EulerForward(qc, tspan, z_initial, hmax * alfa_vec(2));
    z1_FE_10 = z_FE_10_mat(:,1);
    z2_FE_10 = z_FE_10_mat(:,2);
    z3_FE_10 = z_FE_10_mat(:,3);
    z4_FE_10 = z_FE_10_mat(:,4);

[t_FE_11_vec, z_FE_11_mat] = EulerForward(qc, tspan, z_initial, hmax * alfa_vec(3));
    z1_FE_11 = z_FE_11_mat(:,1);
    z2_FE_11 = z_FE_11_mat(:,2);
    z3_FE_11 = z_FE_11_mat(:,3);
    z4_FE_11 = z_FE_11_mat(:,4);

[t_FE_15_vec, z_FE_15_mat] = EulerForward(qc, tspan, z_initial, hmax * alfa_vec(4));
    z1_FE_15 = z_FE_15_mat(:,1);
    z2_FE_15 = z_FE_15_mat(:,2);
    z3_FE_15 = z_FE_15_mat(:,3);
    z4_FE_15 = z_FE_15_mat(:,4);


% === PLOT ===

% EULER FORWARD
% Time step : 5e-3
figure(1)
hold on
plot(t_FE_09_vec, z1_FE_09,'g')
plot(t_FE_10_vec, z1_FE_10,'black')
plot(t_FE_11_vec, z1_FE_11,'b')
plot(t_FE_15_vec, z1_FE_15,'r')
legend('0.9', '1.0', '1.1' ,'1.5');
title('Euler Forward z1')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');


figure(2)
hold on
plot(t_FE_09_vec, z2_FE_09,'green')
plot(t_FE_10_vec, z2_FE_10,'black')
plot(t_FE_11_vec, z2_FE_11,'blue')
plot(t_FE_15_vec, z2_FE_15,'red')
legend('0.9', '1.0', '1.1' ,'1.5');
title('Euler Forward z2')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');

figure(3)
hold on
plot(t_FE_09_vec, z1_FE_09,'g')
plot(t_FE_10_vec, z1_FE_10,'black')
plot(t_FE_11_vec, z1_FE_11,'b')
legend('0.9', '1.0', '1.1');
title('Euler Forward z1')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');


figure(4)
hold on
plot(t_FE_09_vec, z2_FE_09,'green')
plot(t_FE_10_vec, z2_FE_10,'black')
plot(t_FE_11_vec, z2_FE_11,'blue')
legend('0.9', '1.0', '1.1');
title('Euler Forward z2')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');

