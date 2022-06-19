function [X,mu,sigma]=featureNormalize(X)
  m=size(X);
  mu=mean(X(:,2:m(2)));
  sigma=std(X(:,2:m(2)));
  M=ones(m(1),m(2)-1).*mu;
  S=ones(m(1),m(2)-1).*sigma;
  X(:,2:m(2))=(X(:,2:m(2))-M)./S;
end

