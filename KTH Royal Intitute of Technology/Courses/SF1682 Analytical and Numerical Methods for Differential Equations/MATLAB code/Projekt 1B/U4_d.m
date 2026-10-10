% U4 Projekt 1B

close all; clear; clc; format long;

% === TIME ===

t_start = 0;
t_end   = 1.2;
tspan = [t_start, t_end];


% === INITIAL VALUES ===

% Position and velocity
z1     = 0;     z1prim = 0;
z2     = 0;     z2prim = 0;
z_initial = [z1, z2, z1prim, z2prim];


% === CONSTANTS ===

% Mass
m1 = 465;           % kg
m2 = 55;            % kg
m_vec = [m1,m2];

% Damping
c1 = 310;           % kg/s
c2 = 1250;          % kg/s
c_vec = [c1,c2];

% Stiffness
k1_ref = 5350;      k1 = k1_ref;        % kg/s^2
k2_ref = 136100;    k2 = 100*k2_ref;    % kg/s^2
k_vec =  [k1,k2];



% === EIGENVALUES AND EIGENVECTORS ===

H_mat = ...
    [
       0   ,      0      ,    1   ,     0       ;
       0   ,      0      ,    0   ,     1       ;
    -k1/m1 ,    k1/m1    , -c1/m1 ,   c1/m1     ;
     k1/m2 , (-k1-k2)/m2 ,  c1/m2 , (-c1-c2)/m2 ;
    ];


% Compute diagonal matrix
eigenvalues = eig(H_mat);

% Extract the eigenvalues
diagonalmatrix = diag(eigenvalues);

% Display the eigenvalues
disp('Eigenvalues of matrix A:');
disp(diagonalmatrix);

delta_t = zeros(length(eigenvalues) , 1);
for i = 1:length(eigenvalues)
    delta_t(i) = abs(2 * real(eigenvalues(i))) / (abs(eigenvalues(i))^2);
end
hmax = [min(delta_t), max(delta_t)];
faktor = 0.1;
delta_t_max = hmax(1) * faktor;


% === FUNCTION ===
qc = @(t,z) quartercar(k_vec, c_vec, m_vec, t, z);

% EULER FORWARD

% Time step : 5e-3
[t_FE_vec, z_FE_mat] = EulerForward(qc, tspan, z_initial, delta_t_max);
    z1_FE = z_FE_mat(:,1);
    z2_FE = z_FE_mat(:,2);
    z3_FE = z_FE_mat(:,3);
    z4_FE = z_FE_mat(:,4);


% === PLOT ===

% EULER FORWARD
figure(1)
hold on
plot(t_FE_vec, z1_FE,'r')
plot(t_FE_vec, z2_FE,'b')
legend('z1', 'z2');
title('Euler Forward Z1 & Z2')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');

