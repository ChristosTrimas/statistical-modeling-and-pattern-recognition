function aRatio = computeAspectRatio(images)
%     [num_rows, num_cols] = size(images);
%     aRatio = zeros(num_rows,num_cols);
    % Fill your code
    sum_row = sum(images, 2);
    sum_col = sum(images, 1);
    min_row = find(sum_row, 1);
    max_row = find(sum_row, 1, 'last');
    min_col = find(sum_col, 1);
    max_col = find(sum_col, 1, 'last');
    width = max_col-min_col+1;
    height = max_row-min_row+1;
    aRatio = width/height;
    
end

