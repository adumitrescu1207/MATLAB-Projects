R=1;
N=100000;
x=rand(1,N)*R;
y=rand(1,N)*R;
plot(x,y,'.b');
axis square;
contor=0;
for i=1:N
    if(x(i)^2+y(i)^2)<R^2
        contor=contor+1;
    end
end
disp(4*contor/N);


