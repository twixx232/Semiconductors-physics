t = 300;
k=1.38e-23;
na = 1.0e17;
nd = 1.0e14;
q=1.602e-19;
nisq = 1.04e20;
vc = (k*t/q)*(log(na*nd/nisq));
vs = -1.0:0.1:0.7;
disp(vc);
diff_pot = vc-vs;
plot(vs,diff_pot)
title('Junction potential vs source voltage')
xlabel('Voltage source')
ylabel('Potential junction')