AFFINE   = 1;
MULTIP   = 2;
PLAYFAIR = 3;
HILL     = 4;
VIGENERE = 5;

FILE_DEC = {'Decode\affine.txt';
            'Decode\multiplicative.txt';
            'Decode\playfair.txt';
            'Decode\hill.txt';
            'Decode\vigenere.txt'};

viginereKey = 'ASLI';

hDecipher = 'KCJTWPJVGXSOTRNQGK';
hExpected = 'nrepublikindonesia';
hKeyRowSize = 3;

kamus = importdata('kosakata-kamus.txt');
kamus = cellstr(kamus);

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
                    [key1,key2] = DigestAffine(string, kamus, 1, 100);
                    fprintf('Found AKey: %d, %d\n', key1, key2);
                    decipher = DecipherAffine(string, key1, key2);
                case MULTIP   
                    key = DigestMultiplicative(string, kamus, 21, 1000);
                    fprintf('Found MKey: %d\n', key);
                    decipher = DecipherMultiplicative(string, key);
                case HILL
                    key = DigestHill(hDecipher, hExpected, hKeyRowSize);
                    display(key);
                    decipher = de_hill(string, key);
                case VIGENERE
                    PlotGrouping(string, 4);
                    decipher = DecipherVigenere(string, viginereKey);
            end
            fprintf('%s\n', decipher);
        end
    end    
end