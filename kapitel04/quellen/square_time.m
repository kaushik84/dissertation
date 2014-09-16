
plot_fontname = 'Palatino';
Plot_fontsize = 10;
width = 10;
height = 8;
factor_width = 2.5;
factor_height = 1.5;

set(0,'ShowHiddenHandles','on');

figure_obj = gcf;

set(figure_obj,'menubar','figure')
set(figure_obj,'Units','centimeters');
set(figure_obj,'Position',[2 2 width height]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);
set(figure_obj,'PaperPositionMode','auto');

ax1 = gca;
set(ax1,'Units','centimeter');
set(ax1,'Fontname',plot_fontname);
set(ax1,'Fontsize',Plot_fontsize);
pos1 = get(ax1,'Position')
pos1(1) = 1.8;
pos1(2) = 1;
pos1(3) = width-factor_width;
pos1(4) = height-factor_height;
set(ax1,'Position', pos1);
set(ax1,'XTick',[-72 -54   -36   -18     0    18    36    54 72]);
set(ax1,'xgrid','on')
%set(ax1,'XLabel','Frequency [kHz]');
set(get(ax1,'XLabel'),'String','Frequency [kHz]','Fontname',plot_fontname,'Fontsize',Plot_fontsize)
set(get(ax1,'YLabel'),'String','Magnitude-Squared [dB]','Fontname',plot_fontname,'Fontsize',Plot_fontsize)
%set(ax1,'XLabel',)
%xlabel('Re{ \{S(k)\}} ','Fontname',plot_fontname,'Fontsize',Plot_fontsize);




set(findobj('Type','line'),'Linewidth',1)
print -dpdf ..\figures\square_time.pdf




