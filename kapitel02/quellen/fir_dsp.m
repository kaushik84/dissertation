GPP_freq = 0.594;

c_float = 20e-6/25;
c_fix = 4.2e-6/50;

simu_float = 100e-6/150;
simu_fix = 0.95e-6/200;

ti_fix = 0.4e-6/200;

c = [c_fix,c_float];
simu = [simu_fix,simu_float];
ti = [ti_fix,0];

%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 11 7.5]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[11 7.5]);

h = barh([ti;simu;c]*1e9);
set(h,'BarWidth',0.5);
colormap gray;

ylabel('Code','FontName','Palatino','FontSize',10);
set(gca,'YTickLabel',{'Optimized','Generated','Hand written'});

ax1 = gca;
set(ax1,'XScale','log')

xlabel('Processing time [ns]','Interpreter','Latex','FontName','Palatino','FontSize',10);

set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,11,9])
set(ax1,'Position',[3,1.2,7,5])
set(ax1,'XTickLabel',[1 10 100 1000])


ax2 = copyobj(ax1,gcf);
set(ax2,...
    'XAxisLocation','top',...
    'YTick',[],...
    'XColor','black',...
    'XTickLabel',num2str(str2num(get(ax1,'XTickLabel'))*GPP_freq));
set(get(ax2,'YLabel'),'String','')
set(get(ax2,'XLabel'),'String','Cycles')

legend_handle = legend('Fixed point','Floating point');
set(legend_handle,'Location','Southeast');

% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\fir_dsp.pdf

