function dy_dt = lamBoundLayerVeloODE(n,y)

f = 0;

y1 = f;
y2 = diff(y1);
y3 = diff(y2);

dy_dt(1,1) = y(2);
dy_dt(2,1) = y(3);
dy_dt(3,1) = -.5*y(1)*y(3);
end
