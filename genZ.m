function mat = genZ(m, n)
  mat = zeros([m n]);
  for i = 1:m
    for j = 1:n
      if mod(i, 2) == mod(j, 2)
        mat(i, j) = 1;
      else
        mat(i, j) = -1;
      end
    end
  end
end

