function key = DigestMultiplicative(cipher, dicts, start, stop)
    firstword = strtok(cipher);
    for i = start:stop
       res = DecipherMultiplicative(firstword, i);
       idx = find(ismember(dicts, res));
       if (~isempty(idx))
           key = i;
           return;
       end
    end
end