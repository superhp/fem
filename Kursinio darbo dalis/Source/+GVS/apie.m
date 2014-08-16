function varargout = apie(varargin)
% APIE M-file for apie.fig
%      APIE, by itself, creates a new APIE or raises the existing
%      singleton*.
%
%      H = APIE returns the handle to a new APIE or the handle to
%      the existing singleton*.
%
%      APIE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APIE.M with the given input arguments.
%
%      APIE('Property','Value',...) creates a new APIE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before apie_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to apie_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help apie

% Last Modified by GUIDE v2.5 07-Dec-2011 21:44:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       ['+GVS/' mfilename], ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @apie_OpeningFcn, ...
                   'gui_OutputFcn',  @apie_OutputFcn, ...
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


% --- Executes just before apie is made visible.
function apie_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to apie (see VARARGIN)

% Choose default command line output for apie
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes apie wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = apie_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
