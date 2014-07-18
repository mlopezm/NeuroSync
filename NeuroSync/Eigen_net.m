function  Eigen_net()

%calculate and print the eigenvalues of the connectivity network adjacency
%and laplacian matrix and the weighted equivalents taking into account the
%weights in each edge

global MExterna; %input values
global S; %input values
global eigenA; %output values
global eigenL;  %output values
global eigenAw;  %output values
global eigenLw; %output values

eigenA=eig_cal(MExterna);
t1=sum(MExterna,2);
t2=diag(t1);
eigenL=eig_cal(t2-MExterna);

eigenAw=eig_cal(S);
t1=sum(S,2);
t2=diag(t1);
eigenLw=eig_cal(t2-S);

assignin('base','eigenA',eigenA);
save .\files\eigen\eigenA.mat eigenA;

assignin('base','eigenL',eigenL);
save .\files\eigen\eigenL.mat eigenL;

assignin('base','eigenAw',eigenAw);
save .\files\eigen\eigenAw.mat eigenAw;

assignin('base','eigenLw',eigenLw);
save .\files\eigen\eigenLw.mat eigenLw;

% figure_print(eigenA, 'Eigenvalues Adjacency of connectivity');
% figure_print(eigenL, 'Eigenvalues Laplacian of connectivity');
% figure_print(eigenAw, 'Eigenvalues Adjacency of weighted connectivity');
% figure_print(eigenLw, 'Eigenvalues Laplacian of weighted connectivity');
end

