%% Coding Challenge 2 - Parts 2,3,4
% Zach Swain, 4/2/18, All files available at
% https://www.github.com/zswain/MEEG332

clear all

n = 0:.05:5;        %now using n from 0-5, decide to keep use amount of steps
y0 = [0 0 .332043]; %define y0 as before but use found alpha value
[nSol,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),n,y0); %evaluate ODE

y1 = ySol(:,1);     %define y1 as all rows in column 1 of ySol, f
y2 = ySol(:,2);     %define y1 as all rows in column 1 of ySol, f'
y3 = ySol(:,3);     %define y1 as all rows in column 1 of ySol, f"

if n>4.8 & n<5      %if n between 4.8-5
    y = 1;          %let y = 1
else                %if y between 0-4.8
    y = sin((pi/2)*(n/4.8)); %let y as defined
end

figure(2)           %plot f' from ODE and sin func given, both vs. n
plot(n,y,n,y2)
xlabel('n')
ylabel("f'")
legend('exact','integral')

A = trapz(n,1-(y2/y2(100))) %evaluate integral given as A using trapz, A found as 1.6860, A_book = 1.7210

B = trapz(n,((y2/y2(100)).*(1-(y2/y2(100))))) %evaluate integral given as B using trapz, B found as .6414, B_book = .6640
