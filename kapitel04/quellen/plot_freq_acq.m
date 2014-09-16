%% Plot Timing Offset

%%Implement the filter
Frequency_div = 32;
coef_factor = 3;
bandwidth = 0.01;
lp = fir1(coef_factor*Frequency_div-1,bandwidth);
carrier = exp(1i*2*pi/Frequency_div*(0:coef_factor*Frequency_div-1));


upper_bp = lp.*carrier;
lower_bp = lp.*conj(carrier);
%% Start the model to get the result vector

%  mdl = 'TETRA_Freq_Acq.mdl';
%  load_system(mdl)
%  simOut = sim(mdl);


%% Plot results

plot_fontname = 'Palatino';
plot_fontsize = 10;
width = 9;
height = 7;
factor_width = 2;
factor_height = 2;

figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

grid on;
xlabel('\nu [kHz]','FontName',plot_fontname,'FontSize',plot_fontsize);
ylabel('e(\nu)','FontName',plot_fontname,'FontSize',plot_fontsize);
set(gca,'FontName',plot_fontname,'FontSize',plot_fontsize);
hold on;
plot(freq_offset/1000,freq_error)
axis([-25,25,-0.3 0.3])
%set(gca,'XTick',[-25:10:25])


set(findobj('Type','line'),'Linewidth',1.0,'color','black')

set(gcf,'PaperPositionMode','auto')
print -dpdf ..\figures\freq_acq_error.pdf



