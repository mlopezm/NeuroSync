function varargout = Hilbertapp(varargin)
% HILBERTAPP M-file for Hilbertapp.fig
%      HILBERTAPP, by itself, creates a new HILBERTAPP or raises the existing
%      singleton*.
%
%      H = HILBERTAPP returns the handle to a new HILBERTAPP or the handle to
%      the existing singleton*.
%
%      HILBERTAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HILBERTAPP.M with the given input arguments.
%
%      HILBERTAPP('Property','Value',...) creates a new HILBERTAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hilbertapp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hilbertapp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hilbertapp

% Last Modified by GUIDE v2.5 30-Jan-2013 16:31:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hilbertapp_OpeningFcn, ...
                   'gui_OutputFcn',  @Hilbertapp_OutputFcn, ...
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


% --- Executes just before Hilbertapp is made visible.
function Hilbertapp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hilbertapp (see VARARGIN)

% Choose default command line output for Hilbertapp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hilbertapp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hilbertapp_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 VV=evalin('base','VV');
 n1= str2num(get(handles.edit1,'String'));
 n2= str2num(get(handles.edit2,'String'));
 len=size(VV,1);
 if n1>len || n2> len
     msgbox('value greater than signal length');
     return;
 end;
 s1=VV(n1,:);
 s2=VV(n2,:);
 x1=hilbert(s1);
 x2=hilbert(s2);
 x1i=imag(x1);
 x2i=imag(x2);

 d=atan2((x1i.*s2-s1.*x2i),((s1.*s2+x1i.*x2i)+eps));
 duw=unwrap(d); 
 mduw=mean(abs(d)); %Phase index-mean absolute value
 plot(handles.axes1,duw);
 set(handles.edit4,'String',num2str(mduw));
    
  %calculate phase index based in entropy
nBins=100;
N = length(d); % sample size
if (N<nBins) 
    nBins=N;
end
sp=linspace(-pi,pi,nBins);
h=histc(d,sp); %histogram 
pdf=h/N; % scaled histogram as a pdf
entropy=-sum(pdf(pdf>0).*log2(pdf(pdf>0)));
emax=log2(nBins);
index_e=(emax-entropy)/emax;
set(handles.edit3,'String',num2str(index_e));
  
  



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


% USE THIS CALLBACK WHEN WE WANT TO CALCULATE THE PDFS WITH THE REAL VALUES
% OF SIGNAL INSTEAD OF THE ANGLES COMING FROM THE HILBERT TRANSFORM
% --- Executes on button press in pushbutton2.
function pushbutton2_calculatewithrealval_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global PDF;
 global sp;
 global T;
 
 VV=evalin('base','VV');
 nneuron=size(VV,1);
 T=size(VV,2);
%  
% %  XX=hilbert(VV);
%  XX=hilbert(VV')';
%  Xang=angle(XX); %matrix with angles of all the signals

%  plot(handles.axes1,duw);
% %  title('Phase difference');
% %  subplot(5,1,4);plot(dd);title('Difference of Phase difference ~ velocity');subplot(5,1,5);plot(ddd);title('Difference of Difference of Phase difference~acceleration');
%   set(handles.edit4,'String',num2str(mduw));
    
  %calculate phase index based in entropy
nBins=100;
N = nneuron; % sample size
if (N<nBins) 
    nBins=N;
end


sp=linspace(min(min(VV)),max(max(VV)),nBins);
PDF=zeros(T,nBins);  %each row contains the pdf for time i
for i=1:T
    PDF(i,:)=histc(VV(:,i),sp)/N; %scaled histogram as a pdf
    % row i contains the pdf of phase distribution for all neuron at time i
end
emax=log2(nBins);
INDEX=zeros(1,T);
if get(handles.radiobutton3,'Value')==1
    for i=1:T
        pdf=PDF(i,:);
        entropy=-sum(pdf(pdf>0).*log2(pdf(pdf>0)));
        INDEX(i)=(emax-entropy)/emax;
    end
else
    pVect2=ones(1,nBins)/nBins; %uniform distribution
    for i=1:T
        pdf=PDF(i,:);
        pVect1=pdf+eps.*ones(size(pdf));
        INDEX(i) = sum(pVect1 .* (log2(pVect1)-log2(pVect2)));
    end
end
plot(handles.axes2,INDEX);
set(handles.edit7,'String',num2str(mean(abs(INDEX))));



% USE THIS CALLBACK WHEN WE WANT TO CALCULATE THE PDFS WITH THE IMAGINARY VALUES
% OF SIGNAL INSTEAD OF THE ANGLES COMING FROM THE HILBERT TRANSFORM
% --- Executes on button press in pushbutton2.
function pushbutton2_calculatewithimaval_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global PDF;
 global sp;
 global T;
 
 VV=evalin('base','VV');
 nneuron=size(VV,1);
 T=size(VV,2);
  
  XX=hilbert(VV')';
  Xima=imag(XX); %matrix with imaginary part of all the signals from the analytic signal

%  plot(handles.axes1,duw);
% %  title('Phase difference');
% %  subplot(5,1,4);plot(dd);title('Difference of Phase difference ~ velocity');subplot(5,1,5);plot(ddd);title('Difference of Difference of Phase difference~acceleration');
%   set(handles.edit4,'String',num2str(mduw));
    
  %calculate phase index based in entropy
nBins=100;
N = nneuron; % sample size
if (N<nBins) 
    nBins=N;
end


sp=linspace(min(min(Xima)),max(max(Xima)),nBins);
PDF=zeros(T,nBins);  %each row contains the pdf for time i
for i=1:T
    PDF(i,:)=histc(Xima(:,i),sp)/N; %scaled histogram as a pdf
    % row i contains the pdf of phase distribution for all neuron at time i
end
emax=log2(nBins);
INDEX=zeros(1,T);
if get(handles.radiobutton3,'Value')==1
    for i=1:T
        pdf=PDF(i,:);
        entropy=-sum(pdf(pdf>0).*log2(pdf(pdf>0)));
        INDEX(i)=(emax-entropy)/emax;
    end
else
    pVect2=ones(1,nBins)/nBins; %uniform distribution
    for i=1:T
        pdf=PDF(i,:);
        pVect1=pdf+eps.*ones(size(pdf));
        INDEX(i) = sum(pVect1 .* (log2(pVect1)-log2(pVect2)));
    end
end
plot(handles.axes2,INDEX);
set(handles.edit7,'String',num2str(mean(abs(INDEX))));


% USE THIS CALLBACK WHEN WE WANT TO CALCULATE THE PDFS WITH THE MODULE VALUES
% OF SIGNAL INSTEAD OF THE ANGLES COMING FROM THE HILBERT TRANSFORM
% --- Executes on button press in pushbutton2.
function pushbutton2_calculatewithmodulval_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global PDF;
 global sp;
 global T;
 
 VV=evalin('base','VV');
 nneuron=size(VV,1);
 T=size(VV,2); 

  XX=hilbert(VV')';
  Xmod=abs(XX); %matrix with module of all the signals from the analytic signal

%  plot(handles.axes1,duw);
% %  title('Phase difference');
% %  subplot(5,1,4);plot(dd);title('Difference of Phase difference ~ velocity');subplot(5,1,5);plot(ddd);title('Difference of Difference of Phase difference~acceleration');
%   set(handles.edit4,'String',num2str(mduw));
    
  %calculate phase index based in entropy
nBins=100;
N = nneuron; % sample size
if (N<nBins) 
    nBins=N;
end


sp=linspace(min(min(Xmod)),max(max(Xmod)),nBins);
PDF=zeros(T,nBins);  %each row contains the pdf for time i
for i=1:T
    PDF(i,:)=histc(Xmod(:,i),sp)/N; %scaled histogram as a pdf
    % row i contains the pdf of phase distribution for all neuron at time i
end
emax=log2(nBins);
INDEX=zeros(1,T);
if get(handles.radiobutton3,'Value')==1
    for i=1:T
        pdf=PDF(i,:);
        entropy=-sum(pdf(pdf>0).*log2(pdf(pdf>0)));
        INDEX(i)=(emax-entropy)/emax;
    end
else
    pVect2=ones(1,nBins)/nBins; %uniform distribution
    for i=1:T
        pdf=PDF(i,:);
        pVect1=pdf+eps.*ones(size(pdf));
        INDEX(i) = sum(pVect1 .* (log2(pVect1)-log2(pVect2)));
    end
end
plot(handles.axes2,INDEX);
set(handles.edit7,'String',num2str(mean(abs(INDEX))));




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.radiobutton10,'Value')==1
 pushbutton2_calculatewithrealval_Callback(hObject, eventdata, handles);
 return;
elseif get(handles.radiobutton11,'Value')==1
 pushbutton2_calculatewithimaval_Callback(hObject, eventdata, handles);
 return;
elseif get(handles.radiobutton13,'Value')==1
 pushbutton2_calculatewithmodulval_Callback(hObject, eventdata, handles);
 return;
end;

 global PDF;
 global sp;
 global T;
 
 VV=evalin('base','VV');
 nneuron=size(VV,1);
 T=size(VV,2);
 
%  XX=hilbert(VV);
 XX=hilbert(VV')';
 Xang=angle(XX); %matrix with angles of all the signals

%  plot(handles.axes1,duw);
% %  title('Phase difference');
% %  subplot(5,1,4);plot(dd);title('Difference of Phase difference ~ velocity');subplot(5,1,5);plot(ddd);title('Difference of Difference of Phase difference~acceleration');
%   set(handles.edit4,'String',num2str(mduw));
    
  %calculate phase index based in entropy
nBins=100;
N = nneuron; % sample size
if (N<nBins) 
    nBins=N;
end


sp=linspace(-pi,pi,nBins);
PDF=zeros(T,nBins);  %each row contains the pdf for time i
for i=1:T
    PDF(i,:)=histc(Xang(:,i),sp)/N; %scaled histogram as a pdf
    % row i contains the pdf of phase distribution for all neuron at time i
end
emax=log2(nBins);
INDEX=zeros(1,T);  %index values for each t
if get(handles.radiobutton3,'Value')==1
    for i=1:T
        pdf=PDF(i,:);
        entropy=-sum(pdf(pdf>0).*log2(pdf(pdf>0)));
        INDEX(i)=(emax-entropy)/emax;
    end
else
    pVect2=ones(1,nBins)/nBins; %uniform distribution
    for i=1:T
        pdf=PDF(i,:);
        pVect1=pdf+eps.*ones(size(pdf));
        INDEX(i) = sum(pVect1 .* (log2(pVect1)-log2(pVect2)));
    end
end
plot(handles.axes2,INDEX);
set(handles.edit7,'String',num2str(mean(abs(INDEX))));

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PDF;
global sp;
n1= str2num(get(handles.edit5,'String'));
plot(handles.axes3,sp,PDF(n1,:));



% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global PDF;
global sp;
global T;
n1=get(handles.slider2,'Value');
n1=floor(n1*T);
st=sprintf('Time: %s ',num2str(n1));
set(handles.text6,'String',st);
plot(handles.axes3,sp,PDF(n1,:));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


