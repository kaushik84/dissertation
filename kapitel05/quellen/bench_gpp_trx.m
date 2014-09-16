%% Load data
bench_gpp_data;

%% Barplot

width = 11;
height = 6.5;

width_out = 11;
height_out = 6;
pos_x = 0;
pos_y = 0;


%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

h = barh(fliplr(trx_values)/rel);
set(h,'BarWidth',0.5);
colormap gray;

%% plot the diagram

% Label and axes settings
ylabel('Processing block','FontName','Palatino','FontSize',10);
set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
set(gca,'YTickLabel',flipud(trx_label));
xlabel('Processing time [ms]','FontName','Palatino','FontSize',10);

set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,width_out,height_out])
set(ax1,'Position',[3,1.2,7,4])
set(ax1,'XLim',[0 1000])
set(ax1,'XTick',linspace(0,rel,5))

ax2 = copyobj(ax1,gcf);
set(ax2,...
    'XAxisLocation','top',...
    'YTick',[],...
    'XColor','black',...
    'XLim',(get(ax1,'XLim')/rel),...
    'XTick',get(ax1,'XTick')/rel,...
    'XTickLabel',num2str(str2num(get(ax1,'XTickLabel'))/rel));
set(get(ax2,'YLabel'),'String','');
set(get(ax2,'XLabel'),'String','Relation to transceiver');

% This code section changes the xticklabel from rel to %
temp_str = num2str(str2num(get(ax2,'XTickLabel'))*100);
[height, length] = size(temp_str);
per_str = ' %'
for i=1:height-1
    per_str = [per_str;' %']
end
set(ax2,'XTickLabel',[temp_str,per_str]);



x_ticks = round(str2num(get(ax1,'XTickLabel'))/10)/100;
set(ax1,'XTickLabel',num2str(x_ticks));



% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\bench_gpp_trx.pdf





