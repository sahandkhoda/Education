clear
close all
%% Helt frivilliga inställningar, LaTex ekvationer i figurer är överkurs,
%  men ser proffsigt ut
set(groot,"defaultFigurePosition", [200,200,1100,900])
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(groot, 'DefaultAxesFontSize',20);
set(groot,'defaultAxesTickLabelInterpreter','latex');  
%% a)
m_e = 9.12e-31;
c = 3e8;
h = 6.63e-34;
phi = linspace(0,2*pi, 1000);
d_lambda = (h/(m_e*c))*(1-cos(phi));
e = 1.602e-19;

figure(1)
plot(180/(pi) * phi,d_lambda/1e-9,'LineWidth',3)
title({'Skillnad i v{\aa}gl{\"a}nd $\Delta \lambda$ mellan infallande och spridd foton \\', ...
    ' som funktion av spridningsvinkeln $\phi$'},'FontSize',15)
xlabel('Vinkel $\phi$ [$^o$] ')
ylabel('Skillnad i v{\aa}gl{\"a}ngd $\Delta \lambda$ [nm] ')
xlim([0 370])
pbaspect([2 1 1])
set(gcf,'Position',[100 100 1100 900])
xticks(0:30:360)
grid on
print('fig21','-depsc')

%% b+c)
lambda_vec = linspace(400e-9, 700e-9, 1000);
E_pe = (h*c./lambda_vec)/(e) - 2000;

figure(2)
plot(lambda_vec/1e-9, E_pe,'LineWidth',3)
hold on

% Dessa för uppgift b)

%plot(550*ones(1,1000), linspace(0,2,1000), '--k')
%plot(lambda_vec/1e-9, ((h*c./550e-9)/(e) - 1.22)*ones(1,1000), '--k')

% Denna för uppgift c)
%plot(lambda_vec/1e-9, zeros(1,1000), '--k')

title(['Emitterade elektronens r{\"o}relseenergi ' ...
    '  $E_e$ som funktion av v{\aa}gl{\"a}ngden $\lambda$'])
xlabel('V{\aa}gl{\"a}ngd $\lambda$ [nm] ')
ylabel('Emitterade elektronens r{\"o}relseenergi  $E_e$ [eV]')
annotation(gcf,'textbox',...
   [0.55 0.35 0.17 0.06],...
    'String','$E_e$($\lambda$ = 550 nm) = 1,037 eV',...
    'FitBoxToText','off',Interpreter='latex',FontSize=13);
hold off
print('fig22','-depsc')