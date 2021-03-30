program Sample;

uses
  Vcl.Forms,
  u_main in 'u_main.pas' {F_main},
  u_other in 'u_other.pas' {f_other};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_main, F_main);
  Application.Run;
end.
