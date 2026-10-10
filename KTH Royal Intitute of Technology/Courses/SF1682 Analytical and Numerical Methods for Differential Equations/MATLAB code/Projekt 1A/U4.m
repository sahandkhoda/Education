% U4

% === DESCRIPTION ===
% 

% ____________________________________________

close all
clear
clc

% === CONSTANTS ===
b=1; wL=4; wR=2; aL=0; aR=0;
[A, B, C, D] = ABCD(b, wL, wR, aL, aR);


% === INITIAL VALUES ===
x0 = -1.0483; y0 = -0.4684; theta0 = 0;
s0 = [x0, y0, theta0];


% === CENTER OF SHAPE ===
[xbar, ybar, R, Tlap] = robotcircle(b, wL, wR, x0, y0, theta0);


% === TIME INTERVAL ===
t_start = 0;
t_end = Tlap;
tspan = [t_start, t_end];


% === ANALYTICAL VALUES ===
n = 33;
s_an = s_analytic(tspan, x0, y0, B, D, theta0, n);
    x_an = s_an(:,1);
    y_an = s_an(:,2);

% === ODE45 FUNCTION ===
f = @(t,s) fvel_col_vec(t, s, b, wL, wR, aL, aR);
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8, 'Refine', 1);
[t_ODE, s_ODE] = ode45(f, tspan, s0, options);
    x_ODE = s_ODE(:,1);
    y_ODE = s_ODE(:,2);
    theta = s_ODE(:,3);

% === ERROR ===
error_x = abs(x_ODE - x_an);
error_y = abs(y_ODE - y_an);


% === FIGURE 1 ===

% Analytical and approximated circles
figure(1)
hold on
axis('equal')
grid on

% Labels
title('Motion of the Robot', 'FontSize', 12)
xlabel('Position (x)')
ylabel('Position (y)')

% Ploting the graphs
plot(x_an, y_an, 'bo')
plot(x_ODE, y_ODE, 'r')
legend('Analytical','ODE45')


% === FIGURE 2 ===

% Error for x and y
figure(2)
hold on
axis('equal')
grid on

% Labels
title('Error as a function of time', 'FontSize', 12)
xlabel('Time (s)')
ylabel('Error ')

plot(t_ODE, error_x, 'b')
plot(t_ODE, error_y, 'g')
legend('Error x', 'Error y')


% === NUMBER OF STEPS ===
N = size(x_ODE,1)-1;
disp(['Number of steps : n = ', num2str(N)])

