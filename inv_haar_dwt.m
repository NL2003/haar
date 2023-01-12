function f = inv_haar_dwt(L, H)
  n = length(L);
  f = zeros(1, n * 2);
  for i = 1:n
    xl = L(i);
    xh = H(i);
    f(i * 2 - 1) = xl + floor((xh + 1) / 2);
    f(i * 2) = xl - floor(xh / 2);
  end
end

