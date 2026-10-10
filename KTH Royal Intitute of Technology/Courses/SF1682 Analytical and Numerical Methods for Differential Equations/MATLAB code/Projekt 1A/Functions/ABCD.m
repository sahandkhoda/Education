% ABCD

% === DESCRIPTION ===
% This function defines the constants A, B, C, D.
% ____________________________________________

function [A, B, C, D] = ABCD(b, wL, wR, aL, aR)

A = (aR + aL) / 2;
B = (wR + wL) / 2;
C = (aR - aL) / (2*b);
D = (wR - wL) / b;

end