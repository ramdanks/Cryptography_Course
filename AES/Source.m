text = {'19', 'a0', '9a', 'e9'; '3d', 'f4','c6','f8';'e3','e2','8d','48';'be','2b','2a','08'};   
key = {'a0', '88', '23', '2a'; 'fa', '54','a3','6c';'fe','2c','39','76';'17','b1','39','05'};

text = reshape(hex2dec(text), size(text)); 
key = reshape(hex2dec(key), size(key));

cipher = AES(text, key)
decipher = decryptAES(cipher, key)

if (decipher == text) display('Decipher Valid!'); 
else                  display('Invalid Output');
end