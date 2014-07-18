function varargout = Neurosync(varargin)
% Neurosync M-file for Neurosync.fig
%      Neurosync, by itself, creates a new Neurosync or raises the existing
%      singleton*.
%
%      H = Neurosync returns the handle to a new Neurosync or the handle to
%      the existing singleton*.
%
%      Neurosync('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Neurosync.M with the given input arguments.
%
%      Neurosync('Property','Value',...) creates a new Neurosync or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Neurosync_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Neurosync_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Neurosync

% Last Modified by GUIDE v2.5 08-Jan-2013 18:26:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Neurosync_OpeningFcn, ...
                   'gui_OutputFcn',  @Neurosync_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Neurosync is made visible.
function Neurosync_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Neurosync (see VARARGIN)

% Choose default command line output for Neurosync
handles.output = hObject;

% % The following code is useful in case it is needed to obtained the
% % adjacency matrix from external files
% % Load the files that have tha adjacency matrices for different small
% % worlds configurations of probability of reconnection and number of
% % neighbors connected. All the files are loaded in base workspace
% temp_data=load('MatricesSmallW');
% file_variables=fieldnames(temp_data);% get the field names as cell array
% for ii=1:length(file_variables)
%    % file_variables{ii} - string of the field name
%    % temp_data.(file_variables{ii}) - dynamic field reference
%    assignin('base', file_variables{ii}, temp_data.(file_variables{ii}));
% end
% % This code has been obtained from
% http://stackoverflow.com/questions/9416198/load-mat-file-in-workspace
% nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
% set(handles.text34,'String',num2str(nnodes));
% global MExterna; %this code is for the adjacency matrix in files
% list=get(handles.popupmenu1,'String');
% val=get(handles.popupmenu1,'Value');
% str=list{val};
% MExterna = evalin('base',str);

% By default the network used is an small world net
nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
set(handles.text34,'String',num2str(nnodes));
p=str2num(get(handles.edit11,'String'));
k=str2num(get(handles.edit12,'String'));
MatAdj=create_MatAdj_SW(nnodes, p, k);
global MExterna;
MExterna=MatAdj;
global t;
t=0;

%update the network model used in the history listbox
yy=cellstr(get(handles.listbox6,'String'));
yy=[yy ;cellstr(sprintf('T%s %s %s %s',num2str(t),'SW',num2str(p),num2str(k)))];
set(handles.listbox6,'String',yy);

%store a pointer to the main gui
setappdata(0,'hMainGui',gcf);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Neurosync wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Neurosync_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg1.
function tg1_Callback(hObject, eventdata, handles)
% hObject    handle to tg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MExterna;

hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle


Ne=str2num(get(handles.edit9,'String')); 
Ni=str2num(get(handles.edit10,'String'));

T= str2num(get(handles.edit1,'String'));

global thalinput;
maxthalinput= get(handles.slider2,'Max');
minthalinput= get(handles.slider2,'Min');
thalinput=get(handles.slider2,'Value');
thalinput=(thalinput-minthalinput)/(maxthalinput-minthalinput); %general weight for synapsis
set(handles.text6,'String',num2str(thalinput));
thalfactore= str2num(get(handles.edit19,'String'));  %multiplicative factor to adjust the inputs
thalfactori= str2num(get(handles.edit20,'String'));  %multiplicative factor to adjust the inputs

global wsynap;
maxwsynap= get(handles.slider3,'Max');
minwsynap= get(handles.slider3,'Min');
wsynap=get(handles.slider3,'Value');
wsynap=(wsynap-minwsynap)/(maxwsynap-minwsynap); %general weight for synapsis
set(handles.text7,'String',num2str(wsynap));

% Hint: get(hObject,'Value') returns toggle state of tg1
% if (get(handles.tg1,'Value')== 1)
% Todas las neuronas en modo integrador

type=0; %not random. It means that the type of neurons is selected by ti and te and it is not selected randomly
te= get(handles.listbox4,'Value'); %type of excitatory neuron  12 or 21
ti= get(handles.listbox5,'Value'); %type of inhibitory neuron   22
type= get(handles.checkbox2,'Value');
[a,b,c,d,loc_inhib, loc_exc]=setabcd(Ne,Ni,type,te,ti);  %set the parameter for izhikievich model. Returns the parameters 
% for all neurons, plus the location of excitaory and inhibitory neurons

% fill listbox3 with the list of inhibitory neurons
if ~isempty(loc_inhib)
    xxx=sort(loc_inhib);
    for i=1:length(loc_inhib)
    xx{i}=xxx(i) ;
    end
    set(handles.listbox3,'String',xx)
end


excf= 0.5;  % factor for excitatory synapsis
inhf= -1;  % factor for inhibitory synapsis
cfactor=100/(Ne*excf+Ni*inhf); %correction factor to generate an input signal of as much as 100 at any neuron



% v=-65+95*rand(Ne+Ni,1); % Other possible initial values of v
v=-65*ones(Ne+Ni,1); % Initial values of v
VV=zeros(Ne+Ni,T);  %guardamos los valores de V a lo largo de todo el tiempo
u=b.*v; % Initial values of u
firings=[]; % spike timings
meanfire=zeros(T,1);  %mean fire history
meanfield=zeros(T,1);  %mean V history
inthal=zeros(T,1); % thalamus input history
synw=zeros(T,1);  % weigth history

tau=1;  %for slow integration set tau2=1, tau= 0.5 and set the comment on v=v+tau2*tau*(0.04*v.^2+4.1*v+108-u+I);
%for fast integration set tau2=0.5, tau= 1 and set away the comment on v=v+tau2*tau*(0.04*v.^2+4.1*v+108-u+I); 
tspan = 0:tau:T;
tau2=0.5; 

global t;
for t=1:length(tspan) % simulation of T ms
    
    S=cfactor*wsynap*[excf*MExterna(:,(loc_exc)), inhf*MExterna(:,(loc_inhib))];  %set the weigths
%     signal_w=str2num(get(handles.edit19,'String')); %width of input signal
%     signal_l=str2num(get(handles.edit20,'String')); %level of input signal
    modeInput=get(handles.listbox1,'Value'); %type of input
    neuron_ini= str2num(get(handles.edit21,'String'));  % neuron to start the input
    neuron_end= str2num(get(handles.edit22,'String'));  % neuron to end input
    I= setInput2(Ne,Ni,thalinput, thalfactore, thalfactori, loc_exc, loc_inhib, neuron_ini, neuron_end, modeInput ); %set input

    fired=find(v>=30); % indices of spikes
    firings=[firings; t+0*fired,fired];
    v(fired)=c(fired);
%     VV(:,t)=v; %store the v of all neurons
%     meanfield(t)=mean(v);  % mean potential of all neurons
%     meanfire(t)=length(fired)/(Ne+Ni); % mean number of neurons firings
    u(fired)=u(fired)+d(fired);
    f=sum(S(:,fired),2);
    I=I+f;
    v=v+tau2*tau*(0.04*v.^2+4.1*v+108-u+I); 
    v=v+tau2*tau*(0.04*v.^2+4.1*v+108-u+I); %comment away this line for slow integration
    u=u+tau*a.*(b.*v-u); 
    vtemp=v;
    vtemp(vtemp>=30)=30;
    VV(:,t)=vtemp;
    setappdata(hMainGui,'VV',VV);  %store VV as an appdata
    meanfield(t)=mean(vtemp);  % mean potential of all neurons
    meanfire(t)=length(fired)/(Ne+Ni); % mean number of neurons firings
    inthal(t)=thalinput;
    synw(t)=wsynap;

% Plots zone
    val=get(handles.slider1,'Value');
    pause(-0.5*(val-1.00000001));    

%     plot(handles.axes1,tau*firings(:,1),firings(:,2),'.');
    plot(handles.axes1,tau*firings(:,1),firings(:,2).*ismember(firings(:,2),loc_exc),'r.',tau*firings(:,1),firings(:,2).*ismember(firings(:,2),loc_inhib),'g.');
    set(handles.axes1,'XLim',[0 T],'YLim',[0 Ne+Ni]);

    plot(handles.axes2,tau*(1:length(meanfire)),meanfire,'b',t*tau,0,'ro','MarkerFaceColor','r','MarkerSize',10);
    set(handles.axes2,'XLim',[0 T],'YLim',[0 1.1]);
    set(handles.text8,'String',num2str(meanfire(t)));
    set(handles.text31,'String',num2str(max(meanfire(1:t))));  

    plot(handles.axes7,tau*(1:t),meanfield(1:t));
%     plot(handles.axes7,1:length(meanfield),meanfield);
    set(handles.axes7,'XLim',[0 T]);
    set(handles.text21,'String',num2str(meanfield(t)));
    set(handles.text23,'String',num2str(max(meanfield(1:t))));
    set(handles.text25,'String',num2str(min(meanfield(1:t))));

    n_neuron1=str2num(get(handles.edit5,'String'));
    plot(handles.axes3,tau*(1:t),VV(n_neuron1,1:t));
%     plot(handles.axes3,(1:T),VV(n_neuron1,:));
    set(handles.axes3,'XLim',[0 T]);
    set(handles.text14,'String',num2str(VV(n_neuron1,t)));

    n_neuron2=str2num(get(handles.edit6,'String'));
    plot(handles.axes4,tau*(1:t),VV(n_neuron2,1:t));
%     plot(handles.axes4,(1:T),VV(n_neuron2,:));
    set(handles.axes4,'XLim',[0 T]);
    set(handles.text15,'String',num2str(VV(n_neuron2,t)));

%     n_neuron3=str2num(get(handles.edit7,'String'));
    plot(handles.axes5,tau*(1:t),inthal(1:t));
%     plot(handles.axes5,(1:T),VV(n_neuron3,:));
    set(handles.axes5,'XLim',[0 T],'YLim',[-0.1 1.1]);
%     set(handles.text16,'String',num2str(VV(n_neuron3,t)));

    plot(handles.axes9,tau*(1:t),synw(1:t));
    set(handles.axes9,'XLim',[0 T],'YLim',[-0.1 1.1]);
    
    
    vt=zeros(Ne+Ni,1); % create a vector with total number of neurons with ini value 0
%     vt(fired)=-1; % neurons fired are loaded with -1
    ex=ismember(fired,loc_exc);
    in=ismember(fired,loc_inhib);
    vt(fired(ex>0))=2; % neurons fired are loaded with -1
    vt(fired(in>0))=1; % neurons fired are loaded with -1
    ncols=str2num(get(handles.edit8,'String'));
    [mat,padded] = vec2mat(vt,ncols);  %convert vector in matrix with number of columns given in GUI
    mat=[ mat zeros(size(mat,1),1);zeros(1,size(mat,2)+1)]; %add on column and row of ceros
    map=[ 0 0 0 ;
        1 1 1;
        1 0 0;
        0 1 0 ];  %1 0 0 is red, 0 1 0 is green
    pcolor(handles.axes6,mat); axis(handles.axes6,'ij');colormap(handles.axes6,map);
    set(handles.text20,'String',num2str(length(fired)));

end

assignin('base','VV',VV);
Spikes=zeros(size(VV));
Spikes(VV==30)=1;
assignin('base','Spikes',Spikes);
save VV.mat VV;
save Spikes.mat Spikes;
 
 






% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global thalinput;
maxthalinput= get(handles.slider2,'Max');
minthalinput= get(handles.slider2,'Min');
thalinput=get(handles.slider2,'Value');
thalinput=(thalinput-minthalinput)/(maxthalinput-minthalinput); %general weight for synapsis
set(handles.text6,'String',num2str(thalinput));


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global wsynap;
maxwsynap= get(handles.slider3,'Max');
minwsynap= get(handles.slider3,'Min');
wsynap=get(handles.slider3,'Value');
wsynap=(wsynap-minwsynap)/(maxwsynap-minwsynap); %general weight for synapsis
set(handles.text7,'String',num2str(wsynap));


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
set(handles.text34,'String',num2str(nnodes));


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % this code is used only to select the adjacency matrix in case that the
% % matrix is in a file
% % --- Executes on selection change in popupmenu1.
% function popupmenu1_Callback(hObject, eventdata, handles)
% % hObject    handle to popupmenu1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from popupmenu1
% global MExterna;
% list=get(handles.popupmenu1,'String');
% val=get(handles.popupmenu1,'Value');
% str=list{val};
% MExterna = evalin('base',str);


% % --- Executes during object creation, after setting all properties.
% function popupmenu1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to popupmenu1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


                


% --- Executes on button press in tg2.
function tg2_Callback(hObject, eventdata, handles)
% hObject    handle to tg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Used to create the code for the adjacency matrix of the small world
% matrix following strogatz method
global MExterna;
nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
p=str2num(get(handles.edit11,'String'));
k=str2num(get(handles.edit12,'String'));
MExterna=create_MatAdj_SW(nnodes, p, k);
global t;

% write in net history

% initial_name=get(handles.listbox6,'String');
% new_name = sprintf('%s\nT%s %s %s %s',initial_name,num2str(t),'SW',num2str(p),num2str(k)) ;
% set(handles.listbox6,'String',new_name);
yy=cellstr(get(handles.listbox6,'String'));
yy=[yy ;cellstr(sprintf('T%s %s %s %s',num2str(t),'SW',num2str(p),num2str(k)))];
set(handles.listbox6,'String',yy);




function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
set(handles.text34,'String',num2str(nnodes));


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg3.
function tg3_Callback(hObject, eventdata, handles)
% hObject    handle to tg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Used to create the code for the adjacency matrix of the Erdos random
% matrix
global MExterna;
nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
p=str2num(get(handles.edit14,'String'));
MExterna=create_MatAdj_ER(nnodes, p);

global t;
% write in net history
yy=cellstr(get(handles.listbox6,'String'));
yy=[yy ;cellstr(sprintf('T%s %s %s',num2str(t),'ER',num2str(p)))];
set(handles.listbox6,'String',yy);




function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg4.
function tg4_Callback(hObject, eventdata, handles)
% hObject    handle to tg4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Used to create the code for the adjacency matrix of the Barabassi Adler
% Matrix, sclae free
global MExterna;
nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
Nini=str2num(get(handles.edit15,'String'));
mini=str2num(get(handles.edit16,'String'));
mnew=str2num(get(handles.edit17,'String'));
pout=str2num(get(handles.edit18,'String'));
MExterna=create_MatAdj_BA(nnodes, Nini, mini,mnew,pout);

global t;
% write in net history
yy=cellstr(get(handles.listbox6,'String'));
yy=[yy ;cellstr(sprintf('T%s %s %s %s %s %s',num2str(t),'BA',num2str(Nini),num2str(mini),num2str(mnew),num2str(pout)))];
set(handles.listbox6,'String',yy);




function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg5.
function tg5_Callback(hObject, eventdata, handles)
% hObject    handle to tg5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% show adjacency matrix, nodes are represented in x and y, with a dot when
% node x and node y are connected
fh=figure; 
global MExterna;
spy(MExterna);




% --- Executes on button press in tg6.
function tg6_Callback(hObject, eventdata, handles)
% hObject    handle to tg6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Obtained from
% http://stackoverflow.com/questions/3277541/construct-adjacency-matrix-in-matlab
% Used to create the code for the adjacency matrix of the spatial proximity
% (2D lattice)

global MExterna;

tmp=get(handles.listbox2,'Value');
if tmp==1
    connected=4;
elseif tmp==2
    connected=8;
end

nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
ncolum=str2num(get(handles.edit8,'String'));
if rem(nnodes,ncolum)~=0
    msgbox('Number of nodes has to be multiple of nº column', 'Input error','error');
    return;
end
MExterna=create_MatAdj_SP(nnodes, ncolum,connected);

global t;
% write in net history
yy=cellstr(get(handles.listbox6,'String'));
yy=[yy ;cellstr(sprintf('T%s %s %s',num2str(t),'SP',num2str(connected)))];
set(handles.listbox6,'String',yy);






% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1






% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5


% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox6.
function listbox6_Callback(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox6


% --- Executes during object creation, after setting all properties.
function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% show connectivity between nodes
fh=figure;
global MExterna;
nnodes=str2num(get(handles.edit9,'String'))+str2num(get(handles.edit10,'String'));
X=cos((2*pi/nnodes)*(0:nnodes-1)');
Y=sin((2*pi/nnodes)*(0:nnodes-1)');
XY=[X Y];
gplot(MExterna,XY,'-b.');




% --------------------------------------------------------------------
function c_distance_Callback(hObject, eventdata, handles)
% hObject    handle to c_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function g_distance_Callback(hObject, eventdata, handles)
% hObject    handle to g_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function v_distance_Callback(hObject, eventdata, handles)
% hObject    handle to v_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 
% % --------------------------------------------------------------------
% function sqrImg_Callback(hObject, eventdata, handles)
% % hObject    handle to sqrImg (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% MSimSpikes=evalin('base','MSimSpikes_b1');
% MSimSpikesT=evalin('base','MSimSpikesT_b1');
% 
% figure('Name',sprintf('MSimSpikes_b1   %d x %d',size(MSimSpikes,1),size(MSimSpikes,2)),'NumberTitle','off');
% imshow(MSimSpikes,[min(min(MSimSpikes)) max(max(MSimSpikes))]);
% figure('Name',sprintf('MSimSpikesT_b1   %d x %d',size(MSimSpikesT,1),size(MSimSpikesT,1)),'NumberTitle','off');
% imshow(MSimSpikesT,[min(min(MSimSpikesT)) max(max(MSimSpikesT))]);
% 
% % --------------------------------------------------------------------
% function gdJaccard_Callback(hObject, eventdata, handles)
% % hObject    handle to gdJaccard (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata
% Spikes=zeros(size(VV));
% Spikes(VV==30)=1;
% cal_distance(Spikes,'jaccard',1);
% 
% 
% 
% % --------------------------------------------------------------------
% function gdCorrelation_Callback(hObject, eventdata, handles)
% % hObject    handle to gdCorrelation (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata
% cal_distance(VV,'correlation',1);
% 
% 
% 
% % --------------------------------------------------------------------
% function gd_cosine_Callback(hObject, eventdata, handles)
% % hObject    handle to gd_cosine (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata
% cal_distance(VV,'cosine',1);
% 
% 
% % --------------------------------------------------------------------
% function gd_seuclidean_Callback(hObject, eventdata, handles)
% % hObject    handle to gd_seuclidean (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata
% cal_distance(VV,'seuclidean',1);
% 
% 
% % --------------------------------------------------------------------
% function gd_mahalanobis_Callback(hObject, eventdata, handles)
% % hObject    handle to gd_mahalanobis (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata
% cal_distance(VV,'mahalanobis',1);
% 
% 
% % --------------------------------------------------------------------
% function gd_euclidean_Callback(hObject, eventdata, handles)
% % hObject    handle to gd_euclidean (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata
% cal_distance(VV,'euclidean',1);
% 
% % --------------------------------------------------------------------
% function gd_spearman_Callback(hObject, eventdata, handles)
% % hObject    handle to gd_spearman (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata
% cal_distance(VV,'spearman',1);


% --------------------------------------------------------------------
function d_app_Callback(hObject, eventdata, handles)
% hObject    handle to d_app (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Distanceapp; %call function to generate data


% --------------------------------------------------------------------
function stat_app_Callback(hObject, eventdata, handles)
% hObject    handle to stat_app (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


