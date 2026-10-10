close all; clear; clc; format long;


% Newton-Raphsons method
cs = 1;
ck = 0.7;

faktor = 1/10; % mellan 1/200 OCH 1/300 KONVERGERAR mot felvärde (både)

k1 = 5350;
k2 = 136100;
k0vec = [k1 k2];

J = @(k1,k2) Jacobian_transfer_functions(k1,k2);
F = @(k1,k2) transfer_functions(k1,k2,ck,cs);

tolerance = 1e-6;
maxiter = 500;


solmat = zeros(maxiter,2);
solmat(1,:) = k0vec;


iterdiff = 1 ;
itercount = 1;


    
while (iterdiff > tolerance) && (itercount < maxiter)
    s = J(solmat(itercount,1), solmat(itercount,2))\F(solmat(itercount,1), solmat(itercount,2));
    solmat(itercount+1,:) = solmat(itercount,:) - s';

    iterdiff = norm(solmat(itercount,:) - solmat(itercount+1, :));
    itercount = itercount + 1;
    
end


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
k1 = solmat(itercount,1);        % kg/s^2
k2 = solmat(itercount,2);        % kg/s^2
k_vec =  [k1,k2];


% === FUNCTION ===
qc = @(t,z) quartercar(k_vec, c_vec, m_vec, t, z);

% ODE45 givna k värden
options = odeset('RelTol', 1e-6,'Refine', 1, 'OutputSel',1);           % 'AbsTol',1e-8
odeoptions = odeset(options);
timesteps = odeget(odeoptions, 'OutputS', 1);

[t_ODE45_vec, z_ODE45_mat] = ode45(qc, tspan, z_initial, options);
    z1_ODE45 = z_ODE45_mat(:,1);
    z2_ODE45 = z_ODE45_mat(:,2);
    z3_ODE45 = z_ODE45_mat(:,3);
    z4_ODE45 = z_ODE45_mat(:,4);

% ODE45 ref
kref1 = 5350;          % kg/s^2
kref2 = 136100;        % kg/s^2
kref_vec =  [kref1,kref2];

qc1 = @(t,z) quartercar(kref_vec, c_vec, m_vec, t, z);

% ODE45
options = odeset('RelTol', 1e-6,'Refine', 1, 'OutputSel',1);           % 'AbsTol',1e-8
odeoptions = odeset(options);
timesteps = odeget(odeoptions, 'OutputS', 1);

[t_ODE45_vec1, z_ODE45_mat1] = ode45(qc1, tspan, z_initial, options);
    z1_ODE451 = z_ODE45_mat1(:,1);
    z2_ODE451 = z_ODE45_mat1(:,2);
    z3_ODE451 = z_ODE45_mat1(:,3);
    z4_ODE451 = z_ODE45_mat1(:,4);


figure(1)
hold on
plot(t_ODE45_vec, z1_ODE45,'r')
plot(t_ODE45_vec1, z1_ODE451,'b')
legend( 'ODE45','ODEref')
title('Difference in "z1" between ODE45 med olika fjärderkonstanter')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');



