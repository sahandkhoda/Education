clear
clc
close all


% THE SPEED OF LIGHT
c = 3 * 10^8;


% X-AXIS
x_start = 0;
x_end   = c;
steps   = 0.01 * c;
x = x_start : steps : x_end;


% FIGURE

figure(1)
title('Classical vs. Relativistic Momentum')
xlabel('Velocity, v [m/s]','FontSize', 13)
ylabel('Momentum, p [kg⋅m/s]', 'FontSize', 13)
hold on


% PLOT CLASSICAL CURVE

    % Classical proton mass
    m_proton_cla = 1.67 * 10^-27;
    
    % Graph
    y1 = x.*m_proton_cla;
    plot(x,y1), grid on;

    

% PLOT RELATIVISTIC CURVE

    % Lorentzfactor (inverted)
    GAMMA = sqrt(1 - (x.^2/c^2));
    
    % Relativistic mass
    m_proton_rel = GAMMA.^-1 * m_proton_cla;
    
    % Graph
    y2 = x.*m_proton_rel;
    plot(x, y2, 'r'), grid on;


% LEGEND
legend_str = {'Classical momentum', 'Relativistic momentum'};
legend(legend_str, 'Interpreter', 'None', 'Location','northwest')

hold off