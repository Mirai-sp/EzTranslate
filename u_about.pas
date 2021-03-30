unit u_about;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, ShellApi;

type
  Tf_about = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    lblGit: TLabel;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblGitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_about: Tf_about;

implementation

{$R *.dfm}

procedure Tf_about.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  := caFree;
  f_about := nil;
end;

procedure Tf_about.lblGitClick(Sender: TObject);
begin
  ShellExecute(handle,'open',PChar('https://github.com/Mirai-sp/'), '','',SW_SHOWNORMAL)
end;

end.
