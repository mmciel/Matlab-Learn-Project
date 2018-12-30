function varargout = reg(varargin)
% REG M-file for reg.fig
%      REG, by itself, creates a new REG or raises the existing
%      singleton*.
%
%      H = REG returns the handle to a new REG or the handle to
%      the existing singleton*.
%
%      REG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REG.M with the given input arguments.
%
%      REG('Property','Value',...) creates a new REG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reg_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reg

% Last Modified by GUIDE v2.5 17-Nov-2018 20:46:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reg_OpeningFcn, ...
                   'gui_OutputFcn',  @reg_OutputFcn, ...
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


% --- Executes just before reg is made visible.
function reg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reg (see VARARGIN)

% Choose default command line output for reg
handles.output = hObject;
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('./img/reg_bg.png');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','off');

%i = imread('./img/username.jpg');
%imshow(i);
%axes(findobj(gcf,'Tag','axes2'));
%i = imread('./img/password.jpg');
%imshow(i);

i = imread('./img/ok_big.png');
set(handles.ok,'CData',i);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes reg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = reg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
username = get(handles.username,'String');
password = get(handles.password,'String');
if isempty(username)||isempty(password)
    warndlg('username or password is empty!');
    return;
end
%disp(username);
%disp(password);
tempname = getASCIIstr(username);
temppw = getASCIIstr(password);
%disp(tempname);
%disp(temppw);

stringname = num2str(tempname);
stringpw = num2str(temppw); 
fid = fopen('./data/UserLoginData.txt','r');
while (feof(fid) ~= 1)
    strdata = fgetl(fid);
    index = findstr(strdata,'#');
    sname = strdata(1:index-1);
    %disp(sname);
    if strcmp(sname,stringname)
        warndlg('username already exists! please login!');
        fclose(fid);
        return;
    end
end
tempfid = fopen('./data/UserLoginData.txt','a');
fprintf(tempfid,'%s',stringname);
fprintf(tempfid,'%s','#');
fprintf(tempfid,'%s',stringpw);
fprintf(tempfid,'\r\n');
fclose(tempfid);
msgbox('Registration is successful!','to:','help');  
close(reg);

function username_Callback(hObject, eventdata, handles)
% hObject    handle to username (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of username as text
%        str2double(get(hObject,'String')) returns contents of username as a double


% --- Executes during object creation, after setting all properties.
function username_CreateFcn(hObject, eventdata, handles)
% hObject    handle to username (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function password_Callback(hObject, eventdata, handles)
% hObject    handle to password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of password as text
%        str2double(get(hObject,'String')) returns contents of password as a double


% --- Executes during object creation, after setting all properties.
function password_CreateFcn(hObject, eventdata, handles)
% hObject    handle to password (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called










% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3




% --- Executes during object creation, after setting all properties.
function ok_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


