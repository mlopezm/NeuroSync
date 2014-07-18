function [a,b,c,d]=setabcd_adapt(Ne,Ni,type,te,ti,loc_inhib,loc_exc)

pars=[0.02      0.2     -65      6        ;...    % tonic spiking 1
      0.02      0.25    -65      6       ;...   % phasic spiking 2
      0.02      0.2     -50      2        ;...    % tonic bursting 3
      0.02      0.25    -55     0.05      ;...   % phasic bursting 4
      0.02      0.2     -55     4         ;...    % mixed mode 5
      0.01      0.2     -65     8         ;...    % spike frequency adaptation 6
      0.02      -0.1    -55     6          ;...    % Class 1 7
      0.2       0.26    -65     0          ;...    % Class 2 8
      0.02      0.2     -65     6          ;...    % spike latency 9
      0.05      0.26    -60     0          ;...    % subthreshold oscillations 10
      0.1       0.26    -60     -1         ;...    % resonator 11
      0.02      -0.1    -55     6          ;...    % integrator 12
      0.03      0.25    -60     4        ;...      % rebound spike 13
      0.03      0.25    -52     0        ;...      % rebound burst 14
      0.03      0.25    -60     4          ;...    % threshold variability 15
      1         1.5     -60     0        ;...    % bistability 16
        1       0.2     -60     -21        ;...    % DAP 17
      0.02      1       -55     4          ;...    % accomodation 18
     -0.02      -1      -60     8         ;...    % inhibition-induced spiking 19
     -0.026     -1      -45     0        ;       % inhibition-induced bursting 20
        0.1     0.2      -65     2        ;       % fast spiking FS 21
       0.02     0.2      -65     8       ] ;       % regular spiking RS 22

%   This MATLAB code is based in code by Izhikevich E.M. (2004) 
%   Which Model to Use For Cortical Spiking Neurons? 

 tl={'tonic spiking';
 'phasic spiking';
 'tonic bursting';
 'phasic bursting';
  'mixed mode';
'spike frequency adaptation';
 'Class 1';
 'Class 2';
'spike latency';
'subthreshold oscillations';
 'resonator';
 'integrator';
 'rebound spike';
 'rebound burst';
'threshold variability';
'bistability';
 'DAP';
 'accomodation';
'inhibition-induced spiking';
'inhibition-induced bursting';
'fast spiking FS';
'regular spiking RS'
 };

if type==0  %the type of neurons is selected depending of ti and te
    a=zeros(Ne+Ni,1);a([loc_exc],1)=ones(Ne,1)*pars(te,1);a([loc_inhib],1)=ones(Ni,1)*pars(ti,1);
    b=zeros(Ne+Ni,1);b([loc_exc],1)=ones(Ne,1)*pars(te,2);b([loc_inhib],1)=ones(Ni,1)*pars(ti,2);
    c=zeros(Ne+Ni,1);c([loc_exc],1)=ones(Ne,1)*pars(te,3);c([loc_inhib],1)=ones(Ni,1)*pars(ti,3);
    d=zeros(Ne+Ni,1);d([loc_exc],1)=ones(Ne,1)*pars(te,4);d([loc_inhib],1)=ones(Ni,1)*pars(ti,4);
elseif type==1  %the type of neurons is random , follows Izhikevich article
    rand('state',1);  %control de random number generator to produce always the same results
    re=rand(Ne,1); ri=rand(Ni,1);
    a=zeros(Ne+Ni,1); a(loc_exc,1)=0.02*ones(Ne,1); a(loc_inhib,1)=0.02+0.08*ri;
%     a=[0.02*ones(Ne,1); 0.02+0.08*ri];
    b=zeros(Ne+Ni,1); b(loc_exc,1)=0.2*ones(Ne,1); b(loc_inhib,1)=0.25-0.05*ri;
%    b=[0.2*ones(Ne,1); 0.25-0.05*ri];
    c=zeros(Ne+Ni,1); c(loc_exc,1)=-65+15*re.^2; c(loc_inhib,1)= -65*ones(Ni,1);
%    c=[-65+15*re.^2; -65*ones(Ni,1)];
    d=zeros(Ne+Ni,1); d(loc_exc,1)=8-6*re.^2; d(loc_inhib,1)= 2*ones(Ni,1);
%    d=[8-6*re.^2; 2*ones(Ni,1)];
end

end






