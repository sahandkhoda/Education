function [z_amp_vecs] = z_amp_vecs_fun(LENGTH, DIMENSION, K, M, C, F, omega_vec)

    z_amp_vecs = zeros(LENGTH, DIMENSION);
    for i = 1:LENGTH
        omega = omega_vec(i);
        force = F(i,:); 
        z_amp_vecs(i,:) = abs( (K+1i*omega*C-(omega^2)*M) \ force' );
    end

end