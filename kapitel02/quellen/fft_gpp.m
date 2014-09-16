% Plot properties:

plot_fontname = 'Palatino';
Plot_fontsize = 10;
time_unit = 1e-6;
GPP_freq = 2.28;



length = [64 128 256 512 1024 2048];
x_axis = 1:6;
fftw = [3.08E-06	4.13E-06	6.09E-06	1.05E-05	2.05E-05	4.27E-05];
simu = [2.99E-06	4.89E-06	9.17E-06	2.02E-05	4.82E-05	1.21E-04];
my_fft = [9.00E-05	1.95E-04	3.81E-04	8.67E-04	1.70E-03	4.04E-03];


%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 11 8.5]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[11 8.5]);


semilogy(x_axis,fftw/time_unit,'*');
hold on;
semilogy(x_axis,simu/time_unit,'s');
hold on;
semilogy(x_axis,my_fft/time_unit,'o');
hold on;

axis([0 7 1 10^4])

%grid on;
%




xlabel('FFT block size','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
ylabel('Processing time','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');

ax1 = gca;
set(ax1,'XTick',x_axis);
set(ax1,'XTickLabel',length);
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,11,9])
set(ax1,'Position',[1.8,1.2,7.5,7])

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

set(ax1,'YTickLabel',{'1 µs';'10 µs'; '100 µs'; '1 ms'; '10 ms'});

set(ax2,'YGrid', 'on')



set(findobj('Type','line'),'Markersize',7,'Linewidth',1,'MarkerEdgeColor','black');


set(gcf,'PaperPositionMode','auto');
legend('FFTW','Generated','Hand written','Location','NorthWest');

print -dpdf -f1 ..\figures\fft_gpp.pdf





