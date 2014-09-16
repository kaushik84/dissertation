%% Filter Parameter:

Frequency_div = 32;
disp(['Frequency = ',num2str(288/Frequency_div),' kHz'])

coef_factor = 3;
disp(['Taps = ',num2str(coef_factor*Frequency_div+1)])

bandwidth = 0.01;


%% Plot Parameter
plot_fontname = 'Palatino';
Plot_fontsize = 10;
width = 9;
height = 7;
factor_width = 2;
factor_height = 2;


rrc_object = fdesign.pulseshaping(16,'Square Root Raised Cosine','Nsym,Beta',40,0.35);
rrc_filter = design(rrc_object);

lp = fir1(coef_factor*Frequency_div-1,bandwidth);
carrier = exp(1i*2*pi/Frequency_div*(0:coef_factor*Frequency_div-1));


upper_bp = lp.*carrier;
lower_bp = lp.*conj(carrier);


h = fvtool(rrc_filter,upper_bp,1,lower_bp,1);
set(h,'MagnitudeDisplay','Magnitude');
set(h,'Fs',288e3);

set(h,'DesignMask','off'); % Turn off design mask
hchildren = get(h,'children');

haxes = hchildren(strcmpi(get(hchildren,'type'),'axes'));
hline = get(haxes,'children');

x_upper = get(hline(1),'XData');
y_upper = get(hline(1),'YData');

x_lower = get(hline(2),'XData');
y_lower = get(hline(2),'YData');

x_RRC = get(hline(3),'XData');
y_RRC = get(hline(3),'YData');

close all;

%% Plot results


figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

plot(x_upper,y_upper)
hold on;
plot(x_lower,y_lower)
hold on;
plot(x_RRC,y_RRC)

hchildren = get(figure_obj,'children');

haxes = hchildren(strcmpi(get(hchildren,'type'),'axes'));
hline = get(haxes,'children');



set(hline,'linewidth',1.0);
set(hline,'color','black');
set(hline(1),'LineStyle','-');
set(hline(2),'LineStyle','--');
set(hline(3),'LineStyle','--');
grid on;

xlabel('Frequency [kHz]','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
ylabel('Magnitude','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
axis([-36 36 0 1.1])

figure_obj = gcf;
ax1 = gca;



set(figure_obj,'WindowStyle','normal');
set(figure_obj,'Units','centimeters');
get(figure_obj,'Position')
set(figure_obj,'Position',[2 2 width height]);
get(figure_obj,'Position')
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

%ax1 = gca;
set(ax1,'Units','centimeter');
set(ax1,'Fontname',plot_fontname);
set(ax1,'Fontsize',Plot_fontsize);
pos1 = get(ax1,'Position')
pos1(1) = 1.5;
pos1(2) = 1;
pos1(3) = width-factor_width;
pos1(4) = height-factor_height;
set(ax1,'Position', pos1);
get(ax1,'XTick')
set(ax1,'XTick',[-36:9:36])

set(gcf,'PaperPositionMode','auto')
print -dpdf ..\figures\freq_acq_design.pdf




