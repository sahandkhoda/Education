%% ROAD VERTICAL POSITION
% 
% === DESCRIPTION ===
% This function returns the height (at a given time "t") and its 
% derivative with respect to time.

% === PARAMETERS ===
%   h       : vertical position of the road
%   dhdt    : derivative of "h" with respect to time "t"
%   t       : time parameter
%   H       : height of "gupp" [m]
%   L       : length of "gupp" [m]
%   v       : velocity [m/s]

% ____________________________________________

function [h, dhdt] = RoadHeight(t, v, H, L)

if t <= L/v

    h = (H/2) * (1 - cos(((2*pi*v*t)/L)));
    dhdt = (H*pi*v)/L * sin(((2*pi*v*t)/L));

else

    h = 0;
    dhdt = 0;

end

