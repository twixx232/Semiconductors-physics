k = 8.62e-5;
nd = 1.52e10;
tem = 300;
eg = 1.1;
ka = -eg/(k*tem);
t32a = tem.^1.5;

A = nd / (t32a*exp(ka));
for i = 1:10
    t(i) = 273+ 10*(i-1);
    eg(i) = 1.17-4.37e-4*(t(i)*t(i)/t(i)+636);
    t32(i) = t(i).^1.5;
    ni(i) = A* t32(i)*exp(-eg(i)/(k*t(i)));

end
semilogy(t,ni);
title('Electron concentration vs temperature')
xlabel ('Temperature')
ylabel('Electrons concentration')