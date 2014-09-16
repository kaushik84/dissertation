%% This plots the peak from STS and FC field

% acquire data
frames = 40;

fc_dim = size(FC_Track);
%fc_data = reshape(FC_Track(:,:),fc_dim(1)*fc_dim(3),1);
fc_data = FC_Track;

sts_dim = size(STS_Track);
%sts_data = reshape(STS_Track(:,:),sts_dim(1)*sts_dim(3),1);
sts_data = STS_Track;

time = (1:fc_dim(1))/18e3;

plot_fontname = 'Palatino';
Plot_fontsize = 10;
width = 12;
height = 6.5;
factor_width = 2;
factor_height = 2;

figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);



subplot(2,1,1);
grid on;
hold on;
plot(time,fc_data,'black');
xlabel('Time [s]','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
ylabel('$\langle r[k],FC \rangle$','Fontname',plot_fontname,'Fontsize',Plot_fontsize,'Interpreter','Latex');

% title('Without Pulse Shaping','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
axis([0 2 0 45]);
% ax1 = gca;
% set(ax1,'Units','centimeter');
% pos1 = get(ax1,'Position')
% pos1(1) = pos1(1) - 0.2;
% pos1(2) = pos1(2) + 0.4;
% pos1(3) = width/2-factor_width;
% pos1(4) = height-factor_height;
% set(ax1,'Position', pos1);

subplot(2,1,2);
grid on;
hold on;
plot(time,sts_data,'black');
xlabel('Time [s]','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
ylabel('$\langle r[k],STS \rangle$','Fontname',plot_fontname,'Fontsize',Plot_fontsize,'Interpreter','Latex');
% title('With Pulse Shaping','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
axis([0 2 0 25]);
% ax2 = gca;
% set(ax2,'Units','centimeter');
% pos2 = get(ax2,'Position');
% pos2(1) = pos2(1) + 0.2;
% pos2(2) = pos2(2) + 0.4;
% pos2(3) = width/2-factor_width;
% pos2(4) = height-factor_height;
% set(ax2,'Position', pos2);

set(gcf,'PaperPositionMode','auto')
set(findobj('Type','line'),'Linewidth',1)
print -dpdf ..\figures\freq_peak.pdf




