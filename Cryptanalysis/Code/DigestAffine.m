function [key1,key2] = DigestAffine(cipher, dicts, start, stop)
    key1 = [];
    key2 = [];
    firstword = strtok(cipher);
    for i = start:stop
        for j = start:stop
            res = DecipherAffine(firstword, i, j);
            idx = find(ismember(dicts, res));
            if (~isempty(idx))
                key1 = i;
                key2 = j;
                return;
           end
        end
    end
end