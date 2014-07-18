%Create adjacency matrix considering spatial proximity
function Matadj=create_MatAdj_SP(nnodes, ncolum, connected)    
% code based on
% http://stackoverflow.com/questions/3277541/construct-adjacency-matrix-in-matlab

nrows=nnodes/ncolum;      

%# which distance function
if connected == 4,     distFunc = 'cityblock';
elseif connected == 8, distFunc = 'chebychev'; end

%# compute adjacency matrix
[X Y] = meshgrid(1:ncolum,1:nrows);
X = X(:); Y = Y(:);
Matadj = squareform( pdist([X Y], distFunc) == 1 );


