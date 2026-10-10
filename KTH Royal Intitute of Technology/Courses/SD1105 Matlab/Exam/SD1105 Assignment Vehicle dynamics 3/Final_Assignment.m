clc, clear, close all;

%=========================================================================
% === PARAMETRIC VALUES ===
%=========================================================================

% Four Degree-of-Freedom Model (Figure 1)

m1 = 850;                       % rigid body [kg]
J = 1050;                       % mass moment of inertia [kg·m^2]
m2 = 50; m3 = m2;               % two-point masses [kg]

L = 2.5;                        % wheelbase dimension [m]
p = 0.5;                        % scaling factor

k1 = 500e3; k2 = 18e3; k3 = k2; % Spring constants, F_spring = kz [N/m]
c1 = 0; c2 = 500; c3 = c2;      % Damping coefficients, F_damp = c·dz/dt [Ns/m]

% Quarter Car Model (Figure 2)

m = 425;    m_t = 50;           % [kg]
k = 18e3;   k_t = 500e3;        % [N/m]
c = 500;    c_t = 0;            % [Ns/m]

% Roadway Surface (Figure 1)

wavelength = 16;                % wavelength [m]
zeta_amp = 0.04;                % roadway roughness magnitude [m]



%=========================================================================
% === FUNCTIONS ===
%=========================================================================

% stiffness matrix (4D vs. 2D)
K_mat_fun = @(k_vec, p, L) K_mat_fun(k_vec, p, L);

% mass (diagonal) matrix
M_mat_fun = @(m_vec) M_mat_fun(m_vec);

% damping matrix
C_mat_fun = @(c_vec, p, L) C_mat_fun(c_vec, p, L);

% excitation force vector (4D vs. 2D)
F_vec_fun = @(dim, k, omega_vec, c, zeta_amp, L, wavelength) ...
    F_vec_fun(dim, k, omega_vec, c, zeta_amp, L, wavelength);

% absolute displacement vectors
z_amp_vecs_fun = @(LENGTH, DIMENSION, K, M, C, f, omega_vec) ...
    z_amp_vecs_fun(LENGTH, DIMENSION, K, M, C, f, omega_vec);



%=========================================================================
% === SUB-TASK 1 ===
%=========================================================================

data = load('bil0403.dat');         % data read from file
V_kmph_vec = data(:,1);             % speed vector [km/h]
V_mps_vec = V_kmph_vec / 3.6;       % speed vector [m/s]
V_length = length(V_kmph_vec);      % speed vector length


% === Four Degree-of-Freedom Model (Figure 1) ===

% DOFs absolute amplitudes, [z_amp_1, z_amp_2, z_amp_3, theta_amp]
%   z_amp_1   : absolute displacement [m] of chassis mass (center of gravity)
%   z_amp_2   : absolute displacement [m] of rear wheel
%   z_amp_3   : absolute displacement [m] of front wheel
%   theta_amp : absolute rotation [rad] of car
z_amp_DOF_vecs_1 = data(:, 2:5);


% === Quarter Car Model (Figure 2) ===

frequency_vec = V_mps_vec/wavelength;   % frequency [Hz = 1/s]
omega_vec = 2*pi*frequency_vec;         % circular frequency [Hz = 1/s]

K_QC_mat = K_mat_fun([k, k_t], p, L);   % 2D stiffness matrix
M_QC_mat = M_mat_fun([m, m_t]);         % 2D mass matrix
C_QC_mat = C_mat_fun([c, c_t], p, L);   % 2D damping matrix

% QC absolute amplitudes, [z_amp, z_amp_t]
%   z_amp   : absolute displacement [m] of 1/4-chassis mass
%   z_amp_t : absolute displacement [m] of tire
% NOTE: the 2D excitation force is constant, i.e., no force vector is needed.
F_QC_vec = F_vec_fun(2, k_t, omega_vec, c_t, zeta_amp, L, wavelength);
z_amp_QC_vecs = z_amp_vecs_fun( ...
    V_length, 2, K_QC_mat, M_QC_mat, C_QC_mat, F_QC_vec, omega_vec ...
);


% === Comparison ===

% z1 vs. z
z1_amp_vec = z_amp_DOF_vecs_1(:,1);     % chassis mass (center of gravity)
z_amp_vec = z_amp_QC_vecs(:,1);         % 1/4-chassis mass

z_amp_dif_1_vec = z1_amp_vec - z_amp_vec;

% z_t vs. z2 & z3
z2_amp_vec = z_amp_DOF_vecs_1(:,2);     % rear wheel
z3_amp_vec = z_amp_DOF_vecs_1(:,3);     % front wheel
z_amp_t_vec = z_amp_QC_vecs(:,2);       % tire

z_amp_dif_2_vec = z2_amp_vec - z_amp_t_vec;
z_amp_dif_3_vec = z3_amp_vec - z_amp_t_vec;

% z difference (of vectors) matrix
z_amp_dif_vecs = [z_amp_dif_1_vec, z_amp_dif_2_vec, z_amp_dif_3_vec];


% === Maximum of |z1_amp_vec| ===

disp('=== Sub-Task 1 ===')
disp(' ');

[z1_amp_max, z1_amp_max_index] = max(z1_amp_vec);

disp('--- Maximum of |z1_amp_vec| ---')

disp(['Index : ', num2str(z1_amp_max_index)])

disp([ ...
    'Value : z1_amp_vec(', num2str(z1_amp_max_index) , ...
    ') = ', ...
    num2str(z1_amp_max), ' [m]'
])

z1_amp_max_V = V_mps_vec(z1_amp_max_index);
disp([ ...
    'Speed : V(', ...
    num2str(z1_amp_max_index), ...
    ') = ', ...
    num2str(z1_amp_max_V, '%.2f'), ' [m/s]' ...
])

disp(' ');
disp(' ');

% === Ratio : |z|/|z1| ===

ratio_z_vs_z1_vec = z_amp_vec./z1_amp_vec;



%=========================================================================
% === SUB-TASK 2 ===
%=========================================================================

K_DOF_mat_1 = K_mat_fun([k1, k2, k3], p, L);    % 4D stiffness matrix
M_DOF_mat_1 = M_mat_fun([m1, m2, m3, J]);       % 4D mass matrix
C_DOF_mat_1 = C_mat_fun([c1, c2, c3], p, L);    % 4D damping matrix

% the eigenvalue problem
[eigvectors_DOF_vecs, eigenvalues_DOF_mat] = eig(K_DOF_mat_1, M_DOF_mat_1);
eigenvalues_DOF_vec = diag(eigenvalues_DOF_mat);
eigenfrequencies_DOF_vec = sqrt(eigenvalues_DOF_vec) / (2*pi);

% critical speeds
V_mps_crit_vec = wavelength*eigenfrequencies_DOF_vec;
V_kmph_crit_vec = V_mps_crit_vec * 3.6;

% display results
disp('=== Sub-Task 2 ===');
disp(' ');

disp('--- Eigenfrequencies [Hz] ---');
disp(eigenfrequencies_DOF_vec');

disp('--- Critical Speeds [m/s] ---');
disp(V_mps_crit_vec');

disp('--- Corresponding Eigenvectors ---');
disp(eigvectors_DOF_vecs);



%=========================================================================
% === SUB-TASK 3 ===
%=========================================================================

% define parameters
K_DOF_mat_2 = K_mat_fun([k1, k2, k3], 1150, 0.4);
M_DOF_mat_2 = M_mat_fun([950, m2, m3, 1150]);
C_DOF_mat_2 = C_mat_fun([c1, c2, c3], 0.4, L);
F_DOF_vec_2 = F_vec_fun(4, k1, omega_vec, c1, zeta_amp, L, wavelength);

% matrix-vector equation
z_amp_DOF_vecs_2 = z_amp_vecs_fun( ...
    V_length, 4, K_DOF_mat_2, M_DOF_mat_2, C_DOF_mat_2, F_DOF_vec_2, omega_vec ...
);



%=========================================================================
% === FIGURES ===
%=========================================================================

figure;

plot(V_kmph_vec, z_amp_DOF_vecs_1(:,1), 'r', ...
     V_kmph_vec, z_amp_DOF_vecs_1(:,2), 'g', ...
     V_kmph_vec, z_amp_DOF_vecs_1(:,3), 'b', ...
     V_kmph_vec, z_amp_DOF_vecs_1(:,4), 'm');
xlabel('Speed, $V \; [km/h]$', ...
    'Interpreter', 'latex' ...
)
ylabel('Absolute Displacement, $|\hat{z}| \; [m]$', ...
    'Interpreter', 'latex' ...
)

title('Absolute Displacements in the Four Degree-of-Freedom (DOF) Model', ...
    'Interpreter', 'latex' ...
)
grid on

% indicate critical speeds (within relevant speed interval)
hold on
crit_indices_vec = zeros(length(V_kmph_crit_vec),1);
for i = 1:length(V_kmph_crit_vec)
    V_kmph_crit = V_kmph_crit_vec(i);
    if V_kmph_crit <= V_kmph_vec(end)
        xline( ...
            V_kmph_crit, '--k', ...
            sprintf('$V_{\\mathrm{crit},%d}$', i), ...
            'LabelOrientation', 'horizontal', ...
            'Interpreter', 'latex' ...
        );
        crit_indices_vec(i) = i;
    end
end
crit_indices_rel_vec = crit_indices_vec(crit_indices_vec~=0);       % remove zeros
hold off

legend_entries = cell(1, 4+length(crit_indices_rel_vec));

% generate LaTeX strings for each displacement
legend_entries(1:4) = { ...
    '$|\hat{z}_{1}|$', ...
    '$|\hat{z}_{2}|$', ...
    '$|\hat{z}_{3}|$', ...
    '$|\hat{\theta}|$' ...
};

% generate LaTeX strings for each critical speed
for i = 1:length(crit_indices_rel_vec)
    legend_entries{4+i} = ['$V_{\mathrm{crit},', num2str(crit_indices_rel_vec(i)), '}$'];
end
legend(legend_entries, 'Interpreter', 'latex')

%-------------------------------------------------------------------------

figure;
plot(V_kmph_vec, z_amp_QC_vecs)
xlabel('Speed, $V \; [km/h]$', ...
    'Interpreter', 'latex' ...
)
ylabel('Absolute Displacement, $|\hat{z}| \; [m]$', ...
    'Interpreter', 'latex' ...
)
title('Absolute Displacements in the Quarter Car (QC) Model', ...
    'Interpreter', 'latex' ...
)
legend( ...
    '$|\hat{z}|$', ...
    '$|\hat{z}_{t}|$', ...
    'Interpreter', 'latex' ...
)
grid on

%-------------------------------------------------------------------------

figure;
plot(V_kmph_vec, z_amp_dif_vecs)
xlabel('Speed, $V \; [km/h]$', ...
    'Interpreter', 'latex' ...
)
ylabel( ...
    { ...
    'Absolute Difference in Displacement Amplitudes', ... 
    ' $|\hat{z}_a-\hat{z}_b| \; [m]$'
    }, ...
    'Interpreter', 'latex' ...
)
title( ...
    { ...
    'Absolute Difference in Displacement Amplitudes ', ...
    'of the DOF Model and the QC Model' ...
    }, 'Interpreter', 'latex' ...
)
grid on
legend( ...
    '$|\hat{z}_1 - \hat{z}|$', ...
    '$|\hat{z}_2 - \hat{z}_t|$', ...
    '$|\hat{z}_3 - \hat{z}_t|$', ...
    'Interpreter', 'latex' ...
)

%-------------------------------------------------------------------------

figure;
plot(V_kmph_vec, ratio_z_vs_z1_vec)
xlabel('Speed, $V \; [km/h]$', ...
    'Interpreter', 'latex' ...
)
ylabel('Ratio, $|\hat{z}|/|\hat{z}_{1}|$', ...
    'Interpreter', 'latex' ...
)
grid on
title('Ratio of Absolute Displacements $|\hat{z}|$ and $|\hat{z}_{1}|$' ...
    , 'Interpreter', 'latex' ...
)


%-------------------------------------------------------------------------

figure;
hold on;
plot(V_kmph_vec, z_amp_DOF_vecs_1(:,1), '--r');
plot(V_kmph_vec, z_amp_DOF_vecs_2(:,1), '-r');
plot(V_kmph_vec, z_amp_DOF_vecs_1(:,2), '--g');
plot(V_kmph_vec, z_amp_DOF_vecs_2(:,2), '-g');
plot(V_kmph_vec, z_amp_DOF_vecs_1(:,3), '--b');
plot(V_kmph_vec, z_amp_DOF_vecs_2(:,3), '-b');
plot(V_kmph_vec, z_amp_DOF_vecs_1(:,4), '--m');
plot(V_kmph_vec, z_amp_DOF_vecs_2(:,4), '-m');
xlabel('Speed, $V \; [km/h]$', 'Interpreter', 'latex')
ylabel('Displacement Amplitude $|\hat{z}|$', 'Interpreter', 'latex')
title('Comparison of Original vs Modified DOF System', 'Interpreter', 'latex')
grid on
legend( ...
    '$|\hat{z}_1|$, original', ...
    '$|\hat{z}_1|$, modified', ...
    '$|\hat{z}_2|$, original', ...
    '$|\hat{z}_2|$, modified', ...
    '$|\hat{z}_3|$, original', ...
    '$|\hat{z}_3|$, modified', ...
    '$|\hat{\theta}|$, original', ...
    '$|\hat{\theta}|$, modified', ...
    'Interpreter', 'latex', 'Location', 'best' ...
)