T = zeros(10,784);
T(1,:) = mean(test0);
T(2,:) = mean(test1);
T(3,:) = mean(test2);
T(4,:) = mean(test3);
T(5,:) = mean(test4);
T(6,:) = mean(test5);
T(7,:) = mean(test6);
T(8,:) = mean(test7);
T(9,:) = mean(test8);
T(10,:) = mean(test9);
for n = 1:10
    subplot(2,5,n);
    digit = T(n,:);
    digitImage = reshape (digit,28,28);
    image(rot90(flipud(digitImage),-1));
    colormap(gray(256));    
    axis square tight off
end

