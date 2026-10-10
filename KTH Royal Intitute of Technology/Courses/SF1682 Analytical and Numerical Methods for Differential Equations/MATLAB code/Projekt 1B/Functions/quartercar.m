
%% QUARTER CAR METHOD (QC)

% === DESCRIPTION ===
% By assigning new variables, this script rewrites the motion equations
% into a system of differential equations of the first order with respect 
% to time. The vector "dvdt" contains the derivatives of the column vector
% "v", provided as a parameter. Every row in the [(N+1) X 4] matrix "dvdt"
% is of the form: [z1(t) , z2(t) , z1prim(t) , z2prim(t)].

% === PARAMETERS ===
%   m_vec       : mass vector
%   c_vec       : damping vector
%   k_vec       : stiffness vector
%   t           : time parameter
%   z_vec       : vector of position and velocity
%   v_vec       : vector with newly assigned variables
%   H_mat       : coefficient matrix
%   g_vec       : vector with constant values

% ____________________________________________

function dvdt = quartercar(k_vec, c_vec, m_vec, t, z_vec)

% Vectors of constants
m1 = m_vec(1); m2 = m_vec(2);
c1 = c_vec(1); c2 = c_vec(2);
k1 = k_vec(1); k2 = k_vec(2);

% Defining values for the "v_vec"-vector
z1 = z_vec(1);  z1prim = z_vec(3);
z2 = z_vec(2);  z2prim = z_vec(4);

% Assigning new variables
u1 = z1;    u2 = z1prim;
v1 = z2;    v2 = z2prim;

% Road height
v = 63/3.6;
H = 0.27;
L = 1.1;
[h, dhdt] = RoadHeight(t, v, H, L);

% The column vector
v_vec = [u1 ; v1 ; u2 ; v2];

% The matrix
H_mat = ...
    [
       0   ,      0      ,    1   ,     0       ;
       0   ,      0      ,    0   ,     1       ;
    -k1/m1 ,    k1/m1    , -c1/m1 ,   c1/m1     ;
     k1/m2 , (-k1-k2)/m2 ,  c1/m2 , (-c1-c2)/m2 ;
    ];

% Constant vector
g_vec = [0 ; 0 ; 0 ; (k2*h + c2*dhdt)/m2];

% Matrix-vector-form
dvdt = H_mat * v_vec + g_vec;

end