%Oscilator cu 2 grade de libertate
clc; clear; close all
m1=1.5;
m2=1;
ka=10;
kb=10;
kc=10;
T1a=2*pi*sqrt(m1/ka);
T1b=2*pi*sqrt(m1/kb);
T2b=2*pi*sqrt(m2/kb);
T2c=2*pi*sqrt(m2/kc);
Tmax=max([T1a,T1b,T2b,T2c]);
tf=10*Tmax;
N=10000;
t=linspace(0,tf,N);
dt=t(2)-t(1); %ratia
%Conditiile initiale 
eta1i=0.1;
eta2i=0.2;
v1i=0.04;
v2i=0.04;
%Prealocare
eta1=zeros(1,N);
eta2=eta1;
eta1(1)=eta1i;
eta2(1)=eta2i;
eta1(2)=eta1i+v1i*dt;
eta2(2)=eta2i+v2i*dt;
for i=2:N-1
    eta1(i+1)=2*eta1(i)-eta1(i-1)-dt^2/m1*(ka*eta1(i)+kb*(eta1(i)-eta2(i)));
    eta2(i+1)=2*eta2(i)-eta2(i-1)-dt^2/m2*(kc*eta2(i)+kb*(eta2(i)-eta1(i))); 
end

figure(1)
plot(t,eta1,'-r',t,eta2,'-b');
legend('Oscilatorul 1','Oscilatorul 2');
xlabel('t/s');
ylabel('eta/m');
grid;
daspect([1,1,1]);
title('Oscilator elastic dublu');

%Simularea miscari
La=0.8;
Lb=0.5;
Lc=1;
x1=La+eta1;
x2=La+Lb+eta2;
xs=0;
xd=La+Lb+Lc;
figure(2);
tic;
simt=0;
while simt<=tf
    hold off;
    j=abs(t-simt)==min(abs(t-simt));
    plot([xs,x1(j)],[0,0],'-m');
    hold on;
    plot([x1(j),x2(j)],[0,0],'-g');
    plot([x2(j),xd],[0,0],'-c');
    plot(x1(j),0,'.r','MarkerSize',50*m1^(1/3));
    plot(x2(j),0,'.b','MarkerSize',50*m2^(1/3));
    pause(1e-6);
    simt=toc;
end











