
clear
clc
close all

%% Introduktion
clear

a = 10;
a1 = [ 1 2 3 ; 4 5 6 ; 7 8 9 ];
a2 = [1 2 3 4 5 6];
a3 = [1 2 3 4 5 6]';
a4 = 1:10;
a5 = linspace(1,1000,500);

%% How to plot a curve
clear

% Parameters

    N = 2000;
    xstart  =   -10;
    xend    =   10;

x = linspace(xstart,xend, N);
y = x.^2;

a = {1 2 3 ; 4 5 6 ; 7 8 9}



y2(:,1) = y;
y2(2) = x.^2;
y2(3) = x.^2;
y2(4) = x.^2;


% Figure attributes
figure(1)
plot(x,y2)
xlabel('Sträcka x (m)','FontSize', 13)
ylabel('Something something something')


%% Övning: Rita sinus och cosinus
% clear


% Parametrar

    N = 100;
    xstart  =   -pi;
    xend    =   pi;
    x = linspace(xstart,xend, N);


% Definiera funktionerna. Notera, argument i radianer.

    y1 = sin(x);
    y2 = cos(x);


% Rita figuren (figurnummer, axlar, etc.)

figure(2);
plot(x,y1, 'o'), grid on;
xlabel('x [rad]','FontSize', 13)
ylabel('sin(x)', 'FontSize', 13)
xlim([-2,2])


hold on

ln = plot(x, y2, '--ro'), grid on;
xlabel('x [rad]','FontSize', 13)
ylabel('cos(x)', 'FontSize', 13)



legend_str = {'Kurva_1', 'Kurva_2'};
legend(legend_str, 'Interpreter', 'None', 'Location','northeast')

exText = 'hello';

title(sprintf('EXAMPLE %s', exText), 'Interpreter', 'none')

% ln.LineWidth = 2;
% ln.Color = [0 0.5 0.5];
% ln.Marker = 'o';
% ln.MarkerEdgeColor = 'b';


hold off