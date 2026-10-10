function [t_vec, V_mat] = ITM_old(k_vec, c_vec, m_vec, tspan, z0, delta_t)

m1 = m_vec(1); m2 = m_vec(2);
c1 = c_vec(1); c2 = c_vec(2);
k1 = k_vec(1); k2 = k_vec(2);


% The matrix
H_mat = ...
    [
       0   ,      0      ,    1   ,     0       ;
       0   ,      0      ,    0   ,     1       ;
    -k1/m1 ,    k1/m1    , -c1/m1 ,   c1/m1     ;
     k1/m2 , (-k1-k2)/m2 ,  c1/m2 , (-c1-c2)/m2 ;
    ];

% === TIME INTERVAL ===
t_start = tspan(1);
t_end   = tspan(2);
t_vec = (t_start : delta_t : t_end)';


% === CALCULATIONS ===
N = floor( (t_end - t_start) / delta_t );     % KOLLA ALTERNATIVT SKRIVSÄTT!!!

g_mat = zeros(N+1,4);

% for i = 1:N
% 
%     % Road height
v = 63/3.6;
H = 0.27;
L = 1.1;
%     [h, dhdt] = RoadHeight(t_vec(i), v, H, L);
%     % Constant vector
%     g_mat(i,:) = [0 , 0 , 0 , (k2*h + c2*dhdt)/m2];
% 
% end

V_mat = zeros(N+1,4);       % Creating the matrix
V_mat(1,:) = z0;            % Initialization

% qc_FE_mat = zeros(N+1,4); 

I = eye(4);
% 
% for i=1 :N
%     qc_FE_mat(i,:) = quartercar(k_vec, c_vec, m_vec, t_FE_vec(i), V_FE_mat(i,:));
%     qc_FE_mat(i+1,:) = quartercar(k_vec, c_vec, m_vec, t_FE_vec(i+1), V_FE_mat(i+1,:));
% 
%     V_FE_mat(i,:)
% end

for i = 1:N

    %[h, dhdt] = RoadHeight(t_vec(i), v, H, L);
    % Constant vector
    %g_mat(i,:) = [0 , 0 , 0 , (k2*h + c2*dhdt)/m2];

    [h, dhdt] = RoadHeight(t_vec(i), v, H, L);
    g_mat(i+1,:) = [0 , 0 , 0 , (k2*h + c2*dhdt)/m2];

    V_mat(i+1,:) = (I - delta_t/2 * H_mat) \ ((I + delta_t/2 * H ) * V_mat(i , :)' + delta_t/2 * (g_mat(i,:)')) ;

end






