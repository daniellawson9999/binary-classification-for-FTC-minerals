clear ; close all; clc

load('processedimages.mat');
X = imglist;
%add constant term 
X = [ones(size(X,1),1) X];
% randomly order X
X = X(randperm(size(X,1)),:); 
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

fprintf("cost: %d\n",cost);

prediction = round(sigmoid(X(end_training:m,:)*theta));
correct = sum(prediction == round(y(end_training:m,1)));
percent_correct = correct / (m-end_training+1) * 100;
fprintf("%d predicted correctly\n",percent_correct);

vizualize = true;
colormap("gray");
if vizualize
  for i = end_training:m
    imagesc(reshape(imglist(i,:),h,w));
    prob = round(sigmoid(X(i,:)*theta));
    if prob
      fprintf("gold mineral\n");
    else
      fprintf("silver mineral\n");
    end
    %fprintf("p: percent %d\n",prob);
    pause
  endfor 
endif

save('weights.mat','theta','h','w');