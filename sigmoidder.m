function output=sigmoidder(a)
output=sigmoid(a).*(1-sigmoid(a));

-	Script: nn.m

load('mnist_all.mat')
?
w_1=randn(256,784)/100;%[input hidden]
w_2=randn(10,256)/100;%[hidden output]
M=double(train_set')/255.0;
?
    % build the Multilayer Network %
    output_1=sigmoid((w_1*M(:,x)));% hidden layer output
    output_2=sigmoid(w_2*output_1);% ouput layer output
    output_3=sigmoidder((w_1*M(:,x)));% hidden layer gradient
    output_4=sigmoidder(w_2*output_1);% ouput layer gradient
    minus=output(:,x)-output_2;
%     for i=1:256
%     output_5=[output_5,sum(minus.*output_4.*output_1(i,:),2)];%detaj
%     end
    output_5=minus.*output_4.*output_1';
    deltaj=minus.*output_4;
    m=w_2'*(output_4.*minus);
    output_6=output_3.*m;
    output_7=[];
%     %
%     for i=1:784
%         output_7=[output_7,sum(output_6.*M(i,x),2)];
%     end
%     %
    output_7=output_6.*M(:,x)';
    w_1=w_1+y*output_7;
    w_2=w_2+y*output_5;
%     if x==60000
%     minus1=output-output2;
% 
 
%     
    n=n+1;
%     end
hidden=sigmoid(w_1*test_set);
out=sigmoid(w_2*hidden);
?
save('weight.mat','w_1','w_2');
-	Script: Demo.m as follows: 

load('weight.mat')
load('mnist_all.mat')
test_set=[test0;test1;test2;test3;test4;test5;test6;test7;test8;test9];
test_set=double(test_set')/255.0;% normalization
% here we can replace the test_set with any digit feature, 
% the shape should be(784,n), where n is the sample size, 
% 784 is the dims of feature, there we use the test set to 
% check whether our program goes right. (index-1) is the
% final result.
hidden=sigmoid(w_1*test_set);
out=sigmoid(w_2*hidden);
[value,index]=max(out,[],1);
index-1;
