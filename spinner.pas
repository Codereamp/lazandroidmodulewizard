unit Spinner;

{$mode delphi}

interface

uses
  Classes, SysUtils, And_jni, And_jni_Bridge, Laz_And_Controls, AndroidWidget;

type

TOnItemSelected = procedure(Sender: TObject; caption: string; position: integer) of object;

{Draft Component code by "Lazarus Android Module Wizard" [6/12/2014 3:35:32]}
{https://github.com/jmpessoa/lazandroidmodulewizard}

{jVisualControl template}

jSpinner = class(jVisualControl)
 private
    FItems: TStrings;
    FOnItemSelected: TOnItemSelected;

    FSelectedFontColor: TARGBColorBridge;
    FDropListTextColor: TARGBColorBridge;
    FDropListBackgroundColor: TARGBColorBridge;

    FLastItemAsPrompt: boolean;

    procedure SetVisible(Value: Boolean);
    procedure SetColor(Value: TARGBColorBridge);

    procedure SetItems(Value: TStrings);
    procedure SetSelectedFontColor(Value : TARGBColorBridge);

    procedure UpdateLParamHeight;
    procedure UpdateLParamWidth;

 protected
    //
 public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Init(refApp: jApp); override;
    procedure Refresh;
    procedure UpdateLayout; override;
    function jCreate(): jObject;
    procedure jFree();
    procedure SetjParent(_viewgroup: jObject);
    procedure SetLParamWidth(_w: integer);
    procedure SetLParamHeight(_h: integer);
    procedure SetLeftTopRightBottomWidthHeight(_left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
    procedure AddLParamsAnchorRule(_rule: integer);
    procedure AddLParamsParentRule(_rule: integer);
    procedure SetLayoutAll(_idAnchor: integer);
    procedure SetId(_id: integer);
    function GetSelectedItemPosition(): integer;
    function GetSelectedItem(): string;
    procedure Add(_item: string);
    procedure SetSelectedTextColor(_color: integer);
    procedure SetDropListTextColor(_color: TARGBColorBridge {integer});
    procedure SetDropListBackgroundColor(_color: TARGBColorBridge {integer});
    procedure SetLastItemAsPrompt(_hasPrompt: boolean);
    function GetSize(): integer;
    procedure Delete(_index: integer);
    procedure SetSelection(_index: integer);
    procedure SetItem(_index: integer; _item: string);

    property jParent: jObject  read  FjPRLayout write SetjParent; // Java : Parent Relative Layout

    procedure GenEvent_OnSpinnerItemSeleceted(Obj: TObject; caption: string; position: integer);
 published

    property Items: TStrings read FItems write SetItems;
    property OnItemSelected: TOnItemSelected  read FOnItemSelected write FOnItemSelected;

    property Visible: boolean read FVisible write SetVisible;
    property BackgroundColor: TARGBColorBridge read FColor write SetColor;
    property SelectedFontColor: TARGBColorBridge  read FSelectedFontColor write SetSelectedFontColor;
    property DropListTextColor: TARGBColorBridge read FDropListTextColor write SetDropListTextColor;
    property DropListBackgroundColor: TARGBColorBridge  read FDropListBackgroundColor write SetDropListBackgroundColor;
    property LastItemAsPrompt: boolean read FLastItemAsPrompt write SetLastItemAsPrompt;
end;

function jSpinner_jCreate(env: PJNIEnv; this: JObject;_Self: int64): jObject;
procedure jSpinner_jFree(env: PJNIEnv; this: JObject; _jspinner: JObject);
procedure jSpinner_SetjParent(env: PJNIEnv; this: JObject; _jspinner: JObject; _viewgroup: jObject);
procedure jSpinner_SetLParamWidth(env: PJNIEnv; this: JObject; _jspinner: JObject; _w: integer);
procedure jSpinner_SetLParamHeight(env: PJNIEnv; this: JObject; _jspinner: JObject; _h: integer);
procedure jSpinner_SetLeftTopRightBottomWidthHeight(env: PJNIEnv; this: JObject; _jspinner: JObject; _left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
procedure jSpinner_AddLParamsAnchorRule(env: PJNIEnv; this: JObject; _jspinner: JObject; _rule: integer);
procedure jSpinner_AddLParamsParentRule(env: PJNIEnv; this: JObject; _jspinner: JObject; _rule: integer);
procedure jSpinner_SetLayoutAll(env: PJNIEnv; this: JObject; _jspinner: JObject; _idAnchor: integer);
procedure jSpinner_SetId(env: PJNIEnv; this: JObject; _jspinner: JObject; _id: integer);
function jSpinner_GetSelectedItemPosition(env: PJNIEnv; this: JObject; _jspinner: JObject): integer;
function jSpinner_GetSelectedItem(env: PJNIEnv; this: JObject; _jspinner: JObject): string;
procedure jSpinner_Add(env: PJNIEnv; this: JObject; _jspinner: JObject; _item: string);
procedure jSpinner_SetSelectedTextColor(env: PJNIEnv; this: JObject; _jspinner: JObject; _color: integer);
procedure jSpinner_SetDropListTextColor(env: PJNIEnv; this: JObject; _jspinner: JObject; _color: integer);
procedure jSpinner_SetDropListBackgroundColor(env: PJNIEnv; this: JObject; _jspinner: JObject; _color: integer);
procedure jSpinner_SetLastItemAsPrompt(env: PJNIEnv; this: JObject; _jspinner: JObject; _hasPrompt: boolean);
function jSpinner_GetSize(env: PJNIEnv; this: JObject; _jspinner: JObject): integer;
procedure jSpinner_Delete(env: PJNIEnv; this: JObject; _jspinner: JObject; _index: integer);
procedure jSpinner_SetSelection(env: PJNIEnv; this: JObject; _jspinner: JObject; _index: integer);
procedure jSpinner_SetItem(env: PJNIEnv; this: JObject; _jspinner: JObject; _index: integer; _item: string);


implementation

uses
  customdialog;

{---------  jSpinner  --------------}

constructor jSpinner.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMarginLeft   := 5;
  FMarginTop    := 10;
  FMarginBottom := 10;
  FMarginRight  := 5;
  FLParamWidth  := lpMatchParent;  //lpWrapContent
  FLParamHeight := lpWrapContent; //lpMatchParent
  //your code here....
  FItems:= TStringList.Create;
  FSelectedFontColor:= colbrDefault;
  FDropListTextColor:=  colbrDefault;
  FDropListBackgroundColor:=  colbrDefault;
  FLastItemAsPrompt:= False;
end;

destructor jSpinner.Destroy;
begin
  if not (csDesigning in ComponentState) then
  begin
    if jForm(Owner).App <> nil then
    begin
      if jForm(Owner).App.Initialized then
      begin
        if FjObject  <> nil then
        begin
           jFree();
           FjObject := nil;
        end;
      end;
    end;
  end;
  //you others free code here...'
  FItems.Free;
  inherited Destroy;
end;

procedure jSpinner.Init(refApp: jApp);
var
  rToP: TPositionRelativeToParent;
  rToA: TPositionRelativeToAnchorID;
  i: integer;
begin
  if FInitialized  then Exit;
  inherited Init(refApp);      //  <<--  FjPRLayout:= jForm.view [default]!
  //your code here: set/initialize create params....
  FjObject := jCreate();
  FInitialized:= True;

  if FParent <> nil then
  begin
    if FParent is jPanel then
    begin
      jPanel(FParent).Init(refApp);
      FjPRLayout:= jPanel(FParent).View;
    end;
    if FParent is jScrollView then
    begin
      jScrollView(FParent).Init(refApp);
      FjPRLayout:= jScrollView(FParent).View;
    end;
  end;
  if FParent is jCustomDialog then
  begin
    jCustomDialog(FParent).Init(refApp);
    FjPRLayout:= jCustomDialog(FParent).View;
  end;
  jSpinner_SetjParent(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , FjPRLayout);
  jSpinner_SetId(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , Self.Id);
  jSpinner_SetLeftTopRightBottomWidthHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject ,
                        FMarginLeft,FMarginTop,FMarginRight,FMarginBottom,
                        GetLayoutParams(gApp, FLParamWidth, sdW),
                        GetLayoutParams(gApp, FLParamHeight, sdH));

  if FParent is jPanel then
  begin
     Self.UpdateLayout;
  end;

  for rToA := raAbove to raAlignRight do
  begin
    if rToA in FPositionRelativeToAnchor then
    begin
      jSpinner_AddlParamsAnchorRule(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetPositionRelativeToAnchor(rToA));
    end;
  end;
  for rToP := rpBottom to rpCenterVertical do
  begin
    if rToP in FPositionRelativeToParent then
    begin
      jSpinner_AddlParamsParentRule(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetPositionRelativeToParent(rToP));
    end;
  end;

  if Self.Anchor <> nil then Self.AnchorId:= Self.Anchor.Id
  else Self.AnchorId:= -1;

  jSpinner_setLayoutAll(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , Self.AnchorId);

  if  FColor <> colbrDefault then
    jView_SetBackGroundColor(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetARGB(FColor));

  if FSelectedFontColor <> colbrDefault then
     Self.SetSelectedTextColor(GetARGB(FSelectedFontColor))
  else
     Self.SetSelectedTextColor(GetARGB(colbrSilver));

  if FDropListTextColor <> colbrDefault then self.SetDropListTextColor(FDropListTextColor);
  if FDropListBackgroundColor <> colbrDefault then  Self.SetDropListBackgroundColor(FDropListBackgroundColor);

  for i:= 0 to FItems.Count-1 do
  begin
    Self.Add(FItems.Strings[i]);
  end;

  if (FLastItemAsPrompt) then Self.SetLastItemAsPrompt(FLastItemAsPrompt);

  jView_SetVisible(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , FVisible);
end;

procedure jSpinner.SetColor(Value: TARGBColorBridge);
begin
  FColor:= Value;
  if (FInitialized = True) and (FColor <> colbrDefault)  then
    jView_SetBackGroundColor(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetARGB(FColor));
end;

procedure jSpinner.SetVisible(Value : Boolean);
begin
  FVisible:= Value;
  if FInitialized then
  jView_SetVisible(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , FVisible);
end;

{
procedure jSpinner.UpdateLParamWidth;
var
  side: TSide;
begin
  if FInitialized then
  begin
    if jForm(Owner).Orientation = jForm(Owner).App.Orientation then
      side:= sdW
    else
      side:= sdH;
    jSpinner_SetLParamWidth(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamWidth, side));
  end;
end;

procedure jSpinner.UpdateLParamHeight;
var
  side: TSide;
begin
  if FInitialized then
  begin
    if jForm(Owner).Orientation = gApp.Orientation then
      side:= sdH
    else
      side:= sdW;
    jSpinner_SetLParamHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamHeight, side));
  end;
end;
}

procedure jSpinner.UpdateLParamWidth;
var
  side: TSide;
begin
  if FInitialized then
  begin
    if Self.Parent is jForm then
    begin
      if jForm(Owner).Orientation = gApp.Orientation then side:= sdW else side:= sdH;
      jSpinner_SetLParamWidth(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamWidth, side));
    end
    else
    begin
      if (Self.Parent as jVisualControl).LayoutParamWidth = lpMatchParent then
        jSpinner_SetLParamWidth(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamWidth, sdW))
      else if (Self.Parent as jVisualControl).LayoutParamWidth = lpWrapContent then
        jSpinner_SetLParamWidth(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamWidth, sdW))
      else
        jSpinner_SetLParamWidth(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParamsByParent(Self.Parent, FLParamWidth, sdW))
    end;
  end;
end;

procedure jSpinner.UpdateLParamHeight;
var
  side: TSide;
begin
  if FInitialized then
  begin
    if Self.Parent is jForm then
    begin
      if jForm(Owner).Orientation = gApp.Orientation then side:= sdH else side:= sdW;
      jSpinner_SetLParamHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamHeight, side));
    end
    else
    begin
      if (Self.Parent as jVisualControl).LayoutParamHeight = lpMatchParent then
        jSpinner_SetLParamHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamHeight, sdH))
      else if (Self.Parent as jVisualControl).LayoutParamHeight = lpWrapContent then
        jSpinner_SetLParamHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParams(gApp, FLParamHeight, sdH))
      else
        jSpinner_SetLParamHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetLayoutParamsByParent(Self.Parent, FLParamHeight, sdH))
    end;
  end;
end;

procedure jSpinner.UpdateLayout;
begin
  inherited UpdateLayout;
  UpdateLParamWidth;
  UpdateLParamHeight;
  jSpinner_SetLayoutAll(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , Self.AnchorId);
end;

procedure jSpinner.Refresh;
begin
  if FInitialized then
    jView_Invalidate(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject );
end;

function jSpinner.jCreate(): jObject;
begin
   Result:= jSpinner_jCreate(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis , int64(Self));
end;

procedure jSpinner.jFree();
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_jFree(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject );
end;

procedure jSpinner.SetjParent(_viewgroup: jObject);
begin
  //in designing component state: set value here...
  FjPRLayout:= _viewgroup;
  if FInitialized then
     jSpinner_SetjParent(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _viewgroup);
end;

procedure jSpinner.SetLParamWidth(_w: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetLParamWidth(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _w);
end;

procedure jSpinner.SetLParamHeight(_h: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetLParamHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _h);
end;

procedure jSpinner.SetLeftTopRightBottomWidthHeight(_left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetLeftTopRightBottomWidthHeight(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _left ,_top ,_right ,_bottom ,_w ,_h);
end;

procedure jSpinner.AddLParamsAnchorRule(_rule: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_AddLParamsAnchorRule(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _rule);
end;

procedure jSpinner.AddLParamsParentRule(_rule: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_AddLParamsParentRule(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _rule);
end;

procedure jSpinner.SetLayoutAll(_idAnchor: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetLayoutAll(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _idAnchor);
end;

procedure jSpinner.SetId(_id: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetId(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _id);
end;

function jSpinner.GetSelectedItemPosition(): integer;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jSpinner_GetSelectedItemPosition(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject );
end;

function jSpinner.GetSelectedItem(): string;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jSpinner_GetSelectedItem(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject );
end;

procedure jSpinner.Add(_item: string);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_Add(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _item);
end;

procedure jSpinner.SetSelectedTextColor(_color: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetSelectedTextColor(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _color);
end;

procedure jSpinner.SetDropListTextColor(_color: TARGBColorBridge{integer});
begin
  //in designing component state: set value here...
  FDropListTextColor:= _color;
  if FInitialized then
     jSpinner_SetDropListTextColor(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetARGB(_color));
end;

procedure jSpinner.SetDropListBackgroundColor(_color: TARGBColorBridge{integer});
begin
  //in designing component state: set value here...
  FDropListBackgroundColor:= _color;
  if FInitialized then
     jSpinner_SetDropListBackgroundColor(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , GetARGB(_color));
end;

procedure jSpinner.SetLastItemAsPrompt(_hasPrompt: boolean);
begin
  //in designing component state: set value here...
  FLastItemAsPrompt:= _hasPrompt;
  if FInitialized then
     jSpinner_SetLastItemAsPrompt(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _hasPrompt);
end;

function jSpinner.GetSize(): integer;
begin
  //in designing component state: result value here...
  if FInitialized then
   Result:= jSpinner_GetSize(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject );
end;

procedure jSpinner.Delete(_index: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_Delete(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _index);
end;

procedure jSpinner.SetSelection(_index: integer);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetSelection(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _index);
end;

procedure jSpinner.SetItem(_index: integer; _item: string);
begin
  //in designing component state: set value here...
  if FInitialized then
     jSpinner_SetItem(jForm(Owner).App.Jni.jEnv, jForm(Owner).App.Jni.jThis, FjObject , _index ,_item);
end;

procedure jSpinner.SetItems(Value: TStrings);
begin
  FItems.Assign(Value);
end;


procedure jSpinner.GenEvent_OnSpinnerItemSeleceted(Obj: TObject; caption: string; position: integer);
begin
   if Assigned(FOnItemSelected) then FOnItemSelected(Obj, caption, position);
end;

Procedure jSpinner.SetSelectedFontColor(Value: TARGBColorBridge);
begin
  FSelectedFontColor:= Value;
  if (FInitialized = True) and (FFontColor <> colbrDefault) then
    SetSelectedTextColor(GetARGB(FSelectedFontColor));
end;

{-------- jSpinner_JNI_Bridge ----------}

function jSpinner_jCreate(env: PJNIEnv; this: JObject;_Self: int64): jObject;
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].j:= _Self;
  jCls:= Get_gjClass(env);
  jMethod:= env^.GetMethodID(env, jCls, 'jSpinner_jCreate', '(J)Ljava/lang/Object;');
  Result:= env^.CallObjectMethodA(env, this, jMethod, @jParams);
  Result:= env^.NewGlobalRef(env, Result);
end;

(*
//Please, you need insert:

   public java.lang.Object jSpinner_jCreate(long _Self) {
      return (java.lang.Object)(new jSpinner(this,_Self));
   }

//to end of "public class Controls" in "Controls.java"
*)


procedure jSpinner_jFree(env: PJNIEnv; this: JObject; _jspinner: JObject);
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'jFree', '()V');
  env^.CallVoidMethod(env, _jspinner, jMethod);
end;


procedure jSpinner_SetjParent(env: PJNIEnv; this: JObject; _jspinner: JObject; _viewgroup: jObject);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].l:= _viewgroup;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetjParent', '(Landroid/view/ViewGroup;)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetLParamWidth(env: PJNIEnv; this: JObject; _jspinner: JObject; _w: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _w;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLParamWidth', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetLParamHeight(env: PJNIEnv; this: JObject; _jspinner: JObject; _h: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _h;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLParamHeight', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetLeftTopRightBottomWidthHeight(env: PJNIEnv; this: JObject; _jspinner: JObject; _left: integer; _top: integer; _right: integer; _bottom: integer; _w: integer; _h: integer);
var
  jParams: array[0..5] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _left;
  jParams[1].i:= _top;
  jParams[2].i:= _right;
  jParams[3].i:= _bottom;
  jParams[4].i:= _w;
  jParams[5].i:= _h;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLeftTopRightBottomWidthHeight', '(IIIIII)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_AddLParamsAnchorRule(env: PJNIEnv; this: JObject; _jspinner: JObject; _rule: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _rule;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'AddLParamsAnchorRule', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_AddLParamsParentRule(env: PJNIEnv; this: JObject; _jspinner: JObject; _rule: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _rule;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'AddLParamsParentRule', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetLayoutAll(env: PJNIEnv; this: JObject; _jspinner: JObject; _idAnchor: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _idAnchor;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLayoutAll', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetId(env: PJNIEnv; this: JObject; _jspinner: JObject; _id: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _id;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetId', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


function jSpinner_GetSelectedItemPosition(env: PJNIEnv; this: JObject; _jspinner: JObject): integer;
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'GetSelectedItemPosition', '()I');
  Result:= env^.CallIntMethod(env, _jspinner, jMethod);
end;


function jSpinner_getSelectedItem(env: PJNIEnv; this: JObject; _jspinner: JObject): string;
var
  jStr: JString;
  jBoo: JBoolean;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'GetSelectedItem', '()Ljava/lang/String;');
  jStr:= env^.CallObjectMethod(env, _jspinner, jMethod);
  case jStr = nil of
     True : Result:= '';
     False: begin
              jBoo:= JNI_False;
              Result:= string( env^.GetStringUTFChars(env, jStr, @jBoo));
            end;
  end;
end;

procedure jSpinner_Add(env: PJNIEnv; this: JObject; _jspinner: JObject; _item: string);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].l:= env^.NewStringUTF(env, PChar(_item));
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'Add', '(Ljava/lang/String;)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
  env^.DeleteLocalRef(env,jParams[0].l);
  env^.DeleteLocalRef(env,jCls);
end;


procedure jSpinner_SetSelectedTextColor(env: PJNIEnv; this: JObject; _jspinner: JObject; _color: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _color;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetSelectedTextColor', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetDropListTextColor(env: PJNIEnv; this: JObject; _jspinner: JObject; _color: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _color;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetDropListTextColor', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;

procedure jSpinner_SetDropListBackgroundColor(env: PJNIEnv; this: JObject; _jspinner: JObject; _color: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _color;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetDropListBackgroundColor', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetLastItemAsPrompt(env: PJNIEnv; this: JObject; _jspinner: JObject; _hasPrompt: boolean);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].z:= JBool(_hasPrompt);
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetLastItemAsPrompt', '(Z)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


function jSpinner_GetSize(env: PJNIEnv; this: JObject; _jspinner: JObject): integer;
var
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'GetSize', '()I');
  Result:= env^.CallIntMethod(env, _jspinner, jMethod);
end;


procedure jSpinner_Delete(env: PJNIEnv; this: JObject; _jspinner: JObject; _index: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _index;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'Delete', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;


procedure jSpinner_SetSelection(env: PJNIEnv; this: JObject; _jspinner: JObject; _index: integer);
var
  jParams: array[0..0] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _index;
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetSelection', '(I)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
end;

procedure jSpinner_SetItem(env: PJNIEnv; this: JObject; _jspinner: JObject; _index: integer; _item: string);
var
  jParams: array[0..1] of jValue;
  jMethod: jMethodID=nil;
  jCls: jClass=nil;
begin
  jParams[0].i:= _index;
  jParams[1].l:= env^.NewStringUTF(env, PChar(_item));
  jCls:= env^.GetObjectClass(env, _jspinner);
  jMethod:= env^.GetMethodID(env, jCls, 'SetItem', '(ILjava/lang/String;)V');
  env^.CallVoidMethodA(env, _jspinner, jMethod, @jParams);
  env^.DeleteLocalRef(env,jParams[1].l);
end;

end.