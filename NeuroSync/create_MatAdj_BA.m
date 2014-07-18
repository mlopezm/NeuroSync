
function MatAdj=create_MatAdj_BA(nnodes, Nini, mini,mnew, pout) %Nini is the initial number of nodes and mini is the initial number of edges, mnew is the number of edges addes per new node         
SizeMatrix = nnodes;
MatAdj= zeros(SizeMatrix, SizeMatrix);
MatAdj=CrearRndIni(Nini, mini, MatAdj,SizeMatrix); 
MatAdj=CrearLibreEscalaBara(mnew, Nini, pout , MatAdj,SizeMatrix);



function MAdj=CrearRndIni(Nini, mini, MA, sizeM)
    count = 0;
    while (count < mini)
        j = round(rand(1)*(Nini-1))+1;
        k = round(rand(1)*(Nini-1))+1;
        if (rand(1) > 0.5)
            MA(j, k) = 1;
    %       MA(k, j) = 1;
            count=count+1;
        end
    end
    MAdj=MA;

    

function MAdj=CrearLibreEscalaBara(mnew, Nini,pout,MA, sizeM)
    Nactual=Nini;
    
    while (Nactual <= sizeM)

    %Va completando el array pagn en donde cada nodo incrementa la probabilidad acumulada en función de su grado
     sumt=sum(sum(MA));
     pgpernode_in=sum(MA,1)./sumt; %probability associated with the in-degree
     pgpernode_out=sum(MA,2)./sumt; %probability associated with the out-degree    

        % crea un nuevo nodo de mnew ramas
        % Directed Scale-Free Graphs, Bella Bollobas Christian Borgsy Jennifer Chayesz Oliver Riordanx
        for i = 1:mnew
            if (rand(1)<pout) 
                nodoSel = SelNodoModBaraLibEscala(pgpernode_out); %var temporal para el numero de nodo seleccionado
                MA(Nactual, nodoSel) = 1;
            else
                nodoSel = SelNodoModBaraLibEscala(pgpernode_in); %var temporal para el numero de nodo seleccionado
                MA(nodoSel, Nactual) = 1;
            end
        end
        Nactual=Nactual+1;
    end
    MAdj=MA;
    

%Selecciona un nodo segun el modelo Barabassi para crear una red libre de escala. Elige el nodo de forma aleatoria
% pero con probabilidad proporcional al grado de cada nodo. Devuelve el indice del nodo seleccionado.
function index=SelNodoModBaraLibEscala(pg)
    rnd = rand(1);
    index = 1;
    pagpn= cumsum(pg);
    % Va incrementando el indice hasta dar con un indice de nodo cuya pagn iguale al numero aleatorio.
    % Los nodos con mas grados tendrán un pagn mayor y aumentará la probabilidad de que un numero aleatorio caiga en ellos.
    % es la forma de asegurar que la distribucion de probabilidad de eleccion del nodo coincide con su distribucion de grados
    while (rnd >= pagpn(index))
        index= index+1;
    end

