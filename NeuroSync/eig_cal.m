function  eigen=eig_cal(X)

% calculate and plot the eigenvalues of X

X=double(X);
[U,S,V] = svd(X);
eigen=diag(S);


end

