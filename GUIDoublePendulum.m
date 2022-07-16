function varargout = GUIDoublePendulum(varargin)
% GUIDOUBLEPENDULUM MATLAB code for GUIDoublePendulum.fig
%      GUIDOUBLEPENDULUM, by itself, creates a new GUIDOUBLEPENDULUM or raises the existing
%      singleton*.
%
%      H = GUIDOUBLEPENDULUM returns the handle to a new GUIDOUBLEPENDULUM or the handle to
%      the existing singleton*.
%
%      GUIDOUBLEPENDULUM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDOUBLEPENDULUM.M with the given input arguments.
%
%      GUIDOUBLEPENDULUM('Property','Value',...) creates a new GUIDOUBLEPENDULUM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIDoublePendulum_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIDoublePendulum_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIDoublePendulum

% Last Modified by GUIDE v2.5 15-Jul-2022 12:46:57

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @GUIDoublePendulum_OpeningFcn, ...
                       'gui_OutputFcn',  @GUIDoublePendulum_OutputFcn, ...
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
end


% --- Executes just before GUIDoublePendulum is made visible.
function GUIDoublePendulum_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIDoublePendulum (see VARARGIN)

% Choose default command line output for GUIDoublePendulum
    handles.output = hObject;
    handles.edit1 = 0;
    handles.edit2 = 0;

% Update handles structure
    guidata(hObject, handles);

% UIWAIT makes GUIDoublePendulum wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = GUIDoublePendulum_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
    varargout{1} = handles.output;
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
    handles.edit1 = str2double(get(hObject, 'String'));
    if isnan(handles.edit1)
        handles.edit1 = 0;
    end
    guidata(hObject, handles);
end


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
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
    handles.edit2 = str2double(get(hObject, 'String'));
    if isnan(handles.edit2)
        handles.edit2 = 0;
    end
    guidata(hObject, handles);
end


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
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    l1 = handles.edit1;
    l2 = handles.edit2;

    if l1 && l2
        [x2, y2] = DoublePendulum(l1, l2);
        plot(x2, y2);
    end
end
