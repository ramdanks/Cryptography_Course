function key = DigestHill(cipher, expected, keyRowSize)
    cipher = cipher(1:keyRowSize^2);
    cipher = upper(cipher)-65;
    expected = expected(1:keyRowSize^2);
    expected = upper(expected)-65;
    C = reshape(cipher,[],keyRowSize)';
    T = reshape(expected,[],keyRowSize)';
    n = 26;
    m = round(mod(det(T),n));
    [d,s,t] = gcd(n,m);
    if d == 1
		Tinverse = round(t*det(T)*inv(T));
		Tinverse = mod(Tinverse,n);
    else
		Tinverse = NaN;
    end
    key = mod(Tinverse*C,26);
end
