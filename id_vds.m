clc;
clear all;
close all;
u=500*10^(-4); 
Eox=3.9*8.85*10^-12; 
cox=Eox/(1*10^(-9)); 
w= 10^(-9);
L = 10^(-7);
vt=.7;
vg=[1:1:3];
vds=[0:.2:5];
for j=1:length(vg)

    for i=1:length(vds)
       if vds(i)<(vg(j)-vt)
            id(i)=(u*cox*w)/L*((vg(j)-vt)*vds(i)-0.5*vds(i)^2);
            d=id(i);

       else
           id(i)=d;

       end
    end
    plot(vds,id);
    grid;
    hold on;
end

