%Zach Swain
%MEEG332 
%Coding Challenge 2
%4/2/18

clear all
close all

n = 0:.1:10;
y0 = [0 0 0.5];

[nSol,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),n,y0);
y1 = ySol(:,1);
y2 = ySol(:,2);
y3 = ySol(:,3);

y1(1)
y2(1)
y3(1)

figure(1)
plot(n,y1,n,y2,n,y3)
xlabel('n')
ylabel('fprime')
legend('f',"f'",'f"')

y2(100);
%let acceptable range be whatever values produce 1.0000 in format short
%for 0.332019 < y3(0)< .332068 matlab outputs y2 @ n = 10 as 1.0000
