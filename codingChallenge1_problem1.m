%% Coding Challenge 1 - Problem 1
% Zach Swain, 3/1/18, All files available at
% https://www.github.com/zswain/MEEG332

%%
%Can't really publish a script after a function, so it's out of order
%% Script

clear all

Re= logspace(2,8,200);                 %define a range of 200 Re values from 1E2 to 1E8
relRough= logspace(-6,-2,20);          %define a range of 20 ?/d values from 1E-6 to 1E-2
Re(45);
Re(54);

for i= 1:length(relRough)              %let i iterate through the defined ?/d values
    for j= 1:length(Re)                %let j iterate through the defined Re values
        if Re(j)< 2000                 %if Re is laminar
            sol(j)= 64/Re(j);          %do laminar calculations
        end
        if Re(j)>= 2000 && Re(j)<4000  %if Re is transitional
            reBoundDif= Re(54)-Re(45); %do transitional calculations ~outlined already in function~
            reDist= Re(j)-Re(45);
            perc= reDist/reBoundDif;
            fDif= ((fzero(@(f) (1/sqrt(f)+(2)*log10((relRough(i)/3.7)+(2.51/(Re(j)*sqrt(f))))),[.001 .1]))-(64/Re(45)));
            sol(j)= (perc*fDif)+(64/Re(45));
        end
        if Re(j)>= 4000                %if Re is turbulent, do turbulent calculations
            sol(j)= fzero(@(f) (1/sqrt(f)+(2)*log10((relRough(i)/3.7)+(2.51/(Re(j)*sqrt(f))))),[.001 .1]);
        end
    end
    figure(1)
    loglog(Re,sol);                    %overlay plots of sol vs. Re for all ?/d iterations
    xlim([0 100000000])
    ylim([5*10^-3 6*10^-1])
    hold on
end


%% Function

darcyFactor(10^4, .01)
darcyFactor(10^7, .01)
darcyFactor(10^7,0)

function [f] = darcyFactor(Re,relRough)

if Re< 2000                   %if Re is laminar
    f= 64/Re;                 %do laminar calculations
end
if Re>= 2000 && Re<4000       %if Re is transitional, do transitional calculations
    reBoundDif= 2000;         %difference b/w Re=4000 and Re=2000
    reDist= Re-2000;          %get difference between given Re and Re=2000
    perc= reDist/reBoundDif;  %get the given Re's percentage distance between Re=2000 and Re=4000
    fDif= ((fzero(@(f) (1/sqrt(f)+(2)*log10((relRough/3.7)+(2.51/(4000*sqrt(f))))),[.001 .1]))-(64/2000)); %get difference b/w f@Re=4000 and f@Re=2000
    f= (perc*fDif)+(64/2000); %multiply the percent dist b/w Re values by the dif b/w f values then add to f@Re=2000 to get f@Re~transitional~
end
if Re>= 4000                  %if Re is turbulent, do turbulent calculations
    f= fzero(@(f) (1/sqrt(f)+(2)*log10((relRough/3.7)+(2.51/(Re*sqrt(f))))),[.001 .1]); %solve Colebrook eq
end
end
