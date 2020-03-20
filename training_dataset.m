%Training data sets are usually large, in the tens of thousands of samples,
%so to speed up loading that much data into 1 network which already has to do
%a large amount of calculations, you create sub-samples or smaller batches
%of shuffled data which you input to your network 
%(stochastic gradient descent). For example, given 69,000 samples, you want
%to run 690 samples at a time or 690 samples per batch. This will require 
%100 iterations to completely train all the data. Once the network has 
%looked through the entire training data set that is 1 epoch. A network
%will usually require maybe 10 epochs to train successfully.


function INPUT = training_dataset(batchsize)

load('mnist_all.mat');

T = cell(1,10);
 T{1} = train0;
 T{2} = train1;
 T{3} = train2;
 T{4} = train3;
 T{5} = train4;
 T{6} = train5;
 T{7} = train6;
 T{8} = train7;
 T{9} = train8;
T{10} = train9; 

a = 1;                            %lower bound
b = 10;                           %upper bound
r = (b-a).*rand(1,batchsize) + a; %random array of numbers between 1:10
r0 = rand(1,batchsize);           %random array of numbers between 0:1

INPUT = cell(1,batchsize);        %input cell array of images in column vector format

for i = 1:batchsize %1:50
    r1 = round(r(i));             %turns array (r) into integers to randomly
                                  %select which training digit set to use
    r2 = round(r0(i)*5000);       %random number between 0:1 * 5000
    chosen_set = T{r1};           %chooses random train digit set
    chosen_row = chosen_set(r2,:);%chooses a random row from chosen training digit set
                                  %Not very thorough! A few hundred rows
                                  %are skipped entirely
    INPUT{i} = chosen_row';       %chosen_row is now i-th column in INPUT cell
end                               %INPUT is now a shuffled cell array of random digits
