%% Plot bars

cycle_flag = 1; % cycles are plotted
%cycle_flag = 0; % Processing times are plotted
GPP_freq = 594;

% Compiler
blocks = {'CCS'};

%Processing time of empty loop in us:
time = [3.85]*GPP_freq;



%% plot the diagram

%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 10 4]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[10 4]);

% Actual plot
%flip both vectors for beter representation
blocks = flipud(blocks);
time = fliplr(time);


columns = [time'];
h = barh(columns);
set(h,'BarWidth',0.5);
colormap gray;


% Label and axes settings
ylabel('Compiler','FontName','Times','FontSize',10);
set(gca,'YTickLabel',blocks);
%xlabel('Processing time [$\mu$s]','Interpreter','Latex','FontName','Times','FontSize',10);

xlabel('Processing time [$\mu$s]','Interpreter','Latex','FontName','Times','FontSize',10);

set(gca,'FontName','Times','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,10,3])
set(ax1,'Position',[1.8,1.2,7,1.5])
set(ax1,'XLim',[0 5])

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


% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\empty_loop_dsp.pdf





