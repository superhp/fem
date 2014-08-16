function varargout = conf(varargin)
% CONF M-file for conf.fig
%      CONF, by itself, creates a new CONF or raises the existing
%      singleton*.
%
%      H = CONF returns the handle to a new CONF or the handle to
%      the existing singleton*.
%
%      CONF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONF.M with the given input arguments.
%
%      CONF('Property','Value',...) creates a new CONF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before conf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to conf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help conf

% Last Modified by GUIDE v2.5 06-Dec-2011 16:46:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       ['+GVS/' mfilename], ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @conf_OpeningFcn, ...
                   'gui_OutputFcn',  @conf_OutputFcn, ...
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


% --- Executes just before conf is made visible.
function conf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to conf (see VARARGIN)

% Choose default command line output for conf
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes conf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = conf_OutputFcn(hObject, eventdata, handles) 
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



function bH_Callback(hObject, eventdata, handles)
% hObject    handle to bH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bH as text
%        str2double(get(hObject,'String')) returns contents of bH as a double


% --- Executes during object creation, after setting all properties.
function bH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bKxx_Callback(hObject, eventdata, handles)
% hObject    handle to bKxx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bKxx as text
%        str2double(get(hObject,'String')) returns contents of bKxx as a double


% --- Executes during object creation, after setting all properties.
function bKxx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bKxx (see GCBO)
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



function bE_Callback(hObject, eventdata, handles)
% hObject    handle to bE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bE as text
%        str2double(get(hObject,'String')) returns contents of bE as a double


% --- Executes during object creation, after setting all properties.
function bE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bN_Callback(hObject, eventdata, handles)
% hObject    handle to bN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bN as text
%        str2double(get(hObject,'String')) returns contents of bN as a double


% --- Executes during object creation, after setting all properties.
function bN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bDt_Callback(hObject, eventdata, handles)
% hObject    handle to bDt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bDt as text
%        str2double(get(hObject,'String')) returns contents of bDt as a double


% --- Executes during object creation, after setting all properties.
function bDt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bDt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bIter_Callback(hObject, eventdata, handles)
% hObject    handle to bIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bIter as text
%        str2double(get(hObject,'String')) returns contents of bIter as a double


% --- Executes during object creation, after setting all properties.
function bIter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bPc_Callback(hObject, eventdata, handles)
% hObject    handle to bPc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bPc as text
%        str2double(get(hObject,'String')) returns contents of bPc as a double


% --- Executes during object creation, after setting all properties.
function bPc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bPc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bTApl_Callback(hObject, eventdata, handles)
% hObject    handle to bTApl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bTApl as text
%        str2double(get(hObject,'String')) returns contents of bTApl as a double


% --- Executes during object creation, after setting all properties.
function bTApl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bTApl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bTKr_Callback(hObject, eventdata, handles)
% hObject    handle to bTKr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bTKr as text
%        str2double(get(hObject,'String')) returns contents of bTKr as a double


% --- Executes during object creation, after setting all properties.
function bTKr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bTKr (see GCBO)
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



%irasymas i faila
%f1 = fopen('init/duom.txt','w');

%N ir NP
%fprintf(f1, '%s\n', get(handles.bN, 'String'));

%E ir NE
%fprintf(f1, '%s\n', get(handles.bE, 'String'));

%S - galo plotas
%fprintf(f1, '%s\n', S);

%Aplinkos temperatura
%fprintf(f1, '%s\n', get(handles.bTApl, 'String'));

%Krastine temperatura
%fprintf(f1, '%s\n', get(handles.bTKr, 'String'));

%h
%fprintf(f1, '%s\n', get(handles.bH, 'String'));

%Kxx
%fprintf(f1, '%s\n', get(handles.bKxx, 'String'));

%Dinamiskumas
dinam = 0;
if get(handles.bDin, 'Value') == 1
    dinam = 1;
end;
if get(handles.bDinGal, 'Value') == 1
        dinam = 2; 
end;        

%fprintf(f1, '%s\n', num2str( dinam ));

%Pagal laika
%---------------------------------------------
%pc
%fprintf(f1, '%s\n', get(handles.bPc, 'String'));

%dt
%fprintf(f1, '%s\n', get(handles.bDt, 'String'));

%isk
%fprintf(f1, '%s\n', get(handles.bIter, 'String'));
%---------------------------------------------

%fclose(f1);

if get(handles.d11, 'Value') == 1
       dim = 1;
end;
if get(handles.d22, 'Value') == 1
       dim = 2;
end;
if get(handles.d33, 'Value') == 1
       dim = 3;
end;        

db = DB.DB;
t = { dim, get(handles.bE, 'String'), ...
      get(handles.bN, 'String'), dinam, ...      
      get(handles.bDt, 'String'), get(handles.bIter, 'String'), ...
      get(handles.bPc, 'String')  };  
db.naujasB( struct('dimensija',t(1),'Epav',t(2),'Npav',t(3),...
                   'dinam',t(4),'dt',t(5),'isk',t(6),'pc',t(7)));          
db.Baigti;

close;

% --- Executes on button press in bDin.
function bDin_Callback(hObject, eventdata, handles)
% hObject    handle to bDin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bDin

if get(handles.bDin, 'Value') == 1
    set(handles.bDt,'Enable','on');
    set(handles.bPc,'Enable','on');
    set(handles.bIter,'Enable','on'); 
    set(handles.bDinGal,'Value', 0);
    GVS.dinvaizd();
else
    set(handles.bDt,'Enable','off');
    set(handles.bPc,'Enable','off');
    set(handles.bIter,'Enable','off');
end;



function bR_Callback(hObject, eventdata, handles)
% hObject    handle to bR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bR as text
%        str2double(get(hObject,'String')) returns contents of bR as a double


% --- Executes during object creation, after setting all properties.
function bR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tra_Callback(hObject, eventdata, handles)
% hObject    handle to Tra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tra as text
%        str2double(get(hObject,'String')) returns contents of Tra as a double


% --- Executes during object creation, after setting all properties.
function Tra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Trb_Callback(hObject, eventdata, handles)
% hObject    handle to Trb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Trb as text
%        str2double(get(hObject,'String')) returns contents of Trb as a double


% --- Executes during object creation, after setting all properties.
function Trb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Trb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Trc_Callback(hObject, eventdata, handles)
% hObject    handle to Trc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Trc as text
%        str2double(get(hObject,'String')) returns contents of Trc as a double


% --- Executes during object creation, after setting all properties.
function Trc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Trc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sta_Callback(hObject, eventdata, handles)
% hObject    handle to Sta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sta as text
%        str2double(get(hObject,'String')) returns contents of Sta as a double


% --- Executes during object creation, after setting all properties.
function Sta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Stb_Callback(hObject, eventdata, handles)
% hObject    handle to Stb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Stb as text
%        str2double(get(hObject,'String')) returns contents of Stb as a double


% --- Executes during object creation, after setting all properties.
function Stb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Stb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bDinGal.
function bDinGal_Callback(hObject, eventdata, handles)
% hObject    handle to bDinGal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bDinGal

if get(handles.bDinGal, 'Value') == 1
    set(handles.bDt,'Enable','on');
    set(handles.bPc,'Enable','on');
    set(handles.bIter,'Enable','on'); 
    set(handles.bDin,'Value', 0);
    GVS.dinvaizd();
else
    set(handles.bDt,'Enable','off');
    set(handles.bPc,'Enable','off');
    set(handles.bIter,'Enable','off');
end;


% --- Executes on button press in gnr.
function gnr_Callback(hObject, eventdata, handles)
% hObject    handle to gnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

GVS.gener();


% --- Executes on button press in d22.
function d22_Callback(hObject, eventdata, handles)
if get(handles.d22, 'Value') == 1
    set(handles.bDin, 'Enable', 'off');
    set(handles.bDinGal, 'Enable', 'off');
    set(handles.pnst, 'Enable', 'off');
end;


% --- Executes on button press in d33.
function d33_Callback(hObject, eventdata, handles)


% --- Executes on button press in d11.
function d11_Callback(hObject, eventdata, handles)
set(handles.bDin, 'Enable', 'on');
set(handles.bDinGal, 'Enable', 'on');
set(handles.pnst, 'Enable', 'on');


% --- Executes on button press in pnst.
function pnst_Callback(hObject, eventdata, handles)
% hObject    handle to pnst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.d11, 'Value') == 1
    GVS.C1D();
end;
