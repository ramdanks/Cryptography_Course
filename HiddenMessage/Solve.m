rgbImg = imread('Teh dan kabut pesan.png');

redChannel   = rgbImg(:,:,1); % Red channel
greenChannel = rgbImg(:,:,2); % Green channel
blueChannel  = rgbImg(:,:,3); % Blue channel

redArray = reshape(redChannel.',1,[]);
blueArray = reshape(blueChannel.',1,[]);

result = [];
for i=1:380:length(redArray)
    result(end + 1) = redArray(i);
    if (length(result) == 673) break; end
end

for i=1:length(result)
    if (result(i) >= 97 && result(i) <= 122)
        result(i) = result(i) - 32;
    end
end

fid = fopen('out.txt', 'wt');
fprintf(fid, '%c', result);
fclose(fid);

ir = 1;
for i=1:380:length(blueArray)
    blueArray(i) = result(ir);
    if (ir == 673) break; end
    ir = ir + 1;
end

blueChannel = reshape(blueArray, [512,512]);
blueChannel = blueChannel.';
recombinedImg = cat(3, redChannel, greenChannel, blueChannel);

subplot(1, 2, 1);
imshow(rgbImg);
title('Original RGB Image', 'FontSize', 10)

subplot(1, 2, 2);
imshow(recombinedImg);
title('Recombined RGB Image', 'FontSize', 10)