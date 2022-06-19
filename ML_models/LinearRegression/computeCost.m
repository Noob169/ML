function J = computeCost(theta,X,Y)
  m=size(X,1);
  H=X*theta;
  H=(H-Y).^2;
  J=(1/(2*m))*sum(H);
end

