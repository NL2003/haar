function hide(name, secret)
  image = imread(name);

  f = image(:, :, 1);

  [m, n] = size(f);
  [L, H] = haar_dwt(f(:));

  % 假设输入都是2^n * 2^n的，对L进行8x16分块
  count = length(L)/128;
  Z = genZ(8, 16);
  k = zeros(1, count);
  for i = 1:count
    mat1 = reshape(L((i - 1) * 128 + 1 : i * 128), 8, 16);
    alpha = diff_stats(mat1, Z);
    k(i) = alpha;
  end

  %hist(k, 600);

  T = 5;

  fd = fopen(secret, "r");
  msg = fread(fd,'ubit1');
  fclose(fd);
  msg = uint8(msg);
  msg = logical(msg);
  len = length(msg);

  for i = 1:len
    mat1 = reshape(L((i - 1) * 128 + 1 : i * 128), 8, 16);
    mat1 = translate(mat1, msg(i), T, k(i));
    L((i - 1) * 128 + 1 : i * 128) = mat1(:);
  end

  for i = 1:count
    mat1 = reshape(L((i - 1) * 128 + 1 : i * 128), 8, 16);
    alpha = diff_stats(mat1, Z);
    k(i) = alpha;
  end

  hist(k, 600);

  f = inv_haar_dwt(L, H);
  f = reshape(f, 512, 512);
  image(:, :, 1) = f;
  imwrite(image, "save.png");
end

