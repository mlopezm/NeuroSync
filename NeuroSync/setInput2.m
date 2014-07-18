function [I]=setInput2(Ne,Ni,thalinput, thalfactore, thalfactori, loc_exc, loc_inhib, neuron_ini, neuron_end, modeInput )

% if ~isempty(loc_exc)
%     loc_exc=sort(loc_exc);  %comment this line in case we don't want to apply the signal to the sorted excitatory neurons
% else
%      msgbox('Number of excitatory neurons =0', 'Model error','error');
%     return;
% end
% 
% %select 3 ensembles of equal width to apply the input
% loc_exc_1=loc_exc(1:signal_w);
% loc_exc_2=loc_exc(signal_w+1:2*signal_w);
% loc_exc_3=loc_exc(2*signal_w+1:3*signal_w);



if modeInput==1  %random
    %   I=thalinput*[thalfactore*randn(Ne,1); thalfactori*randn(Ni,1)]; % thalamic input, when ecitatory neurons are located in fixed position
    I=thalinput*randn(Ne+Ni,1); 
    I([loc_exc],1)=I([loc_exc],1)*thalfactore; 
    I([loc_inhib],1)=I([loc_inhib],1)*thalfactori; % thalamic input, random disposition of neurons inhibitory and excitatory
elseif modeInput==2   %select neurons
    I=zeros(Ne+Ni,1);
    I(neuron_ini:neuron_end,1)=1;  %set 1 only to neurons between neuron_ini and end
    I([loc_exc],1)=I([loc_exc],1)*thalfactore; 
    I([loc_inhib],1)=I([loc_inhib],1)*thalfactori;
elseif modeInput==3   % all zeros
    I=zeros(Ne+Ni,1);

% elseif modeInput==3  %signal 001
%     %signal applied only to excitatory neurons
%     I([loc_exc_3],1)=signal_l;
% elseif modeInput==4  %signal 010
%     %signal applied only to excitatory neurons
%     I([loc_exc_2],1)=signal_l;
% elseif modeInput==5  %signal 011
%     %signal applied only to excitatory neurons
%     I([loc_exc_3],1)=signal_l;
%     I([loc_exc_2],1)=signal_l;
% elseif modeInput==6  %signal 100
%     %signal applied only to excitatory neurons
%     I([loc_exc_1],1)=signal_l;
% elseif modeInput==7  %signal 101
%     %signal applied only to excitatory neurons
%     I([loc_exc_1],1)=signal_l;
%     I([loc_exc_3],1)=signal_l;
% elseif modeInput==8  %signal 110
%     %signal applied only to excitatory neurons
%     I([loc_exc_1],1)=signal_l;
%     I([loc_exc_2],1)=signal_l;
% elseif modeInput==9  %signal 111
%     %signal applied only to excitatory neurons
%     I([loc_exc_1],1)=signal_l;
%     I([loc_exc_2],1)=signal_l;
%     I([loc_exc_3],1)=signal_l;

end

end






