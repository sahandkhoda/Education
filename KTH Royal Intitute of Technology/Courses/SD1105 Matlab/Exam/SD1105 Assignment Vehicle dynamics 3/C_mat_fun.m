function [C_mat] = C_mat_fun(c_vec, p, L)

    % 4D damping matrix
    if length(c_vec) == 3
    
        c1 = c_vec(1);
        c2 = c_vec(2);
        c3 = c_vec(3);
    
        C_mat = ...
    [
               c2+c3,             -c2,         -c3,                 (p*c2-(1-p)*c3)*L;
                -c2,             c1+c2,         0,                      -p*c2*L;
                -c3,               0,         c1+c3,                   (1-p)*c3*L;
        ((p*c2)-(1-p)*c3)*L,    -p*c2*L,    (1-p)*c3*L,     ((p^2)*(L^2)*c2)+((1-p)^2)*(L^2)*c3;
    
    ];
    
    end
    
    % 2D stiffness matrix
    if length(c_vec) == 2
    
        c = c_vec(1);
        c_t = c_vec(2);
    
        C_mat = ...
        [
            c, -c;
            -c, c+c_t;
        ];
    
    end

end

