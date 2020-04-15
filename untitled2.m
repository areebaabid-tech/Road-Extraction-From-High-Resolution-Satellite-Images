function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 06-Apr-2020 16:12:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axis off;
% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
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
[filename, pathname] = uigetfile('C:\Users\areeba abid\Desktop\dataset');
I=imread([pathname, filename]);
imshow(I,'Parent',handles.axes1);
handles.original_image = I;  %new
handles.current_image = I;   %new
guidata(hObject, handles);   %new

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, ~, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theImage = getimage();
if isempty(theImage)
    % Nothing is in the current axes.
    uiwait(warndlg('Please load an image'));
else
    axis(handles.axes1);
    I = handles.current_image;   %new
    J=rgb2gray(I);
    %whos
    K=imadjust(J,[0.5 0.9],[]);
    level = graythresh(K);  
    B_W=im2bw(K,level);
    B = medfilt2(B_W);
    im = bwareaopen(B,1200);
    imshow(im,'Parent',handles.axes1);
end
handles.current_image = im;   %new
handles.gray_image=J;        %new
guidata(hObject, handles);   %new

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axis(handles.axes1);
im = handles.current_image;
theImage = getimage();
if isempty(theImage)
    % Nothing is in the current axes.
    uiwait(warndlg('Please load an image'));
else  
      
         
        BW = bwmorph(im,'remove');
        imshow(BW,'Parent',handles.axes1);
        handles.current_image = BW;   %new
        guidata(hObject, handles);   %new
       
end
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theImage = getimage();
if isempty(theImage)
    % Nothing is in the current axes.
    uiwait(warndlg('Please load an image'));
else
    axis(handles.axes1);
    BW = handles.current_image;   %new
    BW1 = edge(BW,'sobel');
    imshow(BW1,'Parent',handles.axes1);
    handles.current_image = BW1;   %new
    guidata(hObject, handles);   %new
end
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theImage = getimage();
if isempty(theImage)
    % Nothing is in the current axes.
    uiwait(warndlg('Please load an image'));
else
    axis(handles.axes1);
    BW1 = handles.current_image;   %new
    J=handles.gray_image; 
    H = vision.AlphaBlender;
    J = im2single(J);
    BW1 = im2single(BW1);
    Y = step(H,J,BW1);
    imshow(Y,'Parent',handles.axes1);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
