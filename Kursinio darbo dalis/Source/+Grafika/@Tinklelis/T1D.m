function T1D( x, y )

plot(x, y , '-bo', 'LineWidth', 25/length(x), ...
    'MarkerEdgeColor', 'r');

%elementu numeriai
for i = 1 : (length(x)-1)
    text((x(i)+x(i+1))/2+0.1, (y(i)+y(i+1))/2+0.1,...
     texlabel(num2str(i)), 'FontSize', 8, 'Color', 'blue');
end;

%mazgu numeriai
for i = 1 : length(x)
    text(x(i)-0.1, y(i)+0.2,...
     texlabel(num2str(i)), 'Color', 'red');
end;

end