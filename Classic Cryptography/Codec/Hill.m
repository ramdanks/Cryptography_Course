function str = Hill(string, key)
    str = [];
    % get string as alphabet and spaces only
    string = string(regexp(string,'[a-zA-Z\s]'));
    % get space char indices
    spaceIndices = regexp(string,'\s');
    % get as alphabet only for encrypting
    string = string(regexp(string,'[a-zA-Z]'));
    string = lower(string);
    [rows cols] = size(key);
    remainder = mod(length(string), rows);
    % matrix of string should be able to multiply with matrix of key
    % if not, fill the gap with 'z' values
    if (remainder)
        fill = 'z' * ones(1, rows - remainder);
        string = [string, fill];
    end
    % error handling if key can't be inversed
    if (det(key) == 0)
       msg = 'The key is not valid, cannot be inversed';
       throw(MException(1,msg));
    end
    % reshape text into matrices (2d array)
    % so we can multiply with key matrice
    rowsize = length(string) / rows;
    str = reshape(string, rows, rowsize).';
    str = str - 97;
    str = str * key;
    str = mod(str, 26);
    str = reshape(str.',1,[]);
    % return with an uppercase, indicating ciphered text
    str = char(str + 65);
    % insert space char
    if ~(isempty(spaceIndices))
        c = false(1,length(str)+length(spaceIndices));
        c(spaceIndices) = true;
        result = nan(size(c));
        result(~c) = str;
        result(c) = ' ';
        str = char(result);
    end
end