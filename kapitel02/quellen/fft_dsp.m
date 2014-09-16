% Plot properties:

plot_fontname = 'Palatino';
Plot_fontsize = 10;
time_unit = 1e-6;
GPP_freq = 0.594;
width = 10.5;
height = 10;



length = [64 128 256 512 1024];
x_axis = 1:5;
fftw = [285e-8     593e-8      128e-7      281e-7      618e-7];
simu = [111e-7     237e-7      509e-7      109e-6      234e-6];
my_fft = [396e-5     959e-5      225e-4      519e-4      117e-3];


%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width+0.5 height]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width+0.5 height]);


semilogy(x_axis,fftw/time_unit,'*');
hold on;
semilogy(x_axis,simu/time_unit,'s');
hold on;
semilogy(x_axis,my_fft/time_unit,'o');
hold on;

axis([0 6 1 10^6])

%grid on;
%




xlabel('FFT block size','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ylabel('Processing time','Fontname',plot_fontname,'Fontsize',Plot_fontsize);

ax1 = gca;
set(ax1,'XTick',x_axis);
set(ax1,'XTickLabel',length);
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,width,height])
set(ax1,'Position',[1.9,1.2,7,8])

ax2 = copyobj(ax1,gcf);

set(ax2,...
    'YAxisLocation','right',...
    'XTick',[],...
    'YColor','black',...
    'YLim',(get(ax1,'YLim')*GPP_freq),...
    'YTick',get(ax1,'YTick')*GPP_freq,...
    'YTickLabel',num2str(10.^(str2num(get(ax1,'YTickLabel')))*GPP_freq));

set(get(ax2,'XLabel'),'String','')
set(get(ax2,'YLabel'),'String','Cycles/1000')

set(ax1,'YTickLabel',{'1 µs';'10 µs'; '100 µs'; '1 ms'; '10 ms';'100 ms' ;'1 s'});

set(ax2,'YGrid', 'on')



set(findobj('Type','line'),'Markersize',7,'Linewidth',1,'MarkerEdgeColor','black');


set(gcf,'PaperPositionMode','auto');
legend('Optimized','Generated','Hand written','Location','NorthWest');

print -dpdf -f1 ..\figures\fft_dsp.pdf





