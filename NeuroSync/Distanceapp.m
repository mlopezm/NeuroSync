function varargout = Distanceapp(varargin)
% DISTANCEAPP M-file for Distanceapp.fig
%      DISTANCEAPP, by itself, creates a new DISTANCEAPP or raises the existing
%      singleton*.
%
%      H = DISTANCEAPP returns the handle to a new DISTANCEAPP or the handle to
%      the existing singleton*.
%
%      DISTANCEAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISTANCEAPP.M with the given input arguments.
%
%      DISTANCEAPP('Property','Value',...) creates a new DISTANCEAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Distanceapp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Distanceapp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Distanceapp

% Last Modified by GUIDE v2.5 17-Jan-2013 13:49:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Distanceapp_OpeningFcn, ...
                   'gui_OutputFcn',  @Distanceapp_OutputFcn, ...
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


% --- Executes just before Distanceapp is made visible.
function Distanceapp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Distanceapp (see VARARGIN)

% Choose default command line output for Distanceapp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Distanceapp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Distanceapp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

v=get(handles.listbox1,'Value');
s=get(handles.listbox1,'String');
mode=s{v};
bsize=str2num(get(handles.edit1,'String')); %take block size value

hMainGui= getappdata(0,'hMainGui'); %recover the reference to the GUI handle
% VV=getappdata(hMainGui,'VV'); %recover VV store in appdata

 VV=evalin('base','VV');
 
if (strcmp('jaccard',mode))
    Spikes=zeros(size(VV));
    Spikes(VV==30)=1;
    cal_distance(Spikes,'jaccard',bsize);
else
    cal_distance(VV,mode,bsize);
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v=get(handles.listbox2,'Value');
s=get(handles.listbox2,'String');
nmatrix=s{v};
% s=get(handles.edit2,'String');
% % sT=strrep(s,'Spikes','SpikesT');
MSimSpikes=evalin('base',nmatrix);
% MSimSpikesT=evalin('base',sT);

figure('Name',sprintf('%s   %d x %d',nmatrix,size(MSimSpikes,1),size(MSimSpikes,2)),'NumberTitle','off');
imshow(MSimSpikes,[min(min(MSimSpikes)) max(max(MSimSpikes))]);
% figure('Name',sprintf('%s   %d x %d',sT,size(MSimSpikesT,1),size(MSimSpikesT,1)),'NumberTitle','off');
% imshow(MSimSpikesT,[min(min(MSimSpikesT)) max(max(MSimSpikesT))]);


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set listbox2 with the list of matrices that can be visualized
vars = evalin('base','who');
index = strmatch('MSim', strvcat(vars));
set(handles.listbox2,'String',vars(index));



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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thres=str2double(get(handles.edit2,'String'));
nbins=str2double(get(handles.edit7,'String'));
v=get(handles.listbox3,'Value');
s=get(handles.listbox3,'String');
nmatrix=s{v};
MSimSpikes=evalin('base',nmatrix);  %matrix of similariry between rows or columns
if (get(handles.checkbox1,'Value'))  %we consider the values on the diagonal
    ss='.\files\dist_pdfs\';
    nname=sprintf('Pdf_%s_th_%0.4g',nmatrix,thres);
    nname=strrep(nname,'.',''); %take away the dot
    nfile=sprintf('%s%s.mat',ss,nname); % add the .mat ending
    [height,pdf,xMin,xMax]=histog(MSimSpikes,nbins,thres,nfile,nname);
    pdf=pdf./sum(pdf);  %makes sure the sum is one
    pdf2=pdf(pdf>0);
    entropy=-sum(pdf2.*log2(pdf2));
    emax=log2(length(pdf)); %maximum entropy, it is the log of number of bins
    index=(emax-entropy)/emax;
    set(handles.edit11,'String',num2str(index));
else %we do not consider the values on the diagonal
    ss='.\files\dist_pdfs\';
    nname=sprintf('Pdf_%s_ndi_th_%0.4g',nmatrix,thres);
    nname=strrep(nname,'.',''); %take away the dot
    nfile=sprintf('%s%s.mat',ss,nname); % add the .mat ending
    [height,pdf,xMin,xMax]=histog_nodiag(MSimSpikes,nbins,thres,nfile,nname);
    pdf=pdf./sum(pdf);  %makes sure the sum is one
    pdf2=pdf(pdf>0);
    entropy=-sum(pdf2.*log2(pdf2));
    emax=log2(length(pdf)); %maximum entropy, it is the log of number of bins
    index=(emax-entropy)/emax;
    set(handles.edit11,'String',num2str(index));
end



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thres=str2double(get(handles.edit2,'String'));
v=get(handles.listbox3,'Value');
s=get(handles.listbox3,'String');
nmatrix=s{v};
MSimSpikes=evalin('base',nmatrix);  %matrix of similariry between rows or columns
if (get(handles.checkbox1,'Value'))
     ss='.\files\dist_pdfs\';
    nname=sprintf('Pdf_%s_shift_th_%0.4g',nmatrix,thres);
    nname=strrep(nname,'.',''); %take away the dot
    nfile=sprintf('%s%s.mat',ss,nname); % add the .mat ending
     [height,pdf,xMin,xMax]=histoshift2(MSimSpikes,thres,nfile,nname);
     pdf=pdf./sum(pdf);  %makes sure the sum is one
    pdf2=pdf(pdf>0);    
    entropy=-sum(pdf2.*log2(pdf2));
    emax=log2(length(pdf)); %maximum entropy, it is the log of number of bins
    index=(emax-entropy)/emax;
    set(handles.edit9,'String',num2str(index));
else
     ss='.\files\dist_pdfs\';
    nname=sprintf('Pdf_%s_shift_ndi_th_%0.4g',nmatrix,thres);
    nname=strrep(nname,'.',''); %take away the dot
    nfile=sprintf('%s%s.mat',ss,nname); % add the .mat ending
    [height,pdf,xMin,xMax]=histoshift_nodiag2(MSimSpikes,thres,nfile,nname);
    pdf=pdf./sum(pdf);  %makes sure the sum is one
    pdf2=pdf(pdf>0);
    entropy=-sum(pdf2.*log2(pdf2));
    emax=log2(length(pdf)); %maximum entropy, it is the log of number of bins
    index=(emax-entropy)/emax;
    set(handles.edit9,'String',num2str(index));
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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set listbox3 with the list of matrices that can be visualized
vars = evalin('base','who');
index = strmatch('MSim', strvcat(vars));
set(handles.listbox3,'String',vars(index));



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

v=get(handles.listbox2,'Value');
s=get(handles.listbox2,'String');
nmatrix=s{v};
MSimSpikes=evalin('base',nmatrix);
if (get(handles.checkbox2,'Value'))
    tmp=MSimSpikes(triu(true(size(MSimSpikes)),0)); %we take the upper triangular matrix on and above the main diagonal
%      vector=tmp(tmp>0);
    
else
    tmp=MSimSpikes(triu(true(size(MSimSpikes)),1)); %we take the upper triangular matrix  above  the main diagonal , in this way we do not use the diagonal values
%     vector=tmp(tmp>0);
end
set(handles.edit3,'String',num2str(mean(tmp)));
set(handles.edit4,'String',num2str(std(tmp)));
% set(handles.edit5,'String',num2str(std(std(tmp))));


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thres=str2double(get(handles.edit2,'String'));
v=get(handles.listbox3,'Value');
s=get(handles.listbox3,'String');
nmatrix=s{v};
MSimSpikes=evalin('base',nmatrix);
if (get(handles.checkbox1,'Value'))
     ss='.\files\dist_pdfs\';
    nname=sprintf('Pdf_%s_shifw_th_%0.4g',nmatrix,thres);
    nname=strrep(nname,'.',''); %take away the dot
    nfile=sprintf('%s%s.mat',ss,nname); % add the .mat ending
     [height,pdf,xMin,xMax]=histoshiftweigth2(MSimSpikes,thres,nfile,nname);
     pdf=pdf./sum(pdf);  %makes sure the sum is one
    pdf2=pdf(pdf>0);
    entropy=-sum(pdf2.*log2(pdf2));
    emax=log2(length(pdf)); %maximum entropy, it is the log of number of bins
    index=(emax-entropy)/emax;
    set(handles.edit10,'String',num2str(index));
else
     ss='.\files\dist_pdfs\';
    nname=sprintf('Pdf_%s_shifw_ndi_th_%0.4g',nmatrix,thres);
    nname=strrep(nname,'.',''); %take away the dot
    nfile=sprintf('%s%s.mat',ss,nname); % add the .mat ending
    [height,pdf,xMin,xMax]=histoshiftweigth_nodiag2(MSimSpikes,thres,nfile,nname);
     pdf=pdf./sum(pdf);  %makes sure the sum is one
    pdf2=pdf(pdf>0);
    entropy=-sum(pdf2.*log2(pdf2));
    emax=log2(length(pdf)); %maximum entropy, it is the log of number of bins
    index=(emax-entropy)/emax;
    set(handles.edit10,'String',num2str(index));
end


% % --- Executes on button press in pushbutton9.
% function pushbutton9_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton9 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% v=get(handles.listbox2,'Value');
% s=get(handles.listbox2,'String');
% nmatrix=s{v};
% % s=get(handles.edit2,'String');
% % % sT=strrep(s,'Spikes','SpikesT');
% MSimSpikes=evalin('base',nmatrix);
% % MSimSpikesT=evalin('base',sT);
% 
% tmp=triu(MSimSpikes,1); %we take the upper triangular matrix  above the main diagonal
% % vector=tmp(tmp>0);
% set(handles.edit8,'String',num2str(mean(mean(tmp)))); %mean value of the upper part of the similarity matrix, without the diagonal





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


% % --- Executes on button press in pushbutton10.
% function pushbutton10_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton10 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% v=get(handles.listbox3,'Value');
% s=get(handles.listbox3,'String');
% nmatrix=s{v};
% % s=get(handles.edit2,'String');
% % % sT=strrep(s,'Spikes','SpikesT');
% MSimSpikes=evalin('base',nmatrix);
% % MSimSpikesT=evalin('base',sT);
% if (get(handles.checkbox1,'Value'))
%     tmp=triu(MSimSpikes,0); %we take the upper triangular matrix on and above the main diagonal
%     % vector=tmp(tmp>0);
%     set(handles.edit8,'String',num2str(mean(mean(tmp)))); %mean value of the upper part of the similarity matrix, without the diagonal
% else
%     tmp=triu(MSimSpikes,1); %we take the upper triangular matrix  above the main diagonal
%     % vector=tmp(tmp>0);
%     set(handles.edit8,'String',num2str(mean(mean(tmp)))); %mean value of the upper part of the similarity matrix, without the diagonal
% end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


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


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


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


% --- Executes during object creation, after setting all properties.
function pushbutton9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



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


