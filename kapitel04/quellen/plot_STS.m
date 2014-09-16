STS_freq = sqrt(13/6)*[0 0 1+1i 0 0 0 -1-1i 0 0 0 1+1i 0 0 0 -1-1i 0 0 0 -1-1i 0 0 0 1+1i 0 0 0 0 0 0 0 -1-1i 0 0 0 -1-1i 0 0 0 1+1i 0 0 0 1+1i 0 0 0 1+1i 0 0 0 1+1i 0 0];
LTS_freq = [1 1 -1 -1 1 1 -1 1 -1 1 1 1 1 1 1 -1 -1 1 1 -1 1 -1 1 1 1 1 0 1 -1 -1 1 1 -1 1 -1 1 -1 -1 -1 -1 -1 1 1 -1 -1 1 -1 1 -1 1 1 1 1];

carrier = -26:26;

time = 0:1e-8:8e-6;

STS_time = zeros(length(time),1);
LTS_time = zeros(length(time),1);

for k = 1:length(time)
    for n = 1:length(carrier)
        STS_time(k) = STS_time(k) + STS_freq(n)*exp(1i*2*pi*carrier(n)*312.5e3*time(k));
        LTS_time(k) = LTS_time(k) + LTS_freq(n)*exp(1i*2*pi*carrier(n)*312.5e3*(time(k)-1.6e-6));
    end
end

figure_obj = figure('Units','centimeters',...
       'Position',[2 2 13 10]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[13 10]);



subplot(2,1,1);
stem(carrier,real(STS_freq))
hold on;
stem(carrier,imag(STS_freq),'*')
axis([-32 32 -2 2]);
grid on;
xlabel('Carrier','FontName','Palatino','FontSize',10);
ylabel('Real and Imaginary Part','FontName','Palatino','FontSize',10);
set(gca,'FontName','Palatino','FontSize',10);
legend('Real','Imag','Location','SouthEast')

subplot(2,1,2);
plot(time*1e6, abs(STS_time))
grid on;
axis([0 8 0 10]);
xlabel('Time [µs]','FontName','Palatino','FontSize',10);
set(gca,'XTick',[(0:0.8:8)]);
ylabel('Magnitude','FontName','Palatino','FontSize',10);
set(gca,'FontName','Palatino','FontSize',10);



set(gcf,'PaperPositionMode','auto')
set(findobj('Type','line'),'Linewidth',1)
%print -dpdf -f1 STS.pdf




