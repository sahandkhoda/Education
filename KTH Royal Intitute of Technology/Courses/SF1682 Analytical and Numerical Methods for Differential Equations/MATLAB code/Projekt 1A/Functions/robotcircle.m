% U2. CIRCULAR MOTION OF THE ROBOT

% === DESCRIPTION ===
% The acceleration is zero; the velocities are constant.
% The radius is the distance from the cirlce center to 
% the midpoint of the wheels.


% === CONSTANT VELOCITY ~ CIRCULAR MOTION ===
%   Tlap            : time for a full lap.
%   (xbar,ybar)     : center of circle.
%   R               : radius of circle.

%____________________________________________

function [xbar, ybar, R, Tlap] = robotcircle(b, wL, wR, x0, y0, theta0)

% === CONSTANTS ===
[~, B, ~, D] = ABCD(b, wL, wR, 0, 0);


% === TIME ONE LAP ===
% The absolute value of Tlap makes the robot go in the right direction.
theta = 2*pi;
Tlap = abs( (theta - theta0) / D );


% === CIRCLE CENTER ===
xbar = x0 - (B*sin(theta0)) / D; 
ybar = y0 + (B*cos(theta0)) / D;


% === RADIUS ===
R = abs(B/D);

end