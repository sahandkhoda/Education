%% U2 Projekt 1B

% === DESCRIPTION ===
% This script plots the numerical solution for z1 and z2 as a function of
% time, using Euler forward and ODE45. The initial positions and velocities
% are assumed to be zero. If not given, necessary parameters are assumed.

% === PARAMETERS ===
%   qc          : "quartercar" function
%   tspan       : time vector (start and end values)
%   z_initial   : initial values
%   hmax        : maximum time step (before unstability)
%   factor      : factor to scale the time step


% === COMMENTS ===

% U2 a)

% The maximum output (see Figure 3):

%   (t1max, z1max) = (0.4113470 , 0.0251131)   
%   (t2max, z2max) = (0.0502843 , 0.2638250) 

% For the passengers, the change in height is barely noticed since the 
% spring connected to the car compartment (z1) moves relatively little in 
% comparingson with the spring that is in contact with the ground (z2).
% This is due to the higher stiffness (k1) and stronger damping (c1), 
% which can be observed as z1 takes much longer time to come back to its
% equilibrium state (initial positions).

% U2 b)

% In Figure 5, note that, since the plot converges, and thus there are 
% only little variation as the "t" value increases, the ODE45 function 
% automatically increases the time step. Compare Figure 4 and Figure 5.

% U2 c)

% Ranking the methods (see Figure 4):

%   1. FE (5e-4)
%   1. ODE45
%   1. FE (5e-3)

% Given that the bump height is H = 0.27, Figure 4 shows that the FE (5e-4)
% method has approximated the solution the closest. Note that there is a 
% trade-off between ACCURACY vs. EFFICIENCY. Although the ODE45 method is 
% not the most accurate, it is by far the most most of computationally 
% efficient while providing a good approximation. The FE (5e-3) method was, 
% as expected, the worst because of the longer time step.

% ____________________________________________

close all; clear; clc;

% === TIME INTERVAL ===

t_start = 0;
t_end   = 1.2;
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


% === DEFINING FUNCTIONS ===

qc = @(t,z) quartercar(k_vec, c_vec, m_vec, t, z);


% EULER FORWARD
%??????????????????????
% Given we have two different set of eigenvalues (lamda), 
% we get two "hmax" values.
hmax = [0.019726712 , 0.300433515];

% Time step : 5e-3
[t_FE_3_vec, z_FE_3_mat] = EulerForward(qc, tspan, z_initial, 5e-3);
    z1_FE_3 = z_FE_3_mat(:,1);
    z2_FE_3 = z_FE_3_mat(:,2);
    z3_FE_3 = z_FE_3_mat(:,3);
    z4_FE_3 = z_FE_3_mat(:,4);

% Time step : 5e-4
[t_FE_4_vec, z_FE_4_mat] = EulerForward(qc, tspan, z_initial, 5e-4);
    z1_FE_4 = z_FE_4_mat(:,1);
    z2_FE_4 = z_FE_4_mat(:,2);
    z3_FE_4 = z_FE_4_mat(:,3);
    z4_FE_4 = z_FE_4_mat(:,4);

% ODE45

options = odeset('RelTol', 1e-6,'Refine', 1, 'OutputSel',1);    % 'AbsTol',1e-8
odeoptions = odeset(options);

% Time step
timesteps = odeget(odeoptions, 'OutputS', 1);

[t_ODE45_vec, z_ODE45_mat] = ode45(qc, tspan, z_initial, options);
    z1_ODE45 = z_ODE45_mat(:,1);
    z2_ODE45 = z_ODE45_mat(:,2);
    z3_ODE45 = z_ODE45_mat(:,3);
    z4_ODE45 = z_ODE45_mat(:,4);


% === PLOT ===

% EULER FORWARD
% Time step : 5e-3
figure(1)
hold on
%subplot(2,2,1);
plot(t_FE_3_vec, z1_FE_3,'g')
plot(t_FE_3_vec, z2_FE_3,'b')
legend('z1', 'z2')
title('Euler Forward (time step : 5e-3)')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');

% EULER FORWARD
% Time step : 5e-4
figure(2)
hold on
plot(t_FE_4_vec, z1_FE_4,'g')
plot(t_FE_4_vec, z2_FE_4,'b')
legend('z1', 'z2')
title('Euler Forward (time step : 5e-4)')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');


% ODE45
figure(3)
hold on
plot(t_ODE45_vec, z1_ODE45,'g')
plot(t_ODE45_vec, z2_ODE45,'b')
legend('z1', 'z2')
title('ODE45')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');

% FE VS. ODE45
% Difference in "z2" between FE (5e-3) vs. FE (5e-4) vs. ODE45
figure(4)
hold on
plot(t_FE_3_vec, z2_FE_3,'b')
plot(t_FE_4_vec, z2_FE_4,'g')
plot(t_ODE45_vec, z2_ODE45,'r')
legend('FE (5e-3)', 'FE (5e-4)', 'ODE45')
title('Difference in "z2" between FE (5e-3) vs. FE (5e-4) vs. ODE45')
xlabel ('Tid [s]');
ylabel ('Höjd [m]');

% TIME STEP
% Plotting the timestep (automatically set by the called ODE45 method) 
% as a function of time.

%Tomt matris för h45
h45 = zeros(length(t_ODE45_vec),1);


for i = 1:length(t_ODE45_vec)-1 
 h45(i+1) = t_ODE45_vec(i+1)-t_ODE45_vec(i); 
end


figure(5)
hold on
plot(t_ODE45_vec, h45, 'b');
title('Time step of ODE45 as a function of time')
xlabel ('Tid [s]');
ylabel ('Time step [s]');

