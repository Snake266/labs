arr = test_ode(); %Применяем вышенаписанную функцию.
[T,Y] = ode23(@oscil,[0 15],[1;0]); %Находим решения по Рунге-Кутту 2,3 порядка.
arr_23 = [T Y]; %Заносим полученные данные в отдельный массив.
y = @(t) exp(-t).*((87/85)*cos(3*t)+(26/85)*sin(3*t))...
+(9*sin(t)-2*cos(t))/85; %Функция зависимости координаты от t.

%Так как мы знаем, что скорость - это производная координаты по времени, то
%для нахождения функции зависимости скорости от t, необходимо взять
%производную от функции зависимости координаты от t:

dy = @(t) (9*cos(t))/85 + (2*sin(t))/85 - exp(-t).*((87*cos(3*t))/85 +...
(26*sin(3*t))/85) + exp(-t).*((78*cos(3*t))/85 - (261*sin(3*t))/85);
disp('Отклонение ode45 y:')
max(abs(arr(:,2)-y(arr(:,1))))
disp('Отклонение ode45 dy/dt:')
max(abs(arr(:,3)-dy(arr(:,1))))
disp('Отклонение ode23 y:')
max(abs(arr_23(:,2)-y(arr_23(:,1))))
disp('Отклонение ode23 dy/dt:')
max(abs(arr_23(:,3)-dy(arr_23(:,1))))

%Построим соответствующие графики:
figure(1)
hold on,grid on
plot(arr(:,1),arr(:,2),'b')
plot(arr(:,1),y(arr(:,1)),'r')
title('ode45 y(t)')

figure(2)
hold on,grid on
plot(arr(:,1),arr(:,3),'b')
plot(arr(:,1),dy(arr(:,1)),'r')
title('ode45 y*(t)')
figure(3)
hold on,grid on
plot(arr_23(:,1),arr_23(:,2),'b')
plot(arr_23(:,1),y(arr_23(:,1)),'r')
title('ode23 y(t)')

figure(4)
hold on,grid on
plot(arr_23(:,1),arr_23(:,3),'b')
plot(arr_23(:,1),dy(arr_23(:,1)),'r')
title('ode23 y*(t)')