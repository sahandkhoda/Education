% === INFO: TABLE ====
% ____________________________________________

function the_table = e_TABLE( ...
    xFE, yFE, xRK4, yRK4, x_an, y_an, ...
    error_xFE, error_yFE, error_xRK4, error_yRK4)

METHOD  = ["FE" ; "RK4" ; "ANALYTICAL"];
x_END   = [xFE(end) ; xRK4(end) ; x_an(end)];
y_END   = [yFE(end) ; yRK4(end) ; y_an(end)];
x_ERROR = [error_xFE(end) ; error_xRK4(end) ; 0];
y_ERROR = [error_yFE(end) ; error_yRK4(end) ; 0];

the_table = table(METHOD , x_END , y_END , x_ERROR, y_ERROR);

end