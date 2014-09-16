
values = 1000;
R = 0.35;
T_s = 1;


group_delay = 5;
upsampling = 64;

for group_delay = 1:20
t = linspace(-group_delay,group_delay,2*group_delay*upsampling+1);


h_rrc = 4*R*(cos((1+R)*pi*t/T_s) + (sin((1-R)*pi*t/T_s) ./ (4*R*t/T_s))) ./ (pi*sqrt(T_s).*(1-(4*R*t/T_s).^2));
zero_ind = group_delay*upsampling+1;
h_rrc(zero_ind) = (4*R+(1-R)*pi)/(pi*T_s);

%plot(t,h_rrc)

E = sum(h_rrc.^2)/upsampling;

E_rel(group_delay) = 1-E;
end

%% Plot results

plot_fontname = 'Palatino';
plot_fontsize = 10;
width = 12;
height = 8;
factor_width = 2;
factor_height = 2;

figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

semilogy(1:20,E_rel,'*')
grid on;
%axis([-100 100 -100 30]);
xlabel('D_{RRC}','FontName',plot_fontname,'FontSize',plot_fontsize);
ylabel('E_{rel}','FontName',plot_fontname,'FontSize',plot_fontsize);
set(gca,'FontName',plot_fontname,'FontSize',plot_fontsize);
hold on;

set(findobj('Type','line'),'Markersize',7,'Linewidth',1,'MarkerEdgeColor','black');


set(gcf,'PaperPositionMode','auto')
print -dpdf ..\figures\RRC_group_delay.pdf




