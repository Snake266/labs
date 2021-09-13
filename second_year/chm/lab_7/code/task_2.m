function F = oscil(t,y)
    F = [y(2);-2*y(2)-10*y(1)+sin(t)] ;
end

function res = test_ode()
    Y0 = [1;0];
    [T,Y] = ode45(@oscil,[0 15] ,Y0 );
    res = [T,Y];
end

arr=test_ode();