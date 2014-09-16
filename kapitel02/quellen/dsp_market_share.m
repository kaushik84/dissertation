figure_obj = figure('Units','centimeters',...
        'Position',[2 2 10 8]);
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[10 8]);


market = [0.62, 0.12, 0.07, 0.06, 0.13];

pie(market);
colormap gray;

%legend('Texas Instruments', 'Freescale', 'Agere', 'Analog Devices', 'Other','Location','NorthWest');
set(gcf,'PaperPositionMode','auto')

%im_hatch = applyhatch_pluscolor(gcf,'|-.+\',0,0,[],150);

%imwrite(im_hatch,'im_hatch.png','png')

set(gcf,'PaperPositionMode','auto')

%print -dpdf -f1 dsp_market_share.pdf

