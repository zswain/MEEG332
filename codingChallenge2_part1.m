%% Coding Challenge 2 - Part 1
% Zach Swain, 4/2/18, All files available at
% https://www.github.com/zswain/MEEG332

clear all

n = 0:.1:10;    %let n span from 0 to 10 as given, steps of .1 for decent precision
y0 = [0 0 0.5]; %define given initial conditions for y1,y2,y3

[nSol,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),n,y0); %evaluate the ODE and give result ySol
y1 = ySol(:,1); %define y1 as all rows in column 1 of ySol, f
y2 = ySol(:,2); %define y2 as all rows in column 2 of ySol, f'
y3 = ySol(:,3); %define y3 as all rows in column 3 of ySol, f"

y1(1)           %evaluate where y1 = 0
y2(1)           %evaluate where y2 = 0
y3(1)           %evaluate where y3 = .5

figure(1)       %plot f,f',f" vs. n
plot(n,y1,n,y2,n,y3)
xlabel('n')
ylabel("f'")
legend('f',"f'",'f"')

y2(100);        %play with initial guess in y0 definition to find y2@infinity = 1
                %let acceptable range be whatever values produce 1.0000 in format short
                %for 0.332019 < y3(0)< .332068 matlab outputs y2 @ n = 10 as 1.0000
