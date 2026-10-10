function [F_vec] = F_vec_fun(DIMENSION, k, omega_vec, c, zeta_amp, L, wavelength)

    % 4D excitation force vector
    if DIMENSION == 4
    
        F_vec = zeros(length(omega_vec), 4);
        for i = 1:length(omega_vec)
            omega = omega_vec(i);
            F_vec(i,:) = (k+1i*omega*c)*zeta_amp*[0, 1, exp(1i*2*pi*L/wavelength), 0];
        end
    
    end
    
    % 2D excitation force vector
    if DIMENSION == 2
    
        F_vec = zeros(length(omega_vec), 2);
        for i = 1:length(omega_vec)
            omega = omega_vec(i);
            F_vec(i,:) = [0, (k+1i*omega*c)*zeta_amp];
        end
    
    end

end

