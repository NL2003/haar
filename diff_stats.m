function sum = diff_stats(mat1, mat2)
  sum = 0;
  [m n] = size(mat1);
  for i = 1:m
    for j = 1:n
      sum = sum + mat1(i, j) * mat2(i, j);
    end
  end
end

