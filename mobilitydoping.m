nda = logspace(14,20);
un = (5.1e18 + 92*nda.^0.91)./(3.75e15+nda.^0.91);
up = (2.9e15 + 47.7*nda.^0.76)./(5.86e12+nda.^0.76);
semilogx(nda,un,'w',nda,up,'w');
text(7.0e16,1000,'Electron mobility')
text(5e14,500,'Holes mobility')
title('Mobility versus doping')
xlabel('Doping concentration in cm-3')
ylabel('mobility')

