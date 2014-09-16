
width = 11;
height = 6;

c_float = 20e-6/25;
c_fix = 4.2e-6/50;

simu_float = 100e-6/150;
simu_fix = 0.95e-6/200;

ti_fix = 0.4e-6/200;

cyclone = [1788 495];

%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height-1.5]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height-1.5]);

h = barh(cyclone);
set(h,'BarWidth',0.5);
colormap gray;

ylabel('Code','FontName','Palatino','FontSize',10);
set(gca,'YTickLabel',{'Generated','Optimized'});

ax1 = gca;

xlabel('Resource usage [LE]','Interpreter','Latex','FontName','Palatino','FontSize',10);

set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,width,height])
set(ax1,'Position',[3,1.2,7,3])
%set(ax1,'XLim',[0 1600])


%legend_handle = legend('Hand written','Generated');
%set(legend_handle,'Location','Southeast');

% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\fir2_fpga.pdf

