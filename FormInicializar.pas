unit FormInicializar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  iFormPrincipal;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  leDificuldade : TDificuldade;
begin
  if   RadioButton1.Checked then
       leDificuldade := tdFacil
  else
       if   RadioButton2.Checked then
            leDificuldade := tdMedio
       else
            leDificuldade := tdDificil;

  FormPrincipal_AbreTela(leDificuldade);
end;

end.
