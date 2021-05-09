df1 = @(x, h) (sin(x+h) - sin(x))/h;
df2 = @(x, h) (sin(x+h) - sin(x-h))/(2*h);

x = 0;
for h = [1/2, 1/4, 1/8]
   printf("Значение производной по первой формуле, для h = %f: %f\n", h, df1(x, h))
end
printf("\n")
for h = [1/2, 1/4, 1/8]
    printf("Значение производной по второй формуле, для h = %f: %f\n", h, df2(x, h))
end
