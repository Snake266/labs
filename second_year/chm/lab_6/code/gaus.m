function X = gaus(A,f)
    if (det(A) == 0) 
        error('Матрица является вырожденной. Решений нет.');
    end
    size_of_a = size(A,1);
    %Полная матрица коэффициентов системы
    M = [A f];
    size_of_m = size(M,2);
    
    %Прямой ход
    for i = 1 : 1 : size_of_a
        M(i, 1 : size_of_m) = M(i, 1 : size_of_m)./M(i,i);
        for j = i+1 : 1 : size_of_a
            M(j,1 : size_of_m) = M(j,1 : size_of_m) - M(i,1 : size_of_m).*M(j,i);
        end
    end
    
    %Обратный ход
    x = zeros(size_of_a, 1);
    for i = size_of_a: -1 : 1
        S = 0;
        for j = i + 1 : 1 : size_of_a
            S = S + x(j,1)*M(i,j);
        end;
        x(i,1)= M(i, size_of_m) - S;
    end
    X = x;
end