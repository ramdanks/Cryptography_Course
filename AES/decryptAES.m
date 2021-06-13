function [state] = decryptAES(cipher, key)
    % get every round key
    keyRnd = KeySchedule(key);
    % initial round
    state = bitxor(cipher, cell2mat(keyRnd(:,11)));
    for round = 10:-1:1
        % Shift Rows
        state = InvShiftRows(state);
        % Byte Substitution
        state = InvSubBytes(state);
        % XOR with Round Key
        state = bitxor(state, cell2mat(keyRnd(:,round)));
        % Mix Columns
        if (round ~= 1)
            state = InvMixColumns(state);
        end
    end
end