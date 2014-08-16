function varargout = C1D(varargin)
% C1D M-file for C1D.fig
%      C1D, by itself, creates a new C1D or raises the existing
%      singleton*.
%
%      H = C1D returns the handle to a new C1D or the handle to
%      the existing singleton*.
%
%      C1D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in C1D.M with the given input arguments.
%
%      C1D('Property','Value',...) creates a new C1D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before C1D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to C1D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help C1D

% Last Modified by GUIDE v2.5 05-Dec-2011 00:00:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       ['+GVS/' mfilename], ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @C1D_OpeningFcn, ...
                   'gui_OutputFcn',  @C1D_OutputFcn, ...
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


% --- Executes just before C1D is made visible.
function C1D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to C1D (see VARARGIN)

% Choose default command line output for C1D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes C1D wait for user response (see UIRESUME)
% uiwait(handles.C1D);


% --- Outputs from this function are returned to the command line.
function varargout = C1D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Issaugoti.
function Issaugoti_Callback(hObject, eventdata, handles)
% hObject    handle to Issaugoti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%elemento galo ploto apskaiciavimas
S = ''; 
if strcmp( get(handles.pC,'Visible'), 'on' );
    S = get(handles.bR, 'String');      
end;
if strcmp( get(handles.pS,'Visible'), 'on' );
    sta = get(handles.Sta, 'String');
    stb = get(handles.Stb, 'String');
    S =  num2str( str2double( sta ) * str2double( stb ) );    
end;
if strcmp( get(handles.pT,'Visible'), 'on' );
    tra = str2double( get(handles.Tra, 'String') );
    trb = str2double( get(handles.Trb, 'String') );
    trc = str2double( get(handles.Trc, 'String') );
    p = (tra + trb + trc) / 3;
    S = num2str( sqrt( p * (p-tra) * (p-trb) * (p-trc)) );
end;

db = DB.DB1D;
t = {get(handles.bTApl, 'String'), get(handles.bTKr, 'String'),...
    get(handles.bH, 'String'), get(handles.bKxx, 'String'), ...
    get(handles.knr, 'String')};  

db.p = struct('Ta',t(1),'Tk',t(2),'knr',t(5),'h',t(3),'Kxx',t(4),'S',S);          
db.Baigti;

close;



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


% --- Executes on button press in rC.
function rC_Callback(hObject, eventdata, handles)
set(handles.pC,'Visible','on');
set(handles.pS,'Visible','off');
set(handles.pT,'Visible','off');


% --- Executes on button press in rS.
function rS_Callback(hObject, eventdata, handles)
set(handles.pC,'Visible','off');
set(handles.pS,'Visible','on');
set(handles.pT,'Visible','off');


% --- Executes on button press in rT.
function rT_Callback(hObject, eventdata, handles)
set(handles.pC,'Visible','off');
set(handles.pS,'Visible','off');
set(handles.pT,'Visible','on');



function knr_Callback(hObject, eventdata, handles)
% hObject    handle to knr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of knr as text
%        str2double(get(hObject,'String')) returns contents of knr as a double


% --- Executes during object creation, after setting all properties.
function knr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to knr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
