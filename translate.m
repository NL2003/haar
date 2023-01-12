function I = translate(mat, w, T, alpha)
  [m n] = size(mat);
  I = zeros([m n]);
  for i = 1:m
    for j = 1:n
      if alpha >= 0
        if mod(i, 2) == mod(j, 2)
          I(i, j) = mat(i, j) + (2 * w - 1) * (T - floor(alpha / (m * n)));
        else
          I(i, j) = mat(i, j) - (2 * w - 1) * (T + floor(alpha / (m * n)));
        end
      else
        if mod(i, 2) == mod(j, 2)
          I(i, j) = mat(i, j) + (2 * w - 1) * (T - ceil(alpha / (m * n)));
        else
          I(i, j) = mat(i, j) - (2 * w - 1) * (T + ceil(alpha / (m * n)));
        end
      end
    end
  end
end

