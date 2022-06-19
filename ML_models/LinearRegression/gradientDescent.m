function [theta_f,J] = gradientDescent(alpha, num_iter, X, Y, theta)
  m=length(Y);
  n=size(X,2);
  theta_f=theta;
  J=zeros(num_iter,1);
  for i=1:num_iter
    H=X*theta_f;
    H=H-Y;
    theta_f=theta_f-(alpha/m)*(X'*H);
    J(i)=computeCost(theta_f,X,Y);
  endfor
end
