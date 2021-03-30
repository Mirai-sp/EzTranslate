unit u_teztranslate;

interface

uses
  Classes, Dialogs, SysUtils, IniFiles, Typinfo;

Type
  TAboutVar = String;
  TEzTranslate = class(TComponent)
  const SectionName = 'Messages';
  private
    sTranslateFile : string;
    FAbout         : TAboutVar;
    Function LoadIni(FileName : String) : TIniFile;
  public
    Procedure ShowAbout;
    procedure LoadTranslate(FileName : String); Overload;
    procedure LoadTranslate; Overload;
    Function LoadValue(Value : String; Section : String = SectionName; DefaultValue : String = '') : string; Overload;
    Function LoadValue(FileName, Value : String; Section : String = SectionName; DefaultValue : String = '') : string; Overload;
    Function GetTranslateFileName : string;
  Published
    property TranslationFileName : string read sTranslateFile write sTranslateFile;
    Property About : TAboutVar read FAbout write FAbout;

  end;

implementation

{ TEzTranslate }

uses u_about;

function TEzTranslate.GetTranslateFileName: string;
begin
  result := sTranslateFile;
end;

function TEzTranslate.LoadIni(FileName : String): TIniFile;
begin
  if (Trim(FileName) = '') then
  Begin
    ShowMessage('The translation file was not loaded');
    Abort;
  End;

  if (not FileExists(FileName)) then
  Begin
    ShowMessage('The specified translation file directory is invalid.');
    Abort;
  End;

  try
    Result := TIniFile.Create(FileName);
  Except on E: Exception Do Begin
     Showmessage('An error has occurred.' + #13#10 + 'Err: ' + E.Message);
     Abort;
  End;
  end;
end;

function TEzTranslate.LoadValue(FileName, Value: String; Section : String = SectionName; DefaultValue : String = '') : string;
begin
  with LoadIni(FileName) do
  Begin
    {$IF CompilerVersion >= 14.0}
      Result := UTF8Decode(ReadString(Section, Value, DefaultValue));
    {$ELSE}
      Result := ReadString(Section, Value, DefaultValue);
    {$IFEND}
    Free;
  End;
end;

procedure TEzTranslate.ShowAbout;
begin
  f_about := Tf_about.Create(Self);
  f_about.ShowModal;
end;

function TEzTranslate.LoadValue(Value : String; Section : String = SectionName; DefaultValue : String = '') : string;
begin
  result := LoadValue(sTranslateFile, Value, Section, DefaultValue);
end;

procedure TEzTranslate.LoadTranslate;
begin
  LoadTranslate(sTranslateFile);
end;

procedure TEzTranslate.LoadTranslate(FileName: String);
var
  Ini  : TIniFile;
  i    : Integer;
  sObj : TStrings;
begin
  Ini            := LoadIni(FileName);
  sTranslateFile := FileName;
  {$IF CompilerVersion >= 14.0}
    if (IsPublishedProp(Owner, 'Caption')) and (Trim(UTF8Decode(Ini.ReadString(Owner.Name, 'caption', ''))) <> '') then
      SetPropValue (Owner, 'Caption', Trim(UTF8Decode(Ini.ReadString(Owner.Name, 'caption', ''))));
  {$ELSE}
    if (IsPublishedProp(Owner, 'Caption')) and (Trim(Ini.ReadString(Owner.Name, 'caption', '')) <> '') then
      SetPropValue (Owner, 'Caption', Trim(Ini.ReadString(Owner.Name, 'caption', '')));
  {$IFEND}

  for I := 0 to Owner.ComponentCount - 1 do
  Begin
    {$IF CompilerVersion >= 14.0}
      if (IsPublishedProp(Owner.Components[i], 'Caption'))  and (Trim(UTF8Decode(Ini.ReadString(Owner.Name,  Owner.Components[i].Name, ''))) <> '') then
        SetPropValue (Owner.Components[i], 'Caption', Trim(UTF8Decode(Ini.ReadString(Owner.Name, Owner.Components[i].Name, ''))))

      else if (IsPublishedProp(Owner.Components[i], 'Text'))     and (Trim(UTF8Decode(Ini.ReadString(Owner.Name, Owner.Components[i].Name, ''))) <> '') then
        SetPropValue (Owner.Components[i], 'Text',    Trim(UTF8Decode(Ini.ReadString(Owner.Name, Owner.Components[i].Name, ''))))

      else if (IsPublishedProp(Owner.Components[i], 'Lines'))    and (GetObjectProp(Owner.Components[i], 'Lines') is TStrings) and (Trim(UTF8Decode(Ini.ReadString(Owner.Name, Owner.Components[i].Name, ''))) <> '') then
        TStrings(GetObjectProp(Owner.Components[i], 'Lines', TStrings)).Text := Trim(UTF8Decode(StringReplace(Ini.ReadString(Owner.Name, Owner.Components[i].Name, ''), '[#13#10]', #13#10, [rfReplaceAll])));

      if (IsPublishedProp(Owner.Components[i], 'Hint'))     and (Trim(UTF8Decode(Ini.ReadString(Owner.Name, 'h_' + Owner.Components[i].Name, ''))) <> '') then
        SetPropValue (Owner.Components[i], 'Hint',    Trim(UTF8Decode(Ini.ReadString(Owner.Name, 'h_' + Owner.Components[i].Name, ''))));
    {$ELSE}
      if (IsPublishedProp(Owner.Components[i], 'Caption'))  and (Trim(Ini.ReadString(Owner.Name, Owner.Components[i].Name, '')) <> '') then
        SetPropValue (Owner.Components[i], 'Caption', Trim(Ini.ReadString(Owner.Name, Owner.Components[i].Name, '')))

      else if (IsPublishedProp(Owner.Components[i], 'Text'))     and (Trim(Ini.ReadString(Owner.Name, Owner.Components[i].Name, '')) <> '') then
        SetPropValue (Owner.Components[i], 'Text',    Trim(Ini.ReadString(Owner.Name, Owner.Components[i].Name, '')))

      else if (IsPublishedProp(Owner.Components[i], 'Lines'))    and (GetObjectProp(Owner.Components[i], 'Lines') is TStrings) and (Trim(Ini.ReadString(Owner.Name, Owner.Components[i].Name, '')) <> '') then
        TStrings(GetObjectProp(Owner.Components[i], 'Lines', TStrings)).Text := Trim(StringReplace(Ini.ReadString(Owner.Name, Owner.Components[i].Name, ''), '[#13#10]', #13#10, [rfReplaceAll]));

      if (IsPublishedProp(Owner.Components[i], 'Hint'))     and (Trim(Ini.ReadString(Owner.Name, 'h_' + Owner.Components[i].Name, '')) <> '') then
        SetPropValue (Owner.Components[i], 'Hint',    Trim(Ini.ReadString(Owner.Name, 'h_' + Owner.Components[i].Name, '')));
    {$IFEND}
  End;
  FreeAndNil(Ini)
end;

end.
