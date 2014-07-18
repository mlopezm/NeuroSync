function varargout = Eigenapp(varargin)
% EIGENAPP M-file for Eigenapp.fig
%      EIGENAPP, by itself, creates a new EIGENAPP or raises the existing
%      singleton*.
%
%      H = EIGENAPP returns the handle to a new EIGENAPP or the handle to
%      the existing singleton*.
%
%      EIGENAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EIGENAPP.M with the given input arguments.
%
%      EIGENAPP('Property','Value',...) creates a new EIGENAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Eigenapp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Eigenapp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Eigenapp

% Last Modified by GUIDE v2.5 10-Jan-2013 17:25:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Eigenapp_OpeningFcn, ...
                   'gui_OutputFcn',  @Eigenapp_OutputFcn, ...
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


% --- Executes just before Eigenapp is made visible.
function Eigenapp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Eigenapp (see VARARGIN)

% Choose default command line output for Eigenapp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Eigenapp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Eigenapp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Eigen_net();

global MExterna; %input values
global S; %input values
global eigenA; 
global eigenL;  
global eigenAw;  
global eigenLw; 

%calculate synchronization index
% low_val=1e-10;
low_val=0;

if eigenA(end)>low_val 
    ind_A=eigenA(2)/eigenA(end);
else
    ind_A='L2 is zero';
end;
if  eigenAw(end)>low_val  
    ind_Aw=eigenAw(2)/eigenAw(end);
else
    ind_Aw='L2 is zero';
end; 
if  eigenL(end)>low_val  
    ind_L=eigenL(2)/eigenL(end);
else
    ind_L='L2 is zero';
end;
if  eigenLw(end)>low_val  
    ind_Lw=eigenLw(2)/eigenLw(end);
else
    ind_Lw='L2 is zero';
end;

if isnumeric(ind_A) 
    set(handles.edit1,'String',num2str(ind_A));
else
    set(handles.edit1,'String',ind_A);
end;
if isnumeric(ind_Aw) 
    set(handles.edit2,'String',num2str(ind_Aw));
else
    set(handles.edit2,'String',ind_Aw);
end;
if isnumeric(ind_L) 
    set(handles.edit3,'String',num2str(ind_L));
else
    set(handles.edit3,'String',ind_L);
end;
if isnumeric(ind_Lw) 
    set(handles.edit4,'String',num2str(ind_Lw));
else
    set(handles.edit4,'String',ind_Lw);
end;

%calculate normalized spread of eigenvalues
t0=sum(sum(MExterna))-sum(diag(MExterna));
ssA=t0/size(MExterna,1);
t1=sum(eigenA(1:end-1));
avgEigA=t1/(size(MExterna,1)-1);
if ssA>low_val 
    t0=abs(eigenA-avgEigA*ones(length(eigenA),1));
    t1=t0.^2;
    t2=sum(t1(1:end-1));
    sigma_A=t2/((size(MExterna,1)-1)*ssA^2);
else
    sigma_A='Sum matrix is zero';
end;

t0=sum(sum(S))-sum(diag(S));
ssAw=t0/size(S,1);
t1=sum(eigenAw(1:end-1));
avgEigAw=t1/(size(S,1)-1);
if  ssAw>low_val  
    t0=abs(eigenAw-avgEigAw*ones(length(eigenAw),1));
    t1=t0.^2;
    t2=sum(t1(1:end-1));
    sigma_Aw=t2/((size(S,1)-1)*ssAw^2);
else
    sigma_Aw='Sum matrix is zero';
end; 

L=diag(sum(MExterna,2))-MExterna;
t0=sum(sum(L))-sum(diag(L));
ssL=t0/size(L,1);
t1=sum(eigenL(1:end-1));
avgEigL=t1/(size(L,1)-1);
if ssL>low_val 
    t0=abs(eigenL-avgEigL*ones(length(eigenL),1));
    t1=t0.^2;
    t2=sum(t1(1:end-1));
    sigma_L=t2/((size(L,1)-1)*ssL^2);
else
    sigma_L='Sum matrix is zero';
end;

Lw=diag(sum(S,2))-S;
t0=sum(sum(Lw))-sum(diag(Lw));
ssLw=t0/size(Lw,1);
t1=sum(eigenLw(1:end-1));
avgEigLw=t1/(size(Lw,1)-1);
if ssLw>low_val 
    t0=abs(eigenLw-avgEigLw*ones(length(eigenLw),1));
    t1=t0.^2;
    t2=sum(t1(1:end-1));
    sigma_Lw=t2/((size(Lw,1)-1)*ssLw^2);
else
    sigma_Lw='Sum matrix is zero';
end;

if isnumeric(sigma_A) 
    set(handles.edit5,'String',num2str(sigma_A));
else
    set(handles.edit5,'String',sigma_A);
end;
if isnumeric(sigma_Aw) 
    set(handles.edit6,'String',num2str(sigma_Aw));
else
    set(handles.edit6,'String',sigma_Aw);
end;
if isnumeric(sigma_L) 
    set(handles.edit7,'String',num2str(sigma_L));
else
    set(handles.edit7,'String',sigma_L);
end;
if isnumeric(sigma_Lw) 
    set(handles.edit8,'String',num2str(sigma_Lw));
else
    set(handles.edit8,'String',sigma_Lw);
end;

    

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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global eigenA; 
global eigenL;  
global eigenAw;  
global eigenLw; 

figure_print(eigenA, 'Eigenvalues Adjacency of connectivity');
figure_print(eigenL, 'Eigenvalues Laplacian of connectivity');
figure_print(eigenAw, 'Eigenvalues Adjacency of weighted connectivity');
figure_print(eigenLw, 'Eigenvalues Laplacian of weighted connectivity');

