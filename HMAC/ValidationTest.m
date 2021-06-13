function [] = ValidationTest(signed_msg, key, method)

    get_message  = signed_msg;
    % Sesuai kesepakatan, kita menggunakan algoritma yang sama HMAC-SHA-512 
    % oleh karena itu, kita tahu panjang padded message sebanyak 64 byte
    hmac         = get_message(end-63:end);
    only_message = get_message(1:end-64);
    % kalkulasi nilai HMAC
    hmac_test    = HMAC(key, only_message, method);
    
    fprintf('%s -> ', only_message);
    if (hmac == hmac_test) display('Valid');
    else                   display ('Invalid');
    end
    
end