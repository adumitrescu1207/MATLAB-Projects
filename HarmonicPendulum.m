%Programul compara solutia analitica cu solutia numerica%
clc; clear; close all;
g=9.80665; %acceleratia gravitationala terestra
l=1; %lungimea firului
tf=20;
N=10000;
t=linspace(0,tf,N);
dt=t(2)-t(1);
theta=zeros(1,N); %prealocare 
theta(1)=pi/4; %unghiul initial, amplitudinea
theta(2)=theta(1);
for i=2:N-1
    theta(i+1)=2*theta(i)-theta(i-1)-dt^2*g/l*sin(theta(i));
end
theta_an=theta(1)*sin(sqrt(g/l)*t+pi/2);
figure(1) %unghiul in functie de timp
plot(t,theta,'-b',t,theta_an,'-r');
legend('Solutia numerica','Solutia analitica');
xlabel('t/s');
ylabel('theta/rad');
grid;
title('Pendul gravitational');
%Simularea dinamica a miscarii
x=l*sin(theta);
y=-l*cos(theta);
figure(2)
tic; simt=0; %timpul simularii
while simt<=tf
j=abs(t-simt)==min(abs(t-simt));
hold off;
plot([0,x(j)],[0,y(j)],'-c','LineWidth',2);
hold on;
plot(x(j),y(j),'.r','MarkerSize',40);
axis([-l,l,-l,0]);
daspect([1,1,1]);
pause(1e-6)
simt=toc;
end





    
    
    
    
