
%Curba balistica
clc; clear; close all;
g=9.81; %acceleratie gravitationala
m=0.5; %masa proiectilului
ti=0; %timpul initial
v0=500; %viteza initiala
b=0.5*m*g/v0; %coeficientul de frecare
% sunt constante pt cele 8 cazuri
alpha0=zeros(1,8); %vector pt cele 8 valori
alpha0(1)=10;
alpha0(2)=20;
alpha0(3)=30;
alpha0(4)=40;
alpha0(5)=50;
alpha0(6)=60;
alpha0(7)=70;
alpha0(8)=80;

tf=zeros(1,8); %vector pt cele 8 valori
for i=1:8
tf(i)=v0*sind(alpha0(i))*2/g;
end

N=1201; 
maxim=0;

for i=1:8
t=linspace(ti,tf(i),N);
x=v0*cosd(alpha0(i)) *m/b*(1-exp(-b/m*t)) ;
y=v0*sind(alpha0(i)) *m/b*(1-exp(-b/m*t))-g*m/b*t+... 
g*(m/b) ^2*(1-exp(-b/m*t));

nt=length(t);
if maxim<(x(nt))    
   maxim=(x(nt)) ; %bataia maxima
   indice=i; %indicele acesteia
end

t=t(y>=0); x=x(y>=0); y=y(y>=0);
x=x/1000; y=y/1000;
plot(x, y, '-b') ;
daspect([1, 1, 1]) ;
xlabel('x/km'); 
ylabel('y/hm');
grid;
title('CURBA BALISTICA') ;
plot(x, y,'-r' ,'LineWidth',2);
hold on;
nt=length(t) ;
afis=['Bataia este ', num2str(x(nt)), ' km pentru alpha0=', num2str(alpha0(i)), 'grade. ' ] ;
disp(afis) ;
end
afis=['Bataia maxima are loc pentru alpha0=', num2str(alpha0(indice))] ;
disp(afis) ;