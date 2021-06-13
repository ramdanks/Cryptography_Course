function [y] = RegularExponent(base, exp, modulo)
    if (exp == 0) y = 1; else y = base; end
    for i = 1:exp
       y = y * y; 
    end
    y = mod(y, modulo);    
end