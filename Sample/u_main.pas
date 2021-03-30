unit u_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_teztranslate, Vcl.StdCtrls, Vcl.Menus;

type
  TF_main = class(TForm)
    EzTranslate1: TEzTranslate;
    btnPortuguese: TButton;
    lblWellcome: TLabel;
    btnEnglish: TButton;
    btnSpanish: TButton;
    memMessage: TMemo;
    btnMessage1: TButton;
    btnMessage2: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    About1: TMenuItem;
    btnSeccondForm: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMessage1Click(Sender: TObject);
    procedure btnMessage2Click(Sender: TObject);
    procedure btnPortugueseClick(Sender: TObject);
    procedure btnEnglishClick(Sender: TObject);
    procedure btnSpanishClick(Sender: TObject);
    procedure btnSeccondFormClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_main: TF_main;

implementation

{$R *.dfm}

uses u_other, u_about;

procedure TF_main.About1Click(Sender: TObject);
begin
  EzTranslate1.ShowAbout;
end;

procedure TF_main.btnEnglishClick(Sender: TObject);
begin
  EzTranslate1.LoadTranslate(ExtractFilePath(ParamStr(0)) + 'Lang\English.lng');
end;

procedure TF_main.btnMessage1Click(Sender: TObject);
begin
  Showmessage(EzTranslate1.LoadValue('Message1'));
end;

procedure TF_main.btnMessage2Click(Sender: TObject);
begin
  Showmessage(EzTranslate1.LoadValue('Message2'));
end;

procedure TF_main.btnPortugueseClick(Sender: TObject);
begin
  EzTranslate1.LoadTranslate(ExtractFilePath(ParamStr(0)) + 'Lang\Portuguese.lng');
end;

procedure TF_main.btnSeccondFormClick(Sender: TObject);
begin
  f_other := Tf_other.Create(Self);
  f_other.ShowModal;
end;

procedure TF_main.btnSpanishClick(Sender: TObject);
begin
  EzTranslate1.LoadTranslate(ExtractFilePath(ParamStr(0)) + 'Lang\Spanish.lng');
end;

procedure TF_main.FormCreate(Sender: TObject);
begin
  btnPortuguese.Click;
end;

end.
