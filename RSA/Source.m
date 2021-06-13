% Nilai p dan q kesepakatan soal
% Dalam dunia nyata, ini boleh di random
p = 8831;
q = 9769;

% Pesan yang ingin di enkripsi
M = 150;

% Generate Keys
[pub, priv, modulo] = GenerateRSA(p, q);

% Encryption RSA
C = FastExponent(M, pub, modulo);

% Decryption RSA
P = FastExponent(C, priv, modulo);

% Uji Kebenaran Hasil
display(P);
if (P == M) display('VALID!'); end