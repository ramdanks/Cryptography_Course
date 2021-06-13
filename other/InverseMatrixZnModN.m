% Nama: Ramadhan Kalih Sewu
% NPM: 1806148826
% Tentang: Inverse Matrix Zn Modulo n

% menentukan n dan matrix yang diinginkan
n = 36;
matrice = [3 2 ; 4 7];
display(matrice)

% deklarasi rumus dalam matlab
% menggunakan linear diophantine equation
% menentukan nilai x yang memungkinkan
syms x y integer                
eqn = det(matrice)*x == n*y + 1;
[xSol, ySol] = solve(eqn,[x y])

% menghitung nilai cofactor matrix
[r c] = size(matrice);          
m = ones(r,c);
a_temp = matrice;
for i = 1:r
    for k = 1:c
        a_temp(i,:) = [];   %remove ith row
        a_temp(:,k) = [];   %remove kth row
        m(i,k) = ((-1)^(i+k)) * det(a_temp);  %compute cofactor element
        a_temp = matrice;   %reset elements of temporary matrix to input elements
    end  
end

% untuk mendapatkan inverse matrix = transpose matrix
% kemudian kalikan dengan x yaitu inverse det(matrix) mod n
matrice = xSol * m.';
% modulo inverse matrix dengan n
matrice = mod(matrice, n);
display(matrice)