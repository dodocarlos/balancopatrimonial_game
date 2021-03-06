unit fFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormPrincipal = class(TForm)
    lstCreditos: TListBox;
    lstDebitos: TListBox;
    lstGeral: TListBox;
    pnlRodape: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblTotal: TStaticText;
    lblTotalDebitos: TStaticText;
    lblTotalCreditos: TStaticText;
    btnValidar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

end.
