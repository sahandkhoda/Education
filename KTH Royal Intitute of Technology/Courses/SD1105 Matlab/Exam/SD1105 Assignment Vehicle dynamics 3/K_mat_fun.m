function [K_mat] = K_mat_fun(k_vec, p, L)

    % 4D stiffness matrix
    if length(k_vec) == 3
    
        k1 = k_vec(1);
        k2 = k_vec(2);
        k3 = k_vec(3);
    
        K_mat = ...
        [
                  k2+k3,            -k2,           -k3,              ((p*k2)-(1-p)*k3)*L;
            
                   -k2,            k1+k2,           0,                      -p*k2*L;
            
                   -k3,              0,           k1+k3,                   (1-p)*k3*L;
            
            ((p*k2)-(1-p)*k3)*L,    -p*k2*L,    (1-p)*k3*L,    ((p^2)*(L^2)*k2)+((1-p)^2)*(L^2)*k3;
        ];
    
    end
    
    % 2D stiffness matrix
    if length(k_vec) == 2
    
        k = k_vec(1);
        k_t = k_vec(2);
    
        K_mat = ...
        [
            k, -k;
            -k, k+k_t;
        ];
    
    end

end

