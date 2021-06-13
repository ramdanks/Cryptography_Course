function str = PlayFair(string, key)
    str = [];
    % set all to upper case for shifting
    string = upper(string);
    key = upper(key);
    % remove character that's not in the key
    temp = [];
    for i = 1:length(string)
        x = string(i);
        [row, col] = find(key == x, 1);
        if (isempty(row)) continue; end
        temp(end + 1) = x;
    end
    string = temp;
    % string length should be divisible by 2
    % the algorithm should detect this with the same char
    % (x1 == x2), so it can fill the gap with 'X'
    len = length(string);    
    if (mod(len, 2) ~= 0) string(end+1) = 'X'; end
    %increse matrix size for by 1-1
    key(end+1,end+1) = 0;
    key(:,end) = key(:,1);
    key(end,:) = key(1,:);
    % play-fair
    for i = 1:2:length(string)
        x1 = string(i);
        x2 = string(i+1);
        % char should be different
        if (x1 == x2) x2 = 'X'; end
        % find index in the key
        [row1, col1] = find(key == x1, 1);
        [row2, col2] = find(key == x2, 1);
        if (row1 == row2)
            str(i) = key(row1, col1 + 1);
            str(i+1) = key(row2, col2 + 1);
        elseif (col1 == col2)
            str(i) = key(row1 + 1, col1);
            str(i+1) = key(row2 + 1, col2);
        else
            str(i) = key(row1, col2);
            str(i+1) = key(row2, col1);
        end
    end
    str = char(str);
end