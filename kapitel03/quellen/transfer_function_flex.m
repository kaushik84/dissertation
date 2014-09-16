%% Calculation of transfer function of Flex 400 front end

%% Resistances:
R61 = 95.3;
R3 = 2;
R5 = 2;
R7 = 100;

%% Capacitors:
C92 = 4.7e-12;
C90 = 150e-12;
C91 = 8.2e-12;
C89 = 82e-12;

%% Inductors:
L1 = 0.68e-6;
L3 = 1.2e-6;

%% Frequency in MHz:
f = 1:1:100; 
f = f*1e6;

w = 2*pi*f;

%% Calculate first section:
% Lok at: rx400.pdf schematic for the in-phase
% Z1 = R61 + (C92 || (L1+R3))
% Z2 = C91 || (L3 + R5)
% Z3 = C90
% Z4 = C89 || R7

Z1 = R61 + (1i.*w*L1+R3)./(1-w.^2*L1*C92+1i*w*R3*C92);
Z2 = (1i.*w*L3+R5)./(1-w.^2*L3*C91+1i*w*R5*C91);
Z3 = 1./(1i.*w*C90);
Z4 = 1./(1/R7+1i*w*C89);

% Z5 = Z3 || Z2+Z4

Z5 = 1./(1./Z3+1./(Z2+Z4));

%% Calculate the whole filter:

H_w = (Z5./(Z1+Z5)).*(Z4./(Z2+Z4));
H_w_log = 20*log10(abs(H_w));


figure_obj = figure('Units','centimeters',...
       'Position',[2 2 13 10]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[13 10]);



subplot(2,1,1);
semilogx(f,H_w_log);
grid on;
axis([1e6 100e6 -100 0]);
xlabel('Frequency [MHz]','FontName','Palatino','FontSize',10);
set(gca,'XTick',[1e6 10e6 22e6 100e6]);
set(gca,'XTickLabel','1|10|22|100');
ylabel('Magnitude [dB]','FontName','Palatino','FontSize',10);
set(gca,'YTick',[-100 -50 -12 0]);
set(gca,'FontName','Palatino','FontSize',10);


subplot(2,1,2);
semilogx(f,angle(H_w)/(2*pi)*360);
grid on;
xlabel('Frequency [MHz]','FontName','Palatino','FontSize',10);
set(gca,'XTick',[1e6 10e6 22e6 100e6]);
set(gca,'XTickLabel','1|10|22|100');
ylabel('Phase [deg]','FontName','Palatino','FontSize',10);
set(gca,'FontName','Palatino','FontSize',10);

set(gcf,'PaperPositionMode','auto')
set(findobj('Type','line'),'Linewidth',1)
print -dpdf -f1 transfer_function_flex400.pdf

