function h = imp_res_RRC(R,T,time)

h = zeros(length(time),1);
for i = 1:length(time)
    t = time(i);
    if t == 0
        h(i) = (1/sqrt(T))*(1-R+4*R/pi);
    elseif abs(abs(t) - abs(T/(4*R))) < eps
        h(i) = R/sqrt(2*T)*((1+2/pi)*sin(pi/(4*R))+(1-2/pi)*cos(pi/(4*R)));
    else
        h(i) = 1/sqrt(T)*(sin(pi*t/T*(1-R))+4*R*t/T*cos(pi*t/T*(1+R)))/(pi*t/T*(1-(4*R*t/T)^2));
    end


end

    

