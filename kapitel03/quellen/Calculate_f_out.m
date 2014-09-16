%% Calculates the output frequency for the clock distribution on ADAC
%% Master III


%% Constants:
F_ref = 10e6;    % 10 MHz


%% Possible VCO Frequency
N = 1:262112; % Possible Values for N
R = 1:16383; % Possible Values for R



f_ref = 10e6;
ratio = 50:0.01:200; % N/R


figure_obj = figure('Units','centimeters',...
        'Position',[2 2 13 10]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[13 10]);
    
for i=1:32
    f_out = ratio*f_ref/i/1e6;
    plot(f_out,ratio,'LineWidth',1);
    hold on;
end
f_axis = 20:0.1:125;
upper_bound = 140*ones(1,length(f_axis));
plot(f_axis,upper_bound,'black','LineWidth',2);
hold on;
lower_bound = 80*ones(1,length(f_axis));
plot(f_axis,lower_bound,'black','LineWidth',2);
axis([20 125 50 200])

xlabel('Frequency [MHz]','FontName','Palatino','FontSize',10);
%set(gca,'XTick',[20 40 60 72 80 100 120]);
ylabel('$\frac{N}{R}$','Interpreter','Latex','FontName','Palatino','FontSize',14,'Rotation',0.0);
set(gca,'YTick',[50 80 100 140 150 200]);
set(gcf,'PaperPositionMode','auto')

 %print -dpdf -f1 f_out_pll.pdf







