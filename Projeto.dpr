program Projeto;

uses
  Vcl.Forms,
  FormInicializar in 'FormInicializar.pas' {Form1};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
  Application.Terminate;
end.
