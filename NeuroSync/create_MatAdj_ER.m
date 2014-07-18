
function MatAdj=create_MatAdj_ER(nnodes, p)          
SizeMatrix = nnodes;
MatAdj= zeros(SizeMatrix, SizeMatrix);
MatAdj=CrearAleatorio(p, MatAdj,SizeMatrix);


function MAdj=CrearAleatorio(p, MA, sizeM)
%%barremos todas las ramas: MatAdj[i,j]==1
for i=1:sizeM
    for j=1:sizeM
        rn=rand(1);
        if (rn < p) % p es la probabilidad de conectar un nodo i y j.
                MA(i, j) = 1;  
        end
    end
end
MAdj=MA;