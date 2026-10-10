% U3 d)


% EULER FORWARD METHOD

% (+1) Simplicity
% Euler's method is easy to implement and understand, while the RK4
% method requires more theoretical knowledge.

% (+2) Low computational cost
% The FE method is computationally efficient when dealing with simple 
% problems or very small time steps because it involves only simple 
% arithmetic operations (addition and multiplication).

% (+3) Explicit method
% Since the Euler's method uses the previous value to calculate the next,
% the explicit property is advantageous in certain cases.

% (-1) Accuracy
% Euler's method is a first-order method, which means that its local error
% (the error between the numerical solution and the true solution at one 
% step) is proportional to the step size. This makes it less accurate for
% solving ODEs with rapid changes or stiff behavior.

% (-2) Stability
% It can be numerically unstable when dealing with stiff ODEs or systems 
% with rapidly changing dynamics. Stiffness often requires very small time
% steps for stability, which can be computationally expensive.


% RUNGE-KUTTA OF ORDER 4

% (+1) Accuracy
% RK4 is a fourth-order method, which means that it has a higher level of
% accuracy compared to Euler's method. It provides more accurate
% approximations, especially when using small time step sizes.

% (+2) Stability
% This method is generally more stabel than Euler's method and can handle 
% a wider range of step sizes without encountering stability issues.

% (-1) Complexity
% RK4 is more computationally intensive thn Euler's method because it
% involves multiple evaluations of the right-hand side of the ODE at each
% time step.


% === CONCLUSION: Accuracy vs. Efficiency ===

% Obviously, for any approximating method, the accuracy increases 
% with the number of calculations (n) and decreasing time step (h).

% In summary, Euler's method is simple and computationally efficient but
% lacks accuracy and stability for certain types of ODEs. On the other
% hand, RK4 offers better accuracy and stability, making it a more robust
% choice for a wider range of ODEs, but it comes at the cost of increased
% computational complexity.

% The RK4 method does not require as little time step (h) as the Euler 
% Forward method in order to be accurate. However, the RK4 method is not
% not as energy- and time efficient, since it has to do more calculations.
% For smaller time steps, the FE method is more accurate.

% ____________________________________________

close all; clear; clc;


% === CONSTANTS ===
[b, wL, wR, aL, aR] = StartValues();
[A, B, C, D] = ABCD(b, wL, wR, aL, aR);


% === INITIAL VALUES ===
% Set specifically for circle center at (0,0).
x0 = 0; y0 = 1.5; theta0 = 0;
s0 = [x0, y0, theta0];


% === CENTER OF SHAPE ===
[xbar, ybar, R, Tlap] = robotcircle(b, wL, wR, x0, y0, theta0);


% === TIME INTERVAL ===
t_start = 0;
t_end = Tlap;
tspan = [t_start, t_end];


% === NUMBER OF CALCULATIONS ===
n = [100, 1000];


% === FUNCTION ===
f = @(t,s) fvel_row_vec(t, s, b, wL, wR, aL, aR);


% === x- AND y-VALUES FOR EACH PLOT ===

% Euler forward (FE)
[tFE, sFE] = EulerForward(f, tspan, s0, n(1));
xFE = sFE(:,1);
yFE = sFE(:,2);

% Euler forward (FE1000)
[tFE1000, sFE1000] = EulerForward(f, tspan, s0, n(2));
xFE1000 = sFE1000 (:,1);
yFE1000 = sFE1000 (:,2);

% Runge-Kutta 4 (RK4)
[tRK4, sRK4] = RK4(f, tspan, s0, n(1));
xRK4 = sRK4(:,1);
yRK4 = sRK4(:,2);


% === PLOT ===

% All plots in the same figure
figure(1)
hold on
axis('equal')
grid on

% Labels
title('Motion of the Robot', 'FontSize', 12)
xlabel('Position (x)')
ylabel('Position (y)')

% Ploting the graphs
plot(xFE, yFE, 'r')
plot(xFE1000, yFE1000, 'g')
plot(xRK4, yRK4, 'b')

% Legend
legend('FE','FE1000','RK4');

% Circle center
text(xbar, ybar, '(0,0)', 'Color', 'b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle')

% Direction arrow (right)
RightArrow = '\rightarrow';
text(x0, y0, RightArrow, "FontSize", 20 , 'Color', 'r', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom')


% === DISPLAY ===

% Display text in the Command Window
disp('STARTING POINT')
disp(['(x0,y0) = (', num2str(x0),   ' , ', num2str(y0),  ')'])
fprintf('\n')
disp('CIRCLE CENTER')
disp(['(xbar,ybar) = (', num2str(xbar),   ' , ', num2str(ybar),  ')'])
fprintf('\n')
disp('RADIUS')
disp(['R = ', num2str(R)])
