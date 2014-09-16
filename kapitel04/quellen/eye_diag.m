%% Signal Constellation for pi/4 DQPSK

%This script produces two plots with the signal constellation of a pi/4 DQPSK.
%The first one is without pulse shaping while the second one uses a raised cosine filter

% Construct the objects
DQPSK_Modulator = modem.dpskmod('M', 4, 'PhaseRotation', pi/4);
%RC_Filter = design(fdesign.interpolator(8,'Raised Cosine',8,'Nsym,Beta',6,0.5))


% Generate the data sequency
x = randint(10000,1,4);


% Signal constellation without pulse shaping
y = modulate(DQPSK_Modulator,x);

% Signal constellation with pulse shaping
y_ps = 8*rcosflt(y,1,64,'fir/sqrt',0.35);


% Create an eye diagram object
eyeObj = commscope.eyediagram(...
    'SamplingFrequency', 1, ...
    'SamplesPerSymbol', 64, ...
    'OperationMode', 'Complex Signal')

eyeObj.PlotType = '2D Line';

% Update the eye diagram object with the transmitted signal
eyeObj.update(0.5*y_ps);


% Manage the figures
managescattereyefig(hFig, eyeObj, 'right');











% plot_fontname = 'Palatino';
% Plot_fontsize = 10;
% width = 12;
% height = 6.5;
% factor_width = 2;
% factor_height = 2;
% 
% figure_obj = figure('Units','centimeters',...
%        'Position',[2 2 width height]);
%    
% set(figure_obj,'PaperUnits','centimeters');
% set(figure_obj,'PaperSize',[width height]);
% 
% 
% 
% subplot(1,2,1);
% grid on;
% hold on;
% plot(real(y),imag(y),'black');
% xlabel('Re{ \{S(k)\}} ','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
% ylabel('Imag{\{S(k)\}} ','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
% title('Without Pulse Shaping','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
% axis([-1.8 1.8 -1.8 1.8]);
% ax1 = gca;
% set(ax1,'Units','centimeter');
% pos1 = get(ax1,'Position')
% pos1(1) = pos1(1) - 0.2;
% pos1(2) = pos1(2) + 0.4;
% pos1(3) = width/2-factor_width;
% pos1(4) = height-factor_height;
% set(ax1,'Position', pos1);
% 
% subplot(1,2,2);
% grid on;
% hold on;
% plot(real(y_ps(1000:300000/5)),imag(y_ps(1000:300000/5)),'black');
% xlabel('Re{ \{s(t)\}} ','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
% ylabel('Imag{\{s(t)\}} ','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
% title('With Pulse Shaping','Fontname',plot_fontname,'Fontsize',Plot_fontsize);
% axis([-1.8 1.8 -1.8 1.8]);
% ax2 = gca;
% set(ax2,'Units','centimeter');
% pos2 = get(ax2,'Position');
% pos2(1) = pos2(1) + 0.2;
% pos2(2) = pos2(2) + 0.4;
% pos2(3) = width/2-factor_width;
% pos2(4) = height-factor_height;
% set(ax2,'Position', pos2);
% 
% set(gcf,'PaperPositionMode','auto')
% set(findobj('Type','line'),'Linewidth',1)
% print -dpdf ..\figures\sig_const.pdf
% 
% 
% 
% 
