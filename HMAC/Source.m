% [1] == Alice membangun RSA == %
p = 8831;
q = 9769;
% Generate Keys
[pub, priv, modulo] = GenerateRSA(p, q);
% mengirim kunci public
sharedSecureKey = [69, 76, 12, 45];
 
% [2] == Bob mengirim pesan == %
message = 'Hello Ramadhan!';
% Membuat Message Authentication Code melalui HMAC-SHA-512
hmac_digest = HMAC(sharedSecureKey, message, 'SHA-512');
% Append ke Message yang ingin Dikirim
signed_msg  = strcat(message, hmac_digest);
% Enkripsi dengan Public Key
signed_msg = double(signed_msg);
for i=1:length(signed_msg)
    signed_msg(i) = FastExponent(signed_msg(i), pub, modulo);
end

display(signed_msg);

% [3] == Alice menerima pesan un-altered== %
% Dekripsi dengan Private Key
for i=1:length(signed_msg)
    signed_msg(i) = FastExponent(signed_msg(i), priv, modulo);
end
signed_msg = char(signed_msg);
% Tes Integritas dan Keaslian data menggunakan HMAC
ValidationTest(signed_msg, sharedSecureKey, 'SHA-512');

% [EX] == Alice menerima pesan altered == %
signed_msg(7) = 'V';
signed_msg(10) = 'o';
% Dekripsi dengan Private Key
for i=1:length(signed_msg)
    signed_msg(i) = FastExponent(signed_msg(i), priv, modulo);
end
signed_msg = char(signed_msg);
% Tes Integritas dan Keaslian data menggunakan HMAC
ValidationTest(signed_msg, sharedKey, 'SHA-512');