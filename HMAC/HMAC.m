function [hmac] = HMAC(Key, Msg, Method)
    if strcmp(Method,'MD5') || strcmp(Method,'SHA-1') || strcmp(Method,'SHA-256')
        BlockSize         = 64;
    else
        BlockSize         = 128;
    end
    KeySize           = numel(Key);
    Key               = uint8(Key);  % Hash it if it is longer than BlockSize
    ipad(1:BlockSize) = uint8(54);   % 0x36
    ipad(1:KeySize)   = bitxor(uint8(54), Key);
    opad(1:BlockSize) = uint8(92);   % 0x5c
    opad(1:KeySize)   = bitxor(uint8(92), Key);
    Engine2 = java.security.MessageDigest.getInstance(Method);
    Engine2.update(ipad);
    Engine2.update(uint8(Msg));
    iHash = typecast(Engine2.digest, 'uint8');
    Engine2.update(opad);
    Engine2.update(iHash);
    hmac = typecast(Engine2.digest, 'uint8')';
end