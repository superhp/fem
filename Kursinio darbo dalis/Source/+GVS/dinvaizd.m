function varargout = dinvaizd(varargin)
% DINVAIZD M-file for dinvaizd.fig
%      DINVAIZD, by itself, creates a new DINVAIZD or raises the existing
%      singleton*.
%
%      H = DINVAIZD returns the handle to a new DINVAIZD or the handle to
%      the existing singleton*.
%
%      DINVAIZD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DINVAIZD.M with the given input arguments.
%
%      DINVAIZD('Property','Value',...) creates a new DINVAIZD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dinvaizd_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dinvaizd_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dinvaizd

% Last Modified by GUIDE v2.5 11-May-2011 00:15:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       ['+GVS/' mfilename], ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dinvaizd_OpeningFcn, ...
                   'gui_OutputFcn',  @dinvaizd_OutputFcn, ...
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


% --- Executes just before dinvaizd is made visible.
function dinvaizd_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dinvaizd (see VARARGIN)

% Choose default command line output for dinvaizd
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dinvaizd wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dinvaizd_OutputFcn(hObject, eventdata, handles) 
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

dvv = zeros(1, 2);

if get(handles.dv1, 'Value') == 1
    dvv(1) = 1;
end;
if get(handles.dv1a, 'Value') == 1
    dvv(1) = 12;
end;
if get(handles.dv2, 'Value') == 1
    dvv(1) = 2;
    dvv(2) = str2double( get(handles.mnr, 'String') );
end;

db = DB.DB;
db.naujasBdv(dvv);
db.Baigti;

close;

% --- Executes on button press in dv2.
function dv2_Callback(hObject, eventdata, handles)
% hObject    handle to dv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dv2

set(handles.mnr, 'Enable', 'on');


% --- Executes on button press in dv1.
function dv1_Callback(hObject, eventdata, handles)
% hObject    handle to dv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dv1

set(handles.mnr, 'Enable', 'off');


% --- Executes on button press in dv1a.
function dv1a_Callback(hObject, eventdata, handles)
% hObject    handle to dv1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dv1a

set(handles.mnr, 'Enable', 'off');


% --- Executes during object creation, after setting all properties.
function mnr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
