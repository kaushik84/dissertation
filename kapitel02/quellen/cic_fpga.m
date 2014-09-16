
width = 11;
height = 9;

c_float = 20e-6/25;
c_fix = 4.2e-6/50;

simu_float = 100e-6/150;
simu_fix = 0.95e-6/200;

ti_fix = 0.4e-6/200;

cyclone = [590,434];
virtex  = [841,465];


%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height-1.5]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height-1.5]);

h = barh([virtex;cyclone]);
set(h,'BarWidth',0.5);
colormap gray;

ylabel('FPGA','FontName','Palatino','FontSize',10);
set(gca,'YTickLabel',{'Virtex 4','Cyclone','Hand written'});

ax1 = gca;

xlabel('Resource usage [LE, Slice]','Interpreter','Latex','FontName','Palatino','FontSize',10);

set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,width,height])
set(ax1,'Position',[3,1.2,7,6])
%set(ax1,'XTickLabel',[1 10 100 1000])


legend_handle = legend('Hand written','Generated');
%set(legend_handle,'Location','Southeast');

% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\cic_fpga.pdf

