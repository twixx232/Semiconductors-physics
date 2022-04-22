clc;
clear all;
close all;
vgs = [0:.5:30];
vt=.4;
mn1=300*(10^(-4));
mn2=500*(10^(-4));
mn3=700*(10^(-4));
cox = ((3.9*8.84*(10^(-3)))/2);
w= 10^(-9);
L = 10^(-7);
for i=1:length(vgs)
    id1(i) = (0.5*mn1*cox*w*((vgs(i)-vt)^2)/L);
    id2(i) = (0.5*mn2*cox*w*((vgs(i)-vt)^2)/L);
    id3(i) = (0.5*mn3*cox*w*((vgs(i)-vt)^2)/L);

end
plot(vgs,id1,'Color',[.6 0 0]);
grid;
hold on;
plot(vgs,id2,'Color',[0 .6 0]);
grid;
hold on;
plot(vgs,id3,'Color',[0 0 .6]);
grid;
hold on;
title('gate voltage function current drain');
xlabel('Vgs (V)');
ylabel('Id (A)');
legend('mn1','mn2','mn3');

