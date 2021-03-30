unit u_other;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, u_teztranslate;

type
  Tf_other = class(TForm)
    EzTranslate1: TEzTranslate;
    lblSample: TLabel;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_other: Tf_other;

implementation

{$R *.dfm}

uses u_main;

procedure Tf_other.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  := caFree;
  f_other := nil;
end;

procedure Tf_other.FormCreate(Sender: TObject);
begin
  ezTranslate1.LoadTranslate(f_main.EzTranslate1.GetTranslateFileName)
end;

end.
