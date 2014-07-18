
function MatAdj=create_MatAdj_SW(nnodes, p, k)          
SizeMatrix = nnodes;
MatAdj= zeros(SizeMatrix, SizeMatrix);
MatAdj=CrearRingDirigido(k, MatAdj,SizeMatrix);
MatAdj=CrearSmallWDirigido(p, MatAdj,SizeMatrix);


function MAdj=CrearRingDirigido(k, MA, sizeM)

for i=1:sizeM
    for j=1:k
        %conectamos k hacia adelante
        tmpf = rem((i + j),sizeM)+floor((i + j)/sizeM);
        MA(i, tmpf) = 1;
    end
end
MAdj=MA;

                
function MAdj=CrearSmallWDirigido(p, MA, sizeM)
%%barremos todas las ramas: MatAdj[i,j]==1
for i=1:sizeM
    for j=1:sizeM
        rn=rand(1);
        if (MA(i, j) == 1)&&(rn < p) % p es la probabilidad de romper la rama.
                %%elegimos un nuevo nodo de conexión
                tmp = round(rand(1)*(sizeM-1))+1;
                while ((tmp == i) || (tmp == j) || (MA(i,tmp)==1)) 
                    tmp = round(rand(1)*(sizeM-1))+1;
                end
                MA(i, j) = 0;  %desconectamos del nodo j
                MA(i, tmp) = 1;  %conectamos al nuevo nodo
        end
    end
end
MAdj=MA;
