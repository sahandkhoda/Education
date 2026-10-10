% DERIVATIVE FUNCTION

% === DESCRIPTION ===
% Given a vector s = [x(t), y(t), theta(t)] at a time "t", this function
% returns the derivative (of each element) with respect to time.

% ____________________________________________

function ds = fvel_col_vec(t, s, b, wL, wR, aL, aR)

% === CODE FOR COMPUTING ===
% t=0.2; s=[0.9, -0.2, 0.32]; b=1; aL=1; aR=0.8; wL=0.5; wR=0.8;


% === CONSTANTS ===
[A, B, C, D] = ABCD(b, wL, wR, aL, aR);

% === THETA ANGLE ===
theta = s(3,1);
theta0 = theta - C*t^2 - D*t;


% === DERIVATIVES OF EACH ELEMENT ===
dxdt = (A*t + B) * cos(C*t^2 + D*t + theta0);
dydt = (A*t + B) * sin(C*t^2 + D*t + theta0);
dthetadt = 2*C*t + D;

% === THE ROW VECTOR TO BE RETURNED ===
ds = [dxdt; dydt; dthetadt];

end