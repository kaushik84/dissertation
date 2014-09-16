N_phi = 1:15;

theta = atan(2.^-(N_phi));
error = theta/(2*pi)*8;
%% Plot results

plot_fontname = 'Palatino';
plot_fontsize = 10;
width = 10;
height = 8;
factor_width = 2;
factor_height = 2;

figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

semilogy(N_phi,error,'*')

grid on;
%axis([-100 100 -100 30]);
ylabel('$\frac{\theta[N_\varphi-1]}{2\pi}I_{\rm FIR}$','FontName',plot_fontname,'FontSize',plot_fontsize,'Interpreter','Latex');
xlabel('$N_{\varphi}$','FontName',plot_fontname,'FontSize',plot_fontsize,'Interpreter','Latex');
set(gca,'FontName',plot_fontname,'FontSize',plot_fontsize);
hold on;

set(findobj('Type','line'),'Markersize',7,'Linewidth',1,'MarkerEdgeColor','black');
set(gca,'Units','centimeters')
set(gca,'OuterPosition',[0,0.3,10,7.7])
%set(gca,'Position',[1.8,1.2,7.5,7])
get(gca,'OuterPosition')
get(gca,'Position')


set(gcf,'PaperPositionMode','auto')
print -dpdf ..\figures\cordic_error.pdf




