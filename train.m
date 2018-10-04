clear ; close all; clc

load('processedimages.mat');
X = imglist;
%add constant term 
X = [ones(size(X,1),1) X];
% where m  = size of data set and n is equal to the number of features after the constant
[m, n] = size(X);
y; %labels

% initial thetas to 0
i_theta = zeros(n, 1);

% percent of data to train with
training_p = .8;

end_training = floor(m * training_p);



% begin logistic regression
options = optimset('GradObj','on','MaxIter',400);

[theta, cost] = fminunc(@(t)(costFunction(t,X,y)), i_theta,options);

fprintf("cost: %d",cost);


for i = end_training:m
  imagesc(reshape(imglist(i,:),h,w));
  prob = sigmoid(X(i,:)*theta);
  fprintf("p: %d\n",prob);
  pause
endfor 