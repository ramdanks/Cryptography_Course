function [y] = FastExponent(base, exp, modulo)
    binvec = de2bi(exp);
    y = 1; a = base;
    for i = 1:length(binvec)
        if (binvec(i)) y = mod(y * a, modulo); end
        a = mod(a^2, modulo);
    end
end