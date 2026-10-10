
function [xRa, yRa] = NewtonRaphson(f, df, xRa0, n_it, tol)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

%xRa = zeros(n_it, 1);
xRa(1) = xRa0;
yRa(1) = f(xRa0);
for i = 2: n_it
    xRa(i,1) = xRa(i-1) - (f(xRa(i-1))/df(xRa(i-1))); %alla mina x-värden mha NR
    yRa(i,1) = f(xRa(i));

%Checka convergens
    if abs(yRa(i)) < tol
        break;
    end
end
end