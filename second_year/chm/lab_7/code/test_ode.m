function res = test_ode()
    Y0 = [1;0];
    [T,Y] = ode45(@oscil,[0 15] ,Y0 );
    res = [T,Y];
end