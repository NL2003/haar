function getmsg(name, len)
  image = imread(name);
  f = image(:, :, 1);

  [m, n] = size(f);
  [L, H] = haar_dwt(f(:));

  % 假设输入都是2^n * 2^n的，对L进行8x16分块
  count = length(L) / 128;
  Z = genZ(8, 16);
  k = zeros(1, count);
  for i = 1:count
    mat1 = reshape(L((i - 1) * 128 + 1 : i * 128), 8, 16);
    alpha = diff_stats(mat1, Z);
    k(i) = alpha;
  end

  frr = fopen("save.txt", 'w');
  for i = 1:len
    if k(i) >= 0 
      fwrite(frr, 1, 'ubit1');
    else
      fwrite(frr, 0, 'ubit1');  
    end
  end

  fclose(frr);

end

