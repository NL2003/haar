function [L, H] = haar_dwt(f)
  n = length(f);
  n = n / 2;
  L = zeros(1,n);   % 低频子带
  H = zeros(1,n);   % 高频子带
  for i = 1:n
    x1 = f(2 * i - 1);
    x2 = f(2 * i);
    L(i) = floor((x1 + x2) / 2);
    H(i) = x1 - x2;
  end
end

