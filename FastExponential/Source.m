count = 0;
if (FastExponent(2, 50, 13) == 4) count = count + 1; end
if (FastExponent(2, 40, 13) == 3) count = count + 1; end
if (FastExponent(2, 90, 13) == 12) count = count + 1; end
if (FastExponent(17, 22, 21) == 4) count = count + 1; end
sprintf('%d/4', count)

listBase = [15, 262, 2515, 92124, 219124, 7823112, 81231231];
listExp = [91, 231, 5122, 12832, 341243, 3217312, 73312122];
fixMod = 10000;

yFast = zeros(1, length(listExp));
for i = 1:length(listExp)
    f = @() FastExponent(listBase(i), listExp(i), fixMod);
    yFast(i) = timeit(f);
end

yReg = zeros(1, length(listExp));
for i = 1:length(listExp)
    f = @() RegularExponent(listBase(i), listExp(i), fixMod);
    yReg(i) = timeit(f);
end

x = 2:length(listExp)+1;
plot(x, yFast, x, yReg, 'LineWidth', 4);
title('Time Complexity');
xlabel('Decimal Digits');
ylabel('Time (second)');
legend({'y = Fast Exponent','y = Regular Exponent'});