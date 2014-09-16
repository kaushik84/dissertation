%% Plot bars
GPP_freq = 2.28;

%% Results are valid with a burst length of 510

%% RX PHY
rx_phy_label = {'Time Sync','Freq Sync','Frame Sync'};
rx_phy_values = [51, 146, 171];

%% RX TCH
rx_tch_label = {'Descrambler','De-Interleaver','Viterbi'};
rx_tch_values = [317, 12.5, 388];

%% RX AACH
rx_aach_label = {'Descrambler','Syndrom Decoder'};
rx_aach_values = [15, 10];

%% TX TCH
tx_tch_label = {'RCPC','Interleaver','Scrambler'};
tx_tch_values = [20, 5, 308];

%% TX AACH
tx_aach_label = {'Reed Muller','Scrambler'};
tx_aach_values = [15, 2];


%% Transmitter
tx_label = {'MAC TCH','MAC AACH','PHY','SRC'};
tx_values = [sum(tx_tch_values),sum(tx_aach_values),36,11.3];

%% Receiver
rx_label = {'SRC','PHY','MAC TCH','MAC AACH'};
rx_values = [111, sum(rx_phy_values),sum(rx_tch_values),sum(rx_aach_values)];

%% Transceiver
trx_label = {'Transceiver';'Transmitter';'Receiver'};
trx_values = [sum(tx_values)+sum(rx_values),sum(tx_values),sum(rx_values)];

%% Barplot

width = 11;
height = 7.5;

width_out = 11;
height_out = 7;
pos_x = 0;
pos_y = 0;


%Configure plot size
figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

h = barh(fliplr(trx_values)*GPP_freq);
set(h,'BarWidth',0.5);
colormap gray;

%% plot the diagram

% Label and axes settings
ylabel('Processing Block','FontName','Palatino','FontSize',10);
set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
set(gca,'YTickLabel',flipud(trx_label));
xlabel('Process time [µs]','FontName','Palatino','FontSize',10);

set(gca,'FontName','Palatino','FontSize',10,'Xgrid','On');
ax1 = gca;
set(ax1,'Units','centimeter')
set(ax1,'OuterPosition',[0,0,width_out,height_out])
set(ax1,'Position',[3,1.2,7,5])
set(ax1,'XLim',[0 2000])

ax2 = copyobj(ax1,gcf);
set(ax2,...
    'XAxisLocation','top',...
    'YTick',[],...
    'XColor','black',...
    'XLim',(get(ax1,'XLim')*GPP_freq),...
    'XTick',get(ax1,'XTick')*GPP_freq,...
    'XTickLabel',num2str(str2num(get(ax1,'XTickLabel'))*GPP_freq/1000));
set(get(ax2,'YLabel'),'String','')
set(get(ax2,'XLabel'),'String','Cycles [x10^6]')


% Print to pdf
set(gcf,'PaperPositionMode','auto')
print -dpdf -f1 ..\figures\bench_gpp.pdf





