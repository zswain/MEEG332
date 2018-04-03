%% Coding Challenge 2 - Part 1
% Zach Swain, 4/2/18, All files available at
% https://www.github.com/zswain/MEEG332

function dyvect_dt = lamBoundLayerVeloODE(n,y)

f = 0;             %let initial guess = 0

y1 = f;            %substitution/definition as given in part a
y2 = diff(y1);     %y2 = f' as given in part a
y3 = diff(y2);     %y3 = f" as given in part a

dyvect_dt(1,1) = y(2); %first row of column vector
dyvect_dt(2,1) = y(3); %second row of column vector
dyvect_dt(3,1) = -.5*y(1)*y(3); %f''' as given in simplified x momentum eq, third row
end
