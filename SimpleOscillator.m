
%Oscilatia armonica a unui pendul elastic simplu
clc; clear; close all
m=2;    %masa (kg)
k=100;    %constanta elastica (N/m)
l0=0.2;    %lungimea resortului nedeformat (m)
N=10000;    %numarul de diviziuni
dl=zeros(1,N);    %alungirea resortului in fiecare moment
dl(1)=l0/4;    %alungirea initiala a resortului (m)
v0=0;    %viteza initiala (m/s)
T=2*pi*sqrt(m/k);    %perioada (s)
tf=5*T;    %timpul final - 5 oscilatii (s)
t=linspace(0,tf,N);    %N elemente echidistante
dt=t(2)-t(1);    %delta t (foarte mic)
dl(2)=dl(1);    %sunt egale, deoarece viteza initiala este 0
for i=2:N-1
    dl(i+1)=2*dl(i)-dl(i-1)-dt^2*(k/m*dl(i));    %pozitia corpului 
    % in fiecare moment de timp
end
%Design
figure(1);
plot(t,dl,'-b');
grid;
daspect([1,1,1]);
title('OSCILATOR PENDUL ELASTIC');
xlabel('t/s');
ylabel('l/m');
x=dl+l0;
xs=0;
figure(2);
tic;
simt=0;
while simt<=tf
    hold off;
    j=abs(t-simt)==min(abs(t-simt));
    plot([xs,x(j)],[0,0],'-b');
    hold on;
    plot(x(j),0,'.r','MarkerSize',50*m^(1/3));
    simt=toc;
    axis([0,2*l0,-l0,l0]);
    pause(1e-6);
end







