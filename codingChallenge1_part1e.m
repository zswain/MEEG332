clear all

initGuess = .5;

n = 0:.1:10;
y0 = [0 0 initGuess];
[nSol,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),n,y0);
y2 = ySol(:,2);

diff = y2(100)-1;
if diff > 0
    guess = initGuess;
    while diff > 0
        y0 = [0 0 guess];
        [nSol,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),n,y0);
        y2 = ySol(:,2);
        diff = y2(100)-1;
        if diff > .002
            guess = guess-.001;
        end
        if diff <= .002 && diff > .00014
            guess = guess-.0001;
        end
        if diff <= .00014 && diff > .000035
            guess = guess-.00001;
        end
        if diff <= .000035 && diff > .00001
            guess = guess-.000001;
        end
        if diff <= .00001
            guess = guess-.0000001;
        end
    end
    alpha = guess
end

y0 = [0 0 initGuess];
[nSol,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),n,y0);
y2 = ySol(:,2);

diff = y2(100)-1;
if diff < 0
    guess = initGuess;
    while diff < 0
        y0 = [0 0 guess];
        [nSol,ySol] = ode45(@(n,y) lamBoundLayerVeloODE(n,y),n,y0);
        y2 = ySol(:,2);
        diff = y2(100)-1;
        if diff < -.002
            guess = guess+.001;
        end
        if diff >= -.002 && diff < -.00014
            guess = guess+.0001;
        end
        if diff >= -.00014 && diff < -.000035
            guess = guess+.00001;
        end
        if diff >= -.000035 && diff < -.00001
            guess = guess+.000001;
        end
        if diff >= -.00001
            guess = guess+.0000001;
        end
    end
    alpha = guess
end
