%% Coding Challenged 1 - Problem 2
% Zach Swain, 3/1/18, All files available at
% https://www.github.com/zswain/MEEG332

clear all

hMax= 80;              %maximum h on given plot is 80m
qMax= 2;               %maximum q on given plot is 2m3/s
rho= 1000;             %density of water at 20C is 1000kg/m3
mu= .001;              %dynamic viscocity of water at 20C is .001Pa*s
L= 120;                %length of pipe is given as 120m
D= .3;                 %diameter of pipe is given as .3m
relRough= (.00026/.3); %epsilon of cast iron is .26mm
pMax= (rho*9.81*hMax); %maximum delta P from given maximum h
fGuess= .02;           %f=.02 is around the middle of Moody chart, initial guess
f= fGuess;             %redefine for iterative convenience
vList=[0 (sqrt(pMax/(.5*rho*(L/D)*f)))]; %create vList to keep trak of past v values
i= 2;                  %assign i to index the most recent vList value ~arrays starting at 1 in 2018~
while (abs(vList(i)-vList(i-1))/vList(i)) > .001 %until the percent change in v values is less than 0.1%
    Re= (rho*vList(i)*D)/mu; %calculate Re from most recent v value
    f= darcyFactor(Re,relRough); %calculate f using prior defined function
    v= (sqrt(pMax/(.5*rho*(L/D)*f))); %calculate new v value
    vList= [vList v];  %add new v value to vList
    i= i+1;            %update i to continue indexing most recent v value
end
q= vList(i)*(pi*(.15^2))