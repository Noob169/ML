function visualizeData(X,Y)
  m=size(X);
  X=X(:,2:m(2));
  if m(2)-1<=4
    for i=1:m(2)-1
      scatter(X(:,i),Y);
      hold on;
    endfor
  endif
end
