function Y_f = fourier_trafo(y_t,T_s,f)

Y_f = sum(y_t.*exp(-1i*2*pi*f*T_s*(1:length(y_t))));