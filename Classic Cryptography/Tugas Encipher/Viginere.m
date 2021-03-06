function str = Viginere(string, key)
    str = [];
    key = double(lower(key) - 97);
    j = 1;
    for i = 1:length(string)
       x = string(i);
       if     (x >= 65 && x <= 90)  y = x - 65;
       elseif (x >= 97 && x <= 122) y = x - 97;
       else                         continue;
       end
       str(end + 1) = mod(y + key(j), 26);
       if (j == length(key)) j = 0; end
       j = j + 1;
    end
    str = char(str + 65);
end