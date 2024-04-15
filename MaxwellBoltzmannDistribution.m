%Distributia moleculelor unui gaz ideal dupa modulul vitezei
clc; clear; close all; 
kb=1.38e-23;
miu=4; %Heliu
NA=6.022*10^26;
m0=miu/NA;
T1=77;
T2=300; %Kelvin
T3=550;
vmax=3000; %m/s
v=linspace(0,vmax,1000);
dv=v(2)-v(1);
f1=4*pi*(m0/2/pi/kb/T1)^(3/2)*v.^2.*exp(-m0*v.^2/2/kb/T1);
f2=4*pi*(m0/2/pi/kb/T2)^(3/2)*v.^2.*exp(-m0*v.^2/2/kb/T2);
f3=4*pi*(m0/2/pi/kb/T3)^(3/2)*v.^2.*exp(-m0*v.^2/2/kb/T3);
v1=1500;
v2=2000;
indici=(v>v1)&(v<v2);
p=dv*sum(f1(indici));
disp(p*100);
figure(1);
hold on; 
plot(v,f1,'-c');
plot(v,f2,'-b');
plot(v,f3,'-r');
xlabel('v(m/s)');
ylabel('f(s/m)');
grid;
legend('77 K','300 K','550 K');
title('DISTRIBUTIA MAXWELL-BOLTZMANN');
