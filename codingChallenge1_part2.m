clear all

nRange = 0:.05:5;
y0 = [0 0 .332043];
[n,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),nRange,y0);

y1 = ySol(:,1);
y2 = ySol(:,2);
y3 = ySol(:,3);


if (n>4.8) && (n<5)
    y = 1;
else
    y = sin((pi/2)*(n/4.8));
end

figure(2)
plot(n,y,n,y2)
xlabel('n')
ylabel('fprime')
legend('exact','integral')