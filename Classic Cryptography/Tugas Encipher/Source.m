
viginereKey = 'pascal';
multiplicativeKey = 17;
hillKey = [9 7 11 13; 4 7 5 6; 2 21 14 9; 3 23 21 8];
affineKey1 = 17;
affineKey2 = 11;
playfairKey = [0:1:4; 5:1:9; 10:1:14; 15:1:19; 20:1:24];
playfairKey = char(playfairKey + 65);

data = importdata('sample.txt');

for i = 1:size(data)
    
    ss = char(data(i));
    display(ss);
    
    vCipher = Viginere(ss, viginereKey);
    display(vCipher);
    
    mCipher = Multiplicative(ss, multiplicativeKey);
    display(mCipher);
    
    hCipher = HillCipher(ss, hillKey);
    display(hCipher);
    
    aCipher = Affine(ss, affineKey1, affineKey2);
    display(aCipher);
    
    pfCipher = PlayFair(ss, playfairKey);
    display(pfCipher);
    
end