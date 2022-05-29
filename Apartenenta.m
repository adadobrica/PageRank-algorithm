function y = Apartenenta(x, val1, val2)
% the values of a and b are found by using the definition of a continuous
% function, which is finding the lateral limits
if x >= 0 && x < val1
    y = 0;
elseif x > val2 && x <= 1
    y = 1;
else 
    a = -1 / (val1 - val2);
    b = val1 / (val1 - val2);
    y = a*x + b;
end
end