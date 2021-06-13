function str = HillCipher(string, key)
    str = [];
    string = string(isstrprop(string, 'alpha'));
    string = lower(string);
    [rows cols] = size(key);
    remainder = mod(length(string), rows);
    if (remainder)
        fill = 'z' * ones(1, rows - remainder);
        string = [string, fill];
    end
    % matrix of string should be able to multiply with matrix of key
    % if not, fill the gap with 'z' values
    rowsize = length(string) / rows;
    str = reshape(string, rows, rowsize).';
    str = str - 97;
    str = str * key;
    str = mod(str, 26);
    str = reshape(str.',1,[]);
    str = char(str + 65);
end