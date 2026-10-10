options = odeset('RelTol',1e-6, 'AbsTol',1e-8, 'Refine',1);
% General variables and values
    %position
    x0 = 0; y0 = 0; theta0 = 0;
    s0 = [x0, y0, theta0];
    
    % timing things
    tInit = 0;
    tEnd = 10;
    tspan = [tInit, tEnd];

% Variables and values for  U5a
aRa = 3; aLa = 3; b = 1; wLa = 5; wRa = 1;
%function
[ta, sa] = ode45(@(t, s) fvel(t, s, b, aLa, aRa, wLa, wRa), tspan, s0, options);
% primitives functions for sa
xa = sa(:, 1); ya = sa(:, 2);


% Variables and values for  U5b
aRb = 4; aLb = 2; b = 1; wLb = 3; wRb = 2;
%function
[tb, sb] = ode45(@(t, s) fvel(t, s, b, aLb, aRb, wLb, wRb), tspan, s0, options);
% primitives functions for sb
xb = sb(:, 1); yb = sb(:, 2);


% Variables and values for  U5c
aRc = 1; aLc = 3; b = 1; wLc = 1; wRc = 6;
%function
[tc, sc] = ode45(@(t, s) fvel(t, s, b, aLc, aRc, wLc, wRc), tspan, s0, options);
% primitives functions for sc
xc = sc(:, 1); yc = sc(:, 2);

%plots
plot(xa, ya, 'c');
axis('equal');
hold on;

plot(xb, yb, 'm');
axis('equal');
hold on;

plot(xc, yc,'g');
axis('equal'); 

%% We get 3 differents movement from the robot

%% movement a: is a clockwise movement and has a sort of constant circle 
% with a growing a radius because the acceleration is the same on for both 
% wheels but the intial velocities have a wider gap.

%% movement b: has a clockwise movement with stability in the radius because
% both of the values on the acceleration and the initial velocity on the 
% right wheels are higher than the left wheels the movements will be more 
% stables.

%% movement c: is a counter clockwise movement with less instability and 
% that can be the result off the dominating acceleration on one wheel and 
% the higher inintial velocity on the other.