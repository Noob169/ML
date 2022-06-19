function pred_Y=modelEvaluation(X,Y,theta)
  disp("Predicting for testing data....");
  pred_Y=X*theta;
  test=[X pred_Y Y];
  disp("Test features\t\tPredicted Value\tActual value");
  disp(test);
end

