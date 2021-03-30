unit u_register;

interface
uses
 Classes, Dialogs, Clipbrd, TypInfo, SysUtils,
 {$IFDEF VER130}
   dsgnintf;
 {$ELSE}
   DesignIntf, DesignEditors{,DesignMenus};
 {$ENDIF}

 Type
  TEzTranslateEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): String; override;
    function GetVerbCount: Integer; override;
  end;

  Type
  TAboutVarProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
    function GetValue: String; override;
  end;

procedure Register;

implementation

{ TEzTranslate }

uses u_teztranslate, u_about;

Procedure Register;
Begin
  RegisterPropertyEditor(TypeInfo(TAboutVar), TEzTranslate, 'About', TAboutVarProperty);
  RegisterComponentEditor(TEzTranslate, TEzTranslateEditor);
  RegisterComponents('DSolutions', [TEzTranslate]);
End;

procedure TEzTranslateEditor.ExecuteVerb(Index: Integer);
var
  sClip : String;
  i     : integer;
begin
  inherited;
  case Index of
    0: Begin
         sClip := '[' + Component.Owner.Name + ']' + #13#10 + 'Caption=' + QuotedStr(GetPropValue(Component.Owner, 'Caption'));
         for I := 0 to Component.Owner.ComponentCount -1 do
         Begin
           if (IsPublishedProp(Component.Owner.Components[i], 'Caption')) then
             sClip := sClip + #13#10 + Component.Owner.Components[i].Name + '=' + QuotedStr(GetPropValue(Component.Owner.Components[i], 'Caption'))
           else if (IsPublishedProp(Component.Owner.Components[i], 'Text')) then
             sClip := sClip + #13#10 + Component.Owner.Components[i].Name + '=' + QuotedStr(GetPropValue(Component.Owner.Components[i], 'Text'))
           else if (IsPublishedProp(Component.Owner.Components[i], 'Lines')) then
             sClip := sClip + #13#10 + Component.Owner.Components[i].Name + '=' + QuotedStr(StringReplace(TStrings(GetObjectProp(Component.Owner.Components[i], 'Lines', Tstrings)).Text, #13#10, '[#13#10]', [rfReplaceAll]));

           if (IsPublishedProp(Component.Owner.Components[i], 'Hint')) and (Trim(GetPropValue(Component.Owner.Components[i], 'Hint')) <> '') then
             sClip := sClip + #13#10 + 'h_' + Component.Owner.Components[i].Name + '=' + QuotedStr(GetPropValue(Component.Owner.Components[i], 'Hint'));
         End;

         Clipboard.SetTextBuf(pWideChar(sClip));
         showMessage('The mapped content was copied to the clipboard, copy and paste into a language file.');
       End;

  end;
end;

function TEzTranslateEditor.GetVerb(Index: Integer): String;
begin
  case Index of
    0: Result := '&Map This Form ( EzTranslate )';
  end;
end;

function TEzTranslateEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;


{ TAboutVarProperty }

procedure TAboutVarProperty.Edit;
begin
  inherited;
  with Tf_about.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

function TAboutVarProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TAboutVarProperty.GetValue: String;
begin
  Result := 'Ver. ' + '1.0';
end;

end.
