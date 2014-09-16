%% Plot Timing Offset


%% Import the data for the model

data = load('TETRA_rx_dec_200')
TETRA_rx_dec_200 = data.simout;
%% Start the model to get the result vector

mdl = 'TETRA_file2time.mdl';
load_system(mdl)
simOut = sim(mdl);
timing_error = mod(TETRA_timing_offset(:,:)/16,-0.5);

timing_error = timing_error(10:length(timing_error));
time = 1:length(timing_error);
time = time*180/18e3;

max_error = time*20*18e3/1e6+timing_error(1);
min_error = -time*20*18e3/1e6+timing_error(1);

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
xlabel('Time [s]','FontName',plot_fontname,'FontSize',plot_fontsize);
ylabel('Timing error / T_{sym}','FontName',plot_fontname,'FontSize',plot_fontsize);
set(gca,'FontName',plot_fontname,'FontSize',plot_fontsize);
hold on;
plot(time,timing_error)
hold on;
plot(time,min_error,'-.')
hold on;
plot(time,max_error,'-.')

axis([0 1 -0.5 0.1]);
set(findobj('Type','line'),'Linewidth',1.0,'color','black')
legend('Measured error','Max/Min error');

set(gcf,'PaperPositionMode','auto')
print -dpdf ..\figures\usrp_time_offset.pdf



