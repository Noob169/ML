clc;
clear all;
close all;

disp("<-----------LOADING DATASETS-------------->");
PATH=input("Enter PATH: ");
data=load(PATH);
disp("DATASETS LOADED");
disp("Press Enter to continue:");
pause;

disp("<-----------DESCRIBING THE DATA----------->");
no_of_features=size(data,2)-1;
no_of_training_examples=size(data,1);
X=[ones(no_of_training_examples,1) data(:,1:no_of_features)];
Y=[data(:,size(data,2))];
fprintf("Data has %d features and %d training examples\n",no_of_features,no_of_training_examples);
disp("Printing the first 10 training examples along with their actual values");
disp([X(1:10,2:size(X,2)) Y(1:10,:)]);
disp("Press Enter to continue:");
pause;

disp("<-----------FEATURE NORMALIZATION---------->");
[X,mu,sigma]=featureNormalize(X);
disp("Features normalized.....displaying normalized dataset:");
disp([X(1:10,2:size(X,2)) Y(1:10,:)]);
fprintf("Mean:=");
disp(mu);
disp("S.D:=");
disp(sigma);
disp("Press Enter to continue:");
pause;

disp("<-----------DATA VISUALIZATION------------->");
disp("...visualizing dataset:");
visualizeData(X,Y);
disp("Press Enter to continue:");
pause;

disp("<----------RUNNING GRADIENT DESCENT--------->");
disp("...running gradient descent to estimate parameters....");
alpha=0.01;
num_iter=400;
theta=zeros(no_of_features+1,1);
[theta,J]=gradientDescent(alpha, num_iter, X, Y, theta);
disp("parameters calculated:=");
disp(theta');
plot(1:1:num_iter,J');
disp("Press Enter to continue:");
pause;

disp("<----------USING NORMAL EQUATIONS TO ESTIMATE PARAMETERS--------->");
theta_ne=zeros(no_of_features+1,1);
theta_ne=pinv(X'*X)*X'*Y;
disp("parameters calculated:=");
disp(theta_ne');
disp("Press Enter to continue:");
pause;

disp("<----------EVALUATING THE HYPOTHESES FUNCTION------->");
test_PATH=input("Enter PATH for testing dataset: ");
test=load(test_PATH);
disp("Printing the first 5 rows of the test dataset:");
if(size(test,1)<5)
  disp(test);
else
  disp(test(1:5,:));
end
test_X=[ones(size(test,1),1) test(:,1:size(test,2)-1)];
test_Y=test(:,size(test,2));
disp("...normalizing testing data....");
[gd_test_X mu_2 sigma_2]=featureNormalize(test_X);
disp("...predicting values using parameters estimated by Gradient Descent....");
gd_Y=modelEvaluation(gd_test_X,test_Y,theta);
disp(".....Visualizing predicted and actual values, with the first feature as X-axis......");
clf;
scatter(test_X(:,2),gd_Y);
hold on;
scatter(test_X(:,2),test_Y);
legend('Predicted values','Actual Values');
J_gd=computeCost(theta,gd_test_X,test_Y);
fprintf("\nCost calculated for Gradient descent is:= %.4f",J_gd);
disp("...predicting values using parameters estimated by Normal Equations....");
ne_Y=modelEvaluation(gd_test_X,test_Y,theta_ne);
J_ne=computeCost(theta_ne,gd_test_X,test_Y);
fprintf("\nCost calculated for Normal Equations is:= %.4f",J_ne);
