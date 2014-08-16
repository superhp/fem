function varargout = gener(varargin)
% FIGURE1 M-file for figure1.fig
%      FIGURE1, by itself, creates a new FIGURE1 or raises the existing
%      singleton*.
%
%      H = FIGURE1 returns the handle to a new FIGURE1 or the handle to
%      the existing singleton*.
%
%      FIGURE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGURE1.M with the given input arguments.
%
%      FIGURE1('Property','Value',...) creates a new FIGURE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gener_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gener_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figure1

% Last Modified by GUIDE v2.5 04-Dec-2011 01:10:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       ['+GVS/' mfilename], ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gener_OpeningFcn, ...
                   'gui_OutputFcn',  @gener_OutputFcn, ...
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


% --- Executes just before figure1 is made visible.
function gener_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figure1 (see VARARGIN)

% Choose default command line output for figure1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figure1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gener_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function matm_Callback(hObject, eventdata, handles)
% hObject    handle to matm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matm as text
%        str2double(get(hObject,'String')) returns contents of matm as a double


% --- Executes during object creation, after setting all properties.
function matm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function esk_Callback(hObject, eventdata, handles)
% hObject    handle to esk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of esk as text
%        str2double(get(hObject,'String')) returns contents of esk as a double


% --- Executes during object creation, after setting all properties.
function esk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to esk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ilg_Callback(hObject, eventdata, handles)
% hObject    handle to ilg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ilg as text
%        str2double(get(hObject,'String')) returns contents of ilg as a double


% --- Executes during object creation, after setting all properties.
function ilg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ilg (see GCBO)
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

nuo=0; iki=0; prc=0; tipas=1;   %deklaravimas

n = str2double( get(handles.esk, 'String') );
ilg = str2double( get(handles.ilg, 'String') );
Epav = get(handles.Eg, 'String');
Npav = get(handles.Ng, 'String');

%matmens nustatymas
testi = 1;
if get(handles.d1, 'Value') == 1   
    %objekto tipas        
    if get(handles.strypas, 'Value') == 1
        tipas = 1;
    elseif get(handles.lauzte, 'Value') == 1
        tipas = 2;
    elseif get(handles.lankas, 'Value') == 1
        tipas = 3;
    elseif get(handles.piesti, 'Value') == 1 
        ix = str2double( get(handles.ix, 'String') );
        iy = str2double( get(handles.iy, 'String') );
    
        gnr = Gnr.Gnr1D(Epav, Npav);
        gnr.Interaktyvus(ix, iy);
        figure;
        
        testi = 0;
        close Generavimas;
    end;
    
    if testi == 1
        %intensyvumo parametrai
        if get(handles.int, 'Value') == 1
            nuo = str2double( get(handles.inuo, 'String') );
            iki = str2double( get(handles.iiki, 'String') );
            prc = str2double( get(handles.iprc, 'String') ); 
        end;
        
        gnr = Gnr.Gnr1D(Epav, Npav);
        gnr.Numatytas(tipas, n, ilg, nuo, iki, prc);
    end;
    
elseif get(handles.d2, 'Value') == 1
    gnr = Gnr.Gnr2D;
else
    gnr = Gnr.Gnr3D;
end;

close;


function Eg_Callback(hObject, eventdata, handles)
% hObject    handle to Eg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Eg as text
%        str2double(get(hObject,'String')) returns contents of Eg as a double


% --- Executes during object creation, after setting all properties.
function Eg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Eg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ng_Callback(hObject, eventdata, handles)
% hObject    handle to Ng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ng as text
%        str2double(get(hObject,'String')) returns contents of Ng as a double


% --- Executes during object creation, after setting all properties.
function Ng_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in d1.
function d1_Callback(hObject, eventdata, handles)
if get(handles.d1, 'Value') == 1
    set(handles.vienmatis, 'Visible', 'on');
else
    set(handles.vienmatis, 'Visible', 'off');
end;


% --- Executes on button press in d2.
function d2_Callback(hObject, eventdata, handles)
% hObject    handle to d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of d2


% --- Executes on button press in d3.
function d3_Callback(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of d3


function inuo_Callback(hObject, eventdata, handles)
% hObject    handle to inuo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inuo as text
%        str2double(get(hObject,'String')) returns contents of inuo as a double


% --- Executes during object creation, after setting all properties.
function inuo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inuo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iiki_Callback(hObject, eventdata, handles)
% hObject    handle to iiki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iiki as text
%        str2double(get(hObject,'String')) returns contents of iiki as a double


% --- Executes during object creation, after setting all properties.
function iiki_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iiki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iprc_Callback(hObject, eventdata, handles)
% hObject    handle to iprc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iprc as text
%        str2double(get(hObject,'String')) returns contents of iprc as a double


% --- Executes during object creation, after setting all properties.
function iprc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iprc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in int.
function int_Callback(hObject, eventdata, handles)
% hObject    handle to int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of int

if get(handles.int,'Value') == 1
    set(handles.inuo,'Enable','on');
    set(handles.iiki,'Enable','on');
    set(handles.iprc,'Enable','on');
else
    set(handles.inuo,'Enable','off');
    set(handles.iiki,'Enable','off');
    set(handles.iprc,'Enable','off');
end;



function ix_Callback(hObject, eventdata, handles)
% hObject    handle to ix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ix as text
%        str2double(get(hObject,'String')) returns contents of ix as a double


% --- Executes during object creation, after setting all properties.
function ix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iy_Callback(hObject, eventdata, handles)
% hObject    handle to iy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iy as text
%        str2double(get(hObject,'String')) returns contents of iy as a double


% --- Executes during object creation, after setting all properties.
function iy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
