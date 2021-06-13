function PlotGrouping(text, size)
    text = text(regexp(text, '[a-zA-Z]'));
    text = upper(text) - 65;
    count = zeros(size,26);
    g = 1;
    for i = 1:length(text)
        c = text(i);
        count(g,c+1) = count(g,c+1) + 1;
        if (g == size) g = 0; end;
        g = g + 1;
    end
    for i = 1:size
       subplot(size,1,i);
       y = count(i,:);
       bar(y);
       title(sprintf('Group:%d', i));
    end
end