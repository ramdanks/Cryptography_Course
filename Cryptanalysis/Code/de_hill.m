function plain = de_hill(cipher,key)
    %set cipher dari index 0
    fromZero = double(cipher)-65;
    %set cipher menjadi matriks
    [bar, kol] = size(fromZero);
    [b, k] = size(key);
    fromZero = reshape(fromZero,[],length(cipher)/k)';
    A = key;
    n = 26;
    
    %mencari inverse matriks dari key
    m = mod(det(A),n);
    p = round(m);
    [d,s,t] = gcd(n,p);
    if d == 1
        invHasil = round(t*det(A)*inv(A));
        invHasil = mod(invHasil,n);
    else
        invHasil = NaN;
    end
    invKey = invHasil;
    
    %mendecrypt per index dengan hill + ASCII lowercase
    plain = mod((fromZero*invKey),26)+97;
    plain = plain';
    %mengubah ke bentuk plain teks (hasil decipher)
    plain = char(plain(:).');
end