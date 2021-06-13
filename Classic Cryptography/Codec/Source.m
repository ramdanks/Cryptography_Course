AFFINE   = 1;
MULTIP   = 2;
PLAYFAIR = 3;
HILL     = 4;
VIGENERE = 5;

FILE_ENC = {'Encode\affine.txt';
            'Encode\multiplicative.txt';
            'Encode\playfair.txt';
            'Encode\hill.txt';
            'Encode\vigenere.txt'};

FILE_DEC = {'Decode\affine.txt';
            'Decode\multiplicative.txt';
            'Decode\playfair.txt';
            'Decode\hill.txt';
            'Decode\vigenere.txt'};

viginereKey = 'KUNCI';
multipKey   = 11;
hillKey     = [3  7  11 13;
               4  7  5  6;
               2  21 14 9;
               3  23 21 8];
affineKey1  = 11;
affineKey2  = 13;
playfairKey = ['l', 'g', 'd', 'b', 'a';
               'q', 'm', 'h', 'e', 'c';
               'u', 'r', 'n', 'i', 'f';
               'x', 'v', 's', 'o', 'k';
               'j', 'y', 'w', 't', 'p'];

% Encoding using Cipher
for i = 1:size(FILE_ENC)
    file = char(FILE_ENC(i));
    text = importdata(file);
    if ~(isempty(text))
        fprintf('ENCODING!\n');
        for j = 1:size(text)
            string = char(text(j));
            switch (i)
                case AFFINE
                    cipher = Affine(string, affineKey1, affineKey2);
                case MULTIP
                    cipher = Multiplicative(string, multipKey);
                case PLAYFAIR
                    cipher = PlayFair(string, playfairKey);
                case HILL
                    cipher = Hill(string, hillKey);
                case VIGENERE
                    cipher = Vigenere(string, viginereKey);
            end
            fprintf('%s\n', cipher);
        end
    end
end

% Decoding using Decipher
for i = 1:size(FILE_DEC)
    file = char(FILE_DEC(i));
    text = importdata(file);
    if ~(isempty(text))
        fprintf('DECODING!\n');
        for j = 1:size(text)
            string = char(text(j));
            switch (i)
                case AFFINE
                    decipher = DecipherAffine(string, affineKey1, affineKey2);
                case MULTIP
                    decipher = DecipherMultiplicative(string, multipKey);
                case PLAYFAIR
                    decipher = DecipherPlayFair(string, playfairKey);
                case HILL
                    decipher = DecipherHill(string, hillKey);
                case VIGENERE
                    decipher = DecipherVigenere(string, viginereKey);
            end
            fprintf('%s\n', decipher);
        end
    end    
end