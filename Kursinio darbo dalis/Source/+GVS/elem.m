function varargout = elem(varargin)
% ELEM M-file for elem.fig
%      ELEM, by itself, creates a new ELEM or raises the existing
%      singleton*.
%
%      H = ELEM returns the handle to a new ELEM or the handle to
%      the existing singleton*.
%
%      ELEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELEM.M with the given input arguments.
%
%      ELEM('Property','Value',...) creates a new ELEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before elem_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to elem_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help elem

% Last Modified by GUIDE v2.5 28-Jun-2011 13:36:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       ['+GVS/' mfilename], ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @elem_OpeningFcn, ...
                   'gui_OutputFcn',  @elem_OutputFcn, ...
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


% --- Executes just before elem is made visible.
function elem_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to elem (see VARARGIN)

% Choose default command line output for elem
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes elem wait for user response (see UIRESUME)
% uiwait(handles.Elementas);


% --- Outputs from this function are returned to the command line.
function varargout = elem_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in goe.
function goe_Callback(hObject, eventdata, handles)
% hObject    handle to goe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

enr = str2double( get(handles.enr, 'String') );
load rez.txt;

db = DB.DB1D;
N = db.N;
E = db.E;
db.Baigti;

set(handles.gm, 'String', mat2str(E(enr,:)));
set(handles.at, 'String', mat2str(rez(E(enr,:))));
set(handles.ak, 'String', mat2str(N(E(enr,:),:)));


function mnr_Callback(hObject, eventdata, handles)
% hObject    handle to mnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mnr as text
%        str2double(get(hObject,'String')) returns contents of mnr as a double


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



function enr_Callback(hObject, eventdata, handles)
% hObject    handle to enr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enr as text
%        str2double(get(hObject,'String')) returns contents of enr as a double


% --- Executes during object creation, after setting all properties.
function enr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gom.
function gom_Callback(hObject, eventdata, handles)
% hObject    handle to gom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mnr = str2double( get(handles.mnr, 'String') );
load rez.txt;

db = DB.DB1D;
N = db.N;
E = db.E;
db.Baigti;

set(handles.mt, 'String', rez(mnr));

x = N(:,1);
y = N(:,2);
set(handles.mk, 'String', ['(' num2str(x(mnr)) ', ' num2str(y(mnr)) ')']);

elem = E(mnr, :);
set(handles.ge, 'String', [num2str(elem(1)) ', ' num2str(elem(2))]);
