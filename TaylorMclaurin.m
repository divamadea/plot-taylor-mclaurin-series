function varargout = TaylorMclaurin(varargin)
% TAYLORMCLAURIN MATLAB code for TaylorMclaurin.fig
%      TAYLORMCLAURIN, by itself, creates a new TAYLORMCLAURIN or raises the existing
%      singleton*.
%
%      H = TAYLORMCLAURIN returns the handle to a new TAYLORMCLAURIN or the handle to
%      the existing singleton*.
%
%      TAYLORMCLAURIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAYLORMCLAURIN.M with the given input arguments.
%
%      TAYLORMCLAURIN('Property','Value',...) creates a new TAYLORMCLAURIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TaylorMclaurin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TaylorMclaurin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TaylorMclaurin

% Last Modified by GUIDE v2.5 12-Jun-2020 17:24:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TaylorMclaurin_OpeningFcn, ...
                   'gui_OutputFcn',  @TaylorMclaurin_OutputFcn, ...
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


% --- Executes just before TaylorMclaurin is made visible.
function TaylorMclaurin_OpeningFcn(hObject, eventdata, handles, varargin)
movegui(gcf,'center');
set(handles.uibuttongroup1,'SelectionChangeFcn',@uibuttongroup1_SelectionChangeFcn);
buttons_list = [handles.taylor_rb, handles.maclaurin_rb];
set(buttons_list, 'Value', 0);    %turns them all off
set(handles.reset_b,'Enable','off')
set(handles.disp_error,'Enable','inactive');
handles = guidata(hObject);
pbuttons_list = [handles.nilaix, handles.order, handles.xmin, handles.xmax];
set(pbuttons_list, 'Enable', 'off'); 
set(findall(handles.uibuttongroup1, '-property', 'enable'), 'enable', 'off');


% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TaylorMclaurin (see VARARGIN)

% Choose default command line output for TaylorMclaurin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TaylorMclaurin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TaylorMclaurin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu.
function popupmenu_Callback(hObject, eventdata, handles)
if get(handles.popupmenu,'Value')~=1
    set(findall(handles.uibuttongroup1, '-property', 'enable'), 'enable', 'on');
end


static = [handles.aderajat,handles.dderajat];
contents = get(handles.popupmenu,'String'); 
popupmenuvalue = contents{get(handles.popupmenu,'Value')};
switch popupmenuvalue
    case 'cos x' 
        set(static,'String','(dalam derajat)')
    case 'sin x'
        set(static,'String','(dalam derajat)')
    case 'e^x'
        set(static,'String','')
    case 'ln(x+1)'
        set(static,'String','')
end
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu


% --- Executes during object creation, after setting all properties.
function popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function order_Callback(hObject, eventdata, handles)
Str    = get(hObject, 'String');
Value  = sscanf(Str, '%g', 1);
fixStr = sprintf('%g', Value);
set(hObject, 'String', fixStr);
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of order as text
%        str2double(get(hObject,'String')) returns contents of order as a double


% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function xmin_Callback(hObject, eventdata, handles)
Str    = get(hObject, 'String');
Value  = sscanf(Str, '%g', 1);
fixStr = sprintf('%g', Value);
set(hObject, 'String', fixStr);
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin as text
%        str2double(get(hObject,'String')) returns contents of xmin as a double


% --- Executes during object creation, after setting all properties.
function xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmax_Callback(hObject, eventdata, handles)
Str    = get(hObject, 'String');
Value  = sscanf(Str, '%g', 1);
fixStr = sprintf('%g', Value);
set(hObject, 'String', fixStr);
% hObject    handle to xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmax as text
%        str2double(get(hObject,'String')) returns contents of xmax as a double


% --- Executes during object creation, after setting all properties.
function xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plot_b.
function plot_b_Callback(hObject, eventdata, handles)
a = str2num(get(handles.nilaix,'String'));
m = str2num(get(handles.order,'String'));
min = str2num(get(handles.xmin,'String'));
max = str2num(get(handles.xmax,'String'));

n=m+1;

if isempty(get(handles.nilaix, 'String')) || isempty(get(handles.order, 'String'))...
        || isempty(get(handles.xmin, 'String')) || isempty(get(handles.xmax, 'String'))
  warndlg('Ada kolom yang masih kosong');
else
    selectedrb = get(get(handles.uibuttongroup1,'SelectedObject'),'Tag');
handles=guidata(hObject);
contents = get(handles.popupmenu,'String'); 
popupmenuvalue = contents{get(handles.popupmenu,'Value')};

switch popupmenuvalue
    case 'cos x'
        switch selectedrb
            case 'taylor_rb'  
            case 'maclaurin_rb'
             a=0;
        end
        syms x
        g = cos(x);
        a=a*pi/180;
        
        d1=min*pi/180;
        d2=max*pi/180;
        
        axes(handles.axes1)
        graph_taylor(g,a,n,d1,d2);
        h = legend('taylor approximation','actual function');
        
        error=taylor_error(d1,d2,a,g,n);

        str=sprintf('%.8f',error);
        set(handles.disp_error,'String',str);
        
    case 'sin x'
        switch selectedrb
            case 'taylor_rb'  
            case 'maclaurin_rb'
             a=0;
        end
        syms x
        g = sin(x);
        a=a*pi/180;

        d1=min*pi/180;
        d2=max*pi/180;
        
        axes(handles.axes1)
        graph_taylor(g,a,n,d1,d2);
        h = legend('taylor approximation','actual function');
        set(h,'Location','southeast');
        
        error=taylor_error(d1,d2,a,g,n);
        str=sprintf('%.8f',error);
        set(handles.disp_error,'String',str);
        
    case 'e^x'
        switch selectedrb
            case 'taylor_rb'  
            case 'maclaurin_rb'
             a=0;
        end
        syms x
        g = exp(x);
        
        axes(handles.axes1)
        graph_taylor(g,a,n,min,max);
        h1 = legend('taylor approximation','actual function');
         
        error=taylor_error(min,max,a,g,n);
        str=sprintf('%.8f',error);
        set(handles.disp_error,'String',str);
        
    case 'ln(x+1)'
        switch selectedrb
            case 'taylor_rb'  
            case 'maclaurin_rb'
             a=0;
        end
        syms x
        g = log(x+1);
        
        axes(handles.axes1)
        graph_taylor(g,a,n,min,max);
        h1 = legend('taylor approximation','actual function');
         
        error=taylor_error(min,max,a,g,n);
        str=sprintf('%.8f',error);
        set(handles.disp_error,'String',str);
end
pbuttons_list = [handles.popupmenu, handles.nilaix, handles.order, handles.xmin, handles.xmax];
set(pbuttons_list, 'Enable', 'off');
set(handles.disp_error,'Enable','inactive');
set(findall(handles.uibuttongroup1, '-property', 'enable'), 'enable', 'off')
set(handles.reset_b,'Enable','on')
end
% hObject    handle to plot_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in proses_b.
function proses_b_Callback(hObject, eventdata, handles)
% hObject    handle to proses_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function nilaix_Callback(hObject, eventdata, handles)
Str    = get(hObject, 'String');
Value  = sscanf(Str, '%g', 1);
fixStr = sprintf('%g', Value);
set(hObject, 'String', fixStr);
% hObject    handle to nilaix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaix as text
%        str2double(get(hObject,'String')) returns contents of nilaix as a double


% --- Executes during object creation, after setting all properties.
function nilaix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangeFcn(hObject, eventdata, handles)
handles=guidata(hObject);
val=get(handles.maclaurin_rb, 'Value');

if  get(handles.maclaurin_rb,'Value')==1 || get(handles.taylor_rb,'Value')==1
    pbuttons_list = [handles.nilaix, handles.order, handles.xmin, handles.xmax,handles.disp_error];
    set(pbuttons_list, 'Enable', 'on');  
    if val
   set(handles.nilaix,'Enable','off')
   set(handles.nilaix,'String','0')
    else
   set(handles.nilaix,'Enable','on')
   set(handles.nilaix,'String','')
    end
end


% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function disp_error_Callback(hObject, eventdata, handles)
% hObject    handle to disp_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of disp_error as text
%        str2double(get(hObject,'String')) returns contents of disp_error as a double


% --- Executes during object creation, after setting all properties.
function disp_error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to disp_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset_b.
function reset_b_Callback(hObject, eventdata, handles)
static = [handles.aderajat,handles.dderajat];
set(static,'String','');
buttons_list = [handles.taylor_rb, handles.maclaurin_rb];
set(buttons_list, 'Value', 0); 
edit_list = [handles.nilaix, handles.order, handles.xmin, handles.xmax];
set(edit_list,'String','');
set(edit_list, 'Enable', 'off'); 
set(handles.popupmenu,'Enable','on');
set(handles.disp_error,'String','');
set(handles.disp_error,'Enable','inactive');
cla reset;
set(handles.popupmenu,'Value',1);
set(findall(handles.uibuttongroup1, '-property', 'enable'), 'enable', 'off');
set(handles.reset_b,'Enable','off');

% hObject    handle to reset_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on nilaix and none of its controls.
function nilaix_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to nilaix (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
