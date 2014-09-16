%% Evaluate Filter

% Run TETRA_Tx_RRC_CIC first to get the values in the workspace

% Parameter
values = 1000; % Amount of values
upper_frequency = 500e3;
T_DAC = 1/90e6;

alpha = 0.35;
f_s = 18e3;
US_FIR = 8;
N_FIR = 15;

D = 1;

US_CIC = 625;
N_CIC = 6;
M_CIC = 6;


% %% Check Parameter
% if US_CIC*US_FIR ~= 5000
%     error('No proper interpolation rate!');
% elseif upper_frequency < f_s*US_FIR
%     error('Increase frequency region');
% end


f = linspace(0,upper_frequency,values+1);


%% Calculate theoretical frequency response

% Discrete FIR RRC

t_discrete = linspace(-1*N_FIR,N_FIR,2*N_FIR*US_FIR+1);
discrete_time_resp = imp_res_RRC(alpha,1,t_discrete);

discrete_freq_resp = zeros(1,values);

for i = 1:length(f)
    discrete_freq_resp(i) = fourier_trafo(discrete_time_resp.',1/(US_FIR*f_s),f(i));
end
[val,pos] = max(abs(discrete_freq_resp));
discrete_freq_resp = [fliplr(discrete_freq_resp(2:length(discrete_freq_resp))),discrete_freq_resp]/val;

f = [-1*fliplr(f(2:length(f))),f];

% Perfect Analog Filter as reference

lower_bound = (1-alpha)/2*f_s;
upper_bound = (1+alpha)/2*f_s;

analog_freq_resp = zeros(1,length(f));
for i = 1:length(f)
    if abs(f(i)) < lower_bound
        analog_freq_resp(i) = 1;
    elseif (abs(f(i)) < upper_bound) && (abs(f(i))>lower_bound)
        analog_freq_resp(i) = cos(pi/f_s/2/alpha*(abs(f(i))-lower_bound));   
    end
end

% CIC Interpolator
cic_f = ((sin(pi*f*M_CIC/f_s*D/US_FIR)./sin(pi*f/f_s*D/US_FIR/US_CIC)).^N_CIC)/((US_CIC*M_CIC)^N_CIC);
cic_f((length(f)-1)/2+1) = 1;

% CIC compensation
cic_comp_f = zeros(1,length(f));
for i = 1:length(f)
    if cic_f(i) ~= 0
        cic_comp_f(i) = 1./cic_f(i);
    end
end


% Combination of CIC_comp and RRC:
final_f = cic_comp_f.*analog_freq_resp;

% Design filter
ind_zero_f = (length(f)-1)/2+1;
ind_nyq_f = find(f>US_FIR*f_s/2);

design_mag = final_f(ind_zero_f:ind_nyq_f(1)-1);
design_freq = linspace(0,1,length(design_mag));

final_t = fir2(US_FIR*N_FIR,design_freq,design_mag);

coef_SRC = final_t;

% Downsampling:
final_t = downsample(final_t,D);

final_freq_resp = zeros(1,length(f));
for i = 1:length(f)
    final_freq_resp(i) = fourier_trafo(final_t,D/(US_FIR*f_s),f(i));
end
[val,pos] = max(abs(final_freq_resp));

final_freq_resp = final_freq_resp/val;

comb_freq_resp = final_freq_resp.*cic_f;
comb_freq_resp = comb_freq_resp/max(comb_freq_resp);











%% Spectrum mask

power_limit = zeros(1,length(f));
for i = 1:length(f)
    if(abs(f(i))<25e3)
        power_limit(i) =  0;
    elseif(abs(f(i))>= 25e3) && (abs(f(i))< 50e3)
        power_limit(i) = -55;
    elseif(abs(f(i))>= 50e3) && (abs(f(i))< 100e3)
        power_limit(i) = -70;
    elseif(abs(f(i))>= 100e3) && (abs(f(i))< 250e3)
        power_limit(i) = -75;
    elseif(abs(f(i))>= 250e3) && (abs(f(i))< 5e6)
        power_limit(i) = -80;
    elseif(abs(f(i))>= 5e6)
        power_limit(i) = -100;
    end
end


%% Mean Square Error:
square_error = sum((abs(analog_freq_resp)-abs(comb_freq_resp)).^2)


%% Plot results

plot_fontname = 'Palatino';
plot_fontsize = 10;
width = 12;
height = 10;
factor_width = 2;
factor_height = 2;

figure_obj = figure('Units','centimeters',...
       'Position',[2 2 width height]);
   
set(figure_obj,'PaperUnits','centimeters');
set(figure_obj,'PaperSize',[width height]);

%plot(f/1000,10*log10(abs(freq_resp)),'r');
grid on;
axis([-100 100 -100 30]);
xlabel('Frequency [kHz]','FontName',plot_fontname,'FontSize',plot_fontsize);
ylabel('Magnitude [dB]','FontName',plot_fontname,'FontSize',plot_fontsize);
set(gca,'FontName',plot_fontname,'FontSize',plot_fontsize);
hold on;
%plot(f/1000,10*log10(abs(discrete_freq_resp)),'b')
%plot(f/1000,10*log10(abs(cic_f)),'g')
%plot(f/1000,10*log10(abs(cic_f.*discrete_freq_resp)),'b')
plot(f/1e3,power_limit,'LineStyle','--');
analog_freq_resp = analog_freq_resp+eps;
plot(f/1e3,10*log10(abs(analog_freq_resp)),'LineStyle','-.');
%plot(f/1e3,10*log10(abs(final_f)),'c');
plot(f/1e3,10*log10(abs(comb_freq_resp)),'LineStyle','-')
set(findobj('Type','line'),'Linewidth',1.0,'color','black')

legend('Spectrum Mask','Root Raised Cosine','Designed Filter')

set(gcf,'PaperPositionMode','auto')
print -dpdf ..\figures\tetra_sff_resampling.pdf



