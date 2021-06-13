function [public, private, modulo] = GenerateRSA(p, q)
    modulo = p * q;
    M = (p-1) * (q-1);
    % Cari nilai e dimana: gcd(e, M) = 1
    % Nilai e ada lebih dari satu, boleh dipilih secara bebas
    % Dalam fungsi ini, kita ambil yang paling kecil saja
    e = 1; out = 0;
    while(out ~= 1)
        e = e + 1;
        out = gcd(e, M);        
    end
    % Line dibawah hanya berlaku untuk demonstrasi
    % dimana nilai p = 8831 & q = 9769;
    e = 1223;
    % Cari nilai d dimana: d * e = 1 mod M
    % atau dengan kata lain: (d * e) % M = 1
    d = 0; out = 0;
    while (out ~= 1)
        d = d + 1;
        out = mod(d * e, M);        
    end
    public = e;
    private = d;
end