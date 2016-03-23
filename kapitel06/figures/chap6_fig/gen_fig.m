close all;
clear all;

pdf = 0;
ETT = 0;
rs_SNR = 1;
test_SNR = 1;

Fontsize = 8;


if pdf
    h = openfig('P_ST_Rx.fig');
    pbaspect([1 0.62 1]);
    hl = legend('Empirical','Theoretical');
    set(hl, 'Location', 'SouthEast', 'FontSize', Fontsize);
    set(hl, 'position',[0.57 0.68 0.335 0.15]);
    xlabel('$\eprcvd$ = [dBm]','FontSize', Fontsize);
    ylabel('pdf','FontSize', Fontsize);

    laprint(h, '../P_ST_Rx', 'options', 'factory', 'width', 8, 'scalefonts',...
        'on', 'factor',0.5, 'keepfontprops', 'on');
    close all;


    h = openfig('P_ST_Tx.fig');
    pbaspect([1 0.62 1]);
    hl = legend('Empirical','Theoretical');
    set(hl, 'Location', 'SouthEast', 'FontSize', Fontsize);
    set(hl, 'position',[0.57 0.68 0.335 0.15]);
    xlabel('$\epreg$ = [dBm]','FontSize', Fontsize);
    ylabel('pdf','FontSize', Fontsize);

    laprint(h, '../P_ST_Tx', 'options', 'factory', 'width', 8, 'scalefonts',...
        'on', 'factor',0.5, 'keepfontprops', 'on');
    close all;

    h = openfig('P_PR_Rx.fig');
    pbaspect([1 0.62 1]);
    hl = legend('Empirical','Theoretical');
    set(hl, 'Location', 'SouthEast', 'FontSize', Fontsize);
    set(hl, 'position',[0.57 0.68 0.335 0.15]);
    xlabel('$\eprcvdpr$ = [dBm]','FontSize', Fontsize);
    ylabel('pdf','FontSize', Fontsize);

    laprint(1, '../P_PR_Rx', 'options', 'factory', 'width', 8, 'scalefonts',...
        'on', 'factor',0.5, 'keepfontprops', 'on');
    close all;

    h = openfig('R_s.fig');
    pbaspect([1 0.62 1]);
    hl = legend('Empirical','Theoretical');
    set(hl, 'Location', 'SouthEast', 'FontSize', Fontsize);
    set(hl, 'position',[0.57 0.68 0.335 0.15]);
    xlabel('$\ers$ = [bits/sec/Hz]','FontSize', Fontsize);
    ylabel('pdf','FontSize', Fontsize);

    laprint(h, '../R_s', 'options', 'factory', 'width', 8, 'scalefonts',...
        'on', 'factor',0.5, 'keepfontprops', 'on'); 
end

if ETT
    load('ETT_results');
    [taux rsx pocx] = plotyy(tau, rs, tau, poc_model);
    set(taux(2),'XTick',[]);
    decimate = 3;
    index = (1:decimate:length(tau));
    set(taux, 'NextPlot','add');
    plot(taux(2), tau(index), poc_data(index), 'kx');

    decimate = 3;
    index = (1:decimate:length(tau));
    set(taux, 'NextPlot','add');
    plot(taux(1), tau(index), rs(index), 'kx', 'HandleVisibility','off');

    set(taux, 'NextPlot','add');
    plot(taux(1), 0.735, 7.0183, 'ks', 'HandleVisibility','off');

    set(taux, 'NextPlot','add');
    plot(taux(2), 0.735, 0.95, 'ks', 'HandleVisibility','off');

    set(taux(1),'ycolor','k');
    Ytick_R =  round(linspace(min(rs), max(rs), 6)*10000)/10000;
    Ytick_PC = round(linspace(0.5, 1, 6)*10000)/10000;
    set(taux(1),'ycolor','k','ylim',[min(rs) max(rs)],'ytick',Ytick_R, 'Yticklabel', sprintf('%0.2f|', Ytick_R));
    set(taux(2),'ycolor','k','ylim', [0.5 1],'ytick',Ytick_PC, 'Yticklabel', sprintf('%0.2f|', Ytick_PC));
    set(rsx,'color','b','LineWidth',1);
    set(pocx(1),'color','b','LineWidth',1,'LineStyle','--');


    xlabel('$\test = [\SI{}{ms}]$', 'FontSize', Fontsize);
    ylabel(taux(1),'$\e{\ers}{\ers}  = [\SI{}{bits/s/Hz}]$', 'FontSize', Fontsize);% left y-axis
    ylabel(taux(2),'$\pco$', 'FontSize', Fontsize); % right y-axis
    hl = legend({'$\e{\ers}{\ers}$]','$\pco$','Empirical'});
    set(hl, 'Location', 'SouthEast', 'FontSize', Fontsize);
    set(hl, 'position',[0.6 0.56 0.3 0.25]);

    hor = 7.0536;
    hor2 = 7.0183;
    ver = 0.735;
    line([ver 2.5],[hor hor],'LineStyle',':','Color','k','LineWidth',1); % horizontal line
    line([ver ver],[6.89 hor],'LineStyle',':','Color','k','LineWidth',1); % vertical line
    line([0 ver],[hor2 hor2],'LineStyle',':','Color','k','LineWidth',1); % horizontal line


    laprint(1, '../ETT', 'options', 'factory', 'width', 8, 'scalefonts',...
        'on', 'factor',0.5, 'keepfontprops', 'on');
end

if rs_SNR
    load('test_rs_SNR_results');
    h = figure(1);
    plot(SNR_dB(1,:),rs(1,:),'b','LineWidth',2);
    hold on;
    plot(SNR_dB(2,:),rs(2,:),'g--','LineWidth',2);
    plot(SNR_dB(3,:),rs(3,:),'r:','LineWidth',2);
    xlabel('$\snrrcvd = [\SI{}{dB}]$', 'FontSize', Fontsize);
    ylabel('$\e{ers}{\ers(\ttest)} = [\SI{}{bits/s/Hz}]$', 'FontSize', Fontsize);
    hl = legend({'$\pcod = 0.90$','$\pcod = 0.95$','$\pcod = 0.99$'});
    set(hl, 'Location', 'SouthEast', 'FontSize', Fontsize);
    set(hl, 'position',[0.6 0.67 0.3 0.25]);    
    
    xlim([-10 19])
    laprint(h, '../Rs_SNR', 'options', 'factory', 'width', 8, 'scalefonts',...
        'on', 'factor',0.5, 'keepfontprops', 'on');
end


if test_SNR
    load('test_rs_SNR_results');
    h = figure(2);
    plot(SNR_dB(1,:),tau(1,:),'b','LineWidth',2)
    hold on
    plot(SNR_dB(2,:),tau(2,:),'g--','LineWidth',2)
    plot(SNR_dB(3,:),tau(3,:),'r:','LineWidth',2)
    xlabel('$\snrrcvd = [\SI{}{dB}]$', 'FontSize', Fontsize);
    ylabel('$\ttest = [\SI{}{ms}]$', 'FontSize', Fontsize);
    hl = legend({'$\pcod = 0.90$','$\pcod = 0.95$','$\pcod = 0.99$'});
    set(hl, 'Location', 'SouthEast', 'FontSize', Fontsize);
    set(hl, 'position',[0.6 0.67 0.3 0.25]);  
    xlim([-10 19]);
    laprint(h, '../test_SNR', 'options', 'factory', 'width', 8, 'scalefonts',...
        'on', 'factor',0.5, 'keepfontprops', 'on');   
    
end