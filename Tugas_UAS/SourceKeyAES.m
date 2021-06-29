e = 1231;
modulo = 93368903;
%% 1
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
%% 2
encryptedKeyAES = hex2dec('038D03A7');
originalKeyAES = FastExponent(encryptedKeyAES, e, modulo);
% padding, 8 digit hexadecimal untuk merepresentasi 1 kolom key AES
originalKeyAES = num2str(originalKeyAES,'%08x');
% pecah 2 karakter (digit hexadecimal) untuk membentuk 4 cell
col = cellstr(reshape(originalKeyAES,2,[])');
% format ke bentuk matrix 4x4 sebagai kunci AES
fKeyAES = cell(4);
fKeyAES(:,:) = {'00'};
fKeyAES(1,:) = col
% ubah ke format decimal untuk diproses AES
fKeyAES = reshape(hex2dec(fKeyAES), size(fKeyAES));
%% 3
encryptedKeyAES = [ '03000000'; '8D000000'; '03000000'; 'A7000000' ];
% format ke bentuk matrix 4x4 sebagai kunci AES
originalKeyAES = cell(4);
for i=1:size(encryptedKeyAES)
    cipher = hex2dec(encryptedKeyAES(i,:));
    plain = FastExponent(cipher, e, modulo);
    % padding, 8 digit hexadecimal untuk merepresentasi 1 kolom key AES
    plain = num2str(plain, '%08x');
    % pecah 2 karakter (digit hexadecimal) untuk membentuk 4 cell
    col = cellstr(reshape(plain,2,[])');
    originalKeyAES(i,:) = col;
end
% tampilkan hasil kunci AES asli
display(originalKeyAES);
% ubah ke format decimal untuk diproses AES
originalKeyAES = reshape(hex2dec(originalKeyAES), size(fKeyAES));