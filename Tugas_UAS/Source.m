%% Import Modules for AES & RSA
tld = fileparts(pwd);
dirAES = strcat(tld, '\AES');
dirRSA = strcat(tld, '\RSA');
addpath(dirAES);
addpath(dirRSA);
%% Integrity, Authenticity, and Non-repudiation File Check
% nilai hash yang diketahui
hash = 'c17b830d9043ee6eb764965494bb326a';
checksum = 'c17b830d9043ee6eb764965494e7b4e5';
% ubah ke bentuk decimal untuk bagian 7 hexa yang di enkripsi
encryptedHashPart = hash(end-6:end);
encryptedHashVal = hex2dec(encryptedHashPart);
% dekripsi menggunakan RSA
res = FastExponent(encryptedHashVal, 1223, 93184991);
% ubah hasil ke bentuk hexa
res = num2str(res,'%x');
% selipkan kembali nilai hash pada 7 digit terakhir
hash(end-6:end) = res;
% apabila hasil hash sama dengan checksum, kita yakin bahwa
% file itu berasal dari orang yang sesuai
fprintf('%s : %s\n', hash, checksum);
if (hash == checksum) fprintf('Valid\n'); end
%% Crack Public Key
p = 6959; q = 13417;
% cari nilai e dengan brute force
% dimana d * e kongruen dengan 1 mod M
modulo = p * q;
M = (p-1) * (q-1);
d = 12512191; out = 0; e = 0;
while (out ~= 1)
    e = e + 1;
    out = mod(d * e, M);
end
fprintf('Found Public Key: %d', e);
%% RSA Decryption
% dekripsi RSA menggunakan fast exponent
% karena data dienkripsi menggunakan private key,
% maka public key kita gunakan untuk dekripsi
encryptedKeyAES = hex2dec('038D03A7');
originalKeyAES = FastExponent(encryptedKeyAES, e, modulo);
% padding, 8 digit hexadecimal untuk merepresentasi 1 kolom key AES
originalKeyAES = num2str(originalKeyAES,'%08x');
% pecah 2 karakter (digit hexadecimal) untuk membentuk 4 cell
col = cellstr(reshape(originalKeyAES,2,[])');
% format ke bentuk matrix 4x4 sebagai kunci AES
fKeyAES = cell(4);
fKeyAES(:,:) = {'00'};
fKeyAES(:,1) = col
% ubah ke format decimal untuk diproses AES
fKeyAES = reshape(hex2dec(fKeyAES), size(fKeyAES));
% Penyesuaian key, baris ke 3 ditambah 1
fKeyAES(3,1) = fKeyAES(3,1) + 1
%% Decipher Gambar menggunakan AES
img = imread('cipherImage.png');
for channel=1:3
   fprintf('Processing Channel: %d\n', channel); 
   for row=1:4:256
       for col=1:4:256
           state = img(row:row+3,col:col+3,channel);
           res = decryptAES(double(state), fKeyAES);
           img(row:row+3,col:col+3,channel) = res;
       end
   end  
end 
imshow(img);
imwrite(img, 'result.png');