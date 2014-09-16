%% Load data
bench_gpp_data;

%% Barplot

width = 11;
height = 5.5;

width_out = 11;
height_out = 5;
pos_x = 0;
pos_y = 0;


%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

h = barh(fliplr(rx_aach_values)/rel);
set(h,'BarWidth',0.5);
colormap gray;

%% plot the diagram

% Label and axes settings
ylabel('Processing block','FontName','Palatino','FontSize',10);
set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
set(gca,'YTickLabel',flipud(rx_aach_label));
xlabel('Processing time [µs]','FontName','Palatino','FontSize',10);

set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,width_out,height_out])
set(ax1,'Position',[4,1.2,6,3])
set(ax1,'XLim',[0 12])

ax2 = copyobj(ax1,gcf);
x_ticks = round(str2num(get(ax1,'XTickLabel'))/rel*1000)/1000;
set(ax2,...
    'XAxisLocation','top',...
    'YTick',[],...
    'XColor','black',...
    'XLim',(get(ax1,'XLim')/rel),...
    'XTick',get(ax1,'XTick')/rel,...
    'XTickLabel',num2str(x_ticks));
set(get(ax2,'YLabel'),'String','')
set(get(ax2,'XLabel'),'String','Relation to transceiver')


% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\bench_gpp_rx_aach.pdf





