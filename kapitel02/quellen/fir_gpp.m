%% Plot bars
GPP_freq = 2.28;

%% Results are saved with a frame length of 1024 and coef length of 100 in µs

% Compiler
blocks = {'LCC'; 'VS';'IPS'};

%Processing time of empty loop in ns:
vs = [384 162 595 422]/100/1024*1000;
ips = [380 112 561 336]/100/1024*1000;
lcc = [2590 1500 3622 1638]/100/1024*1000;

time = [ips' vs' lcc']*2.28;



%% plot the diagram

%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 11 7.5]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[11 7.5]);

% Actual plot
%flip both vectors for beter representation
blocks = flipud(blocks);
time = flipud(time);


columns = [time'];
h = barh(columns);
set(h,'BarWidth',0.5);
colormap gray;


% Label and axes settings
ylabel('Compiler','FontName','Palatino','FontSize',10);
set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
set(gca,'YTickLabel',blocks);
%xlabel('Processing time [$\mu$s]','Interpreter','Latex','FontName','Palatino','FontSize',10);

xlabel('Processing time [ns]','Interpreter','Latex','FontName','Palatino','FontSize',10);

set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,11,9])
set(ax1,'Position',[1.8,1.2,8,5])
set(ax1,'XLim',[0 36])

ax2 = copyobj(ax1,gcf);
set(ax2,...
    'XAxisLocation','top',...
    'YTick',[],...
    'XColor','black',...
    'XLim',(get(ax1,'XLim')*GPP_freq),...
    'XTick',get(ax1,'XTick')*GPP_freq,...
    'XTickLabel',num2str(str2num(get(ax1,'XTickLabel'))*GPP_freq));
set(get(ax2,'YLabel'),'String','')
set(get(ax2,'XLabel'),'String','Cycles')

legend_handle = legend('Real data, hand written','Complex data, hand written','Real data, generated','Complex data, generated');
set(legend_handle,'Location','Southeast');

% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\fir_gpp.pdf





