%% U3 Projekt 1b

% === DESCRIPTION ===
% Given the Jakobian, "J", and transfer function, "F", this script applies 
% Newton-Raphson's method to approximate the stifttness constants (roots)
% "k1" and "k2". The rate of convergence, "q", is calculated. At the end, 
% for visualization, a convergence analysis is done.

% ____________________________________________

close all; clear; clc; format long;

faktor = 1/10; % mellan 1/200 OCH 1/300 KONVERGERAR mot felvärde (både)


% === STIFFNESS ===

% When using reference values, the convergence rate is 2.
% Try setting:
%   k1 = k1_ref + 18;
%   k2 = k2_ref + 1000;
% and then:
%   k1 = k1_ref + 18;
%   k2 = k2_ref + 2000;
% Notice the difference in "q", from around 0.7 to 2.
% This means that the convergence rate depends on the initial guesses 
% of k1 and k2, no matter if we de- or increase the guesses.

k1_ref = 5350;      k1 = k1_ref ;
k2_ref = 136100;    k2 = k2_ref ;
k0vec = [k1,k2];


% === ANONYMOUS FUNCTIONS ===
cs = 1;
ck = 0.7;
J = @(k1,k2) Jacobian_transfer_functions(k1,k2);    % Jakobian
F = @(k1,k2) transfer_functions(k1,k2,ck,cs);       % Transfer functions


% === SOLUTION MATRIX ===

% Conditions
tolerance = 1e-6;
maxiter = 500;
iterdiff = 1;
itercount = 1;

% Defining and initializing the solution matrix
solmat = zeros(maxiter,2);
solmat(1,:) = k0vec;

% Applying Newton-Raphson's method to approximate k1 and k2
while (iterdiff > tolerance) && (itercount < maxiter)

    s = J(solmat(itercount,1), solmat(itercount,2))\F(solmat(itercount,1), solmat(itercount,2));
    solmat(itercount+1,:) = solmat(itercount,:) - s';

    iterdiff = norm(solmat(itercount,:) - solmat(itercount+1, :));
    itercount = itercount + 1;
    
end

% Updates the size of the solution matrix
solmat = solmat(1:itercount, 1:2);

% The roots (k1 and k2)
k1_k2_bar = solmat(end,:);
disp('The roots (k1 and k2) are, respectively:')
disp(k1_k2_bar)

% === ERROR ===

% Error matrix
% Each iteration is compared to the last row in the solution matrix,
% which is assumed to be the roots (exact values of k1 and k2)
E_mat = [abs(solmat(1:end-1 , 1) - k1_k2_bar(1)) , abs(solmat(1:end-1 , 2) - k1_k2_bar(2))];


% === CONVERGENCE ANALYSIS ===

% loglog(error_vec(:,1), error_vec(:,2), '-o');
% 
% coe = polyfit(log(error_vec(:,1)), log(error_vec(:,2)), 1);
% 
% lut = coe(3);
% 
% disp(['[ lutning av log-log-plot: ]', num2str(lut)]);


% CONVERGENCE RATE

q_ordning = log(E_mat(3:end,:)./E_mat(2:end-1,:)) ./ log(E_mat(2:end-1,:)./E_mat(1:end-2,:));
disp('The convergence rate "q" for k1 and k2, respectively.')
disp(q_ordning);


% CONVERGENCE IN TERMS OF ONLY k1

E_k1 = zeros(itercount,1);
E_k1(1:itercount-1) = E_mat(:,1);

figure(1)
plot(1:itercount, E_k1);
xlabel('Iteration');
ylabel('Error');
title('Convergence Analysis : k1');


% % CONVERGENCE IN TERMS OF ONLY k2

E_k2 = zeros(itercount,1);
E_k2(1:itercount-1) = E_mat(:,2);

figure(2)
plot(1:itercount, E_k2);
xlabel('Iteration');
ylabel('Error');
title('Convergence Analysis : k2');


% CONVERGENCE IN TERMS OF THE NORM OF k1 AND k2

% Normalize each row in the solution matrix
error_norm = zeros(itercount, 1);
for i = 1:itercount-1
    error_norm(i) = norm(E_mat(i,:));
end

figure(3)
plot(1:itercount, error_norm);
xlabel('Iteration');
ylabel('Error norm');
title('Convergence Analysis : norm(k1,k2)');

