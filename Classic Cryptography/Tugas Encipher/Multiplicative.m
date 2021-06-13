function str = Multiplicative(string, key)
    str = [];
    for i = 1:length(string)
        x = string(i);
        if     (x >= 65 && x <= 90)  y = x - 65;
        elseif (x >= 97 && x <= 122) y = x - 97;
        else                         continue;
        end
        str(end + 1) = mod(y * key, 26);
    end
    str = char(str + 65);
end
   