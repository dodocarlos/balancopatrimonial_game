unit iFormPrincipal;

interface

uses
  fFormPrincipal,
  Vcl.Controls,
  Vcl.StdCtrls;

type
  TIFormPrincipal = class
  private
    fFrmPrincipal : TFormPrincipal;

    procedure plAdicionaValores;
    procedure plCriaForm;
    procedure plLigaEventos;

    //Eventos
    procedure plOnDragOverListBox(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure plOnDragDropListBox(Sender, Source: TObject; X, Y: Integer);

  public
    procedure Executa;
  end;

  procedure FormPrincipal_AbreTela;

implementation

uses
  SysUtils,
  System.Math,
  PlanoContasItem,
  Vcl.Graphics;

procedure FormPrincipal_AbreTela;
var
  loFuncao : TIFormPrincipal;
begin
  loFuncao := TIFormPrincipal.Create;
  try
    loFuncao.Executa;
  finally
    FreeAndNil(loFuncao);
  end;
end;


{ TFormPrincipal }

procedure TIFormPrincipal.Executa;
begin
  plCriaForm;
  fFrmPrincipal.ShowModal;
end;

procedure TIFormPrincipal.plAdicionaValores;
begin
  fFrmPrincipal.lstGeral.AddItem('Contas a pagar - R$1000', TPlanoContasItem.Create(ttpciCredito, 1000));
  fFrmPrincipal.lstGeral.AddItem('Contas a receber - R$1000', TPlanoContasItem.Create(ttpciDebito, 1000));
end;

procedure TIFormPrincipal.plCriaForm;
begin
  if   not Assigned(fFrmPrincipal) then
       fFrmPrincipal := TFormPrincipal.Create(nil);

  plAdicionaValores;
  plLigaEventos;
end;

procedure TIFormPrincipal.plLigaEventos;
begin
  fFrmPrincipal.lstGeral.OnDragDrop := plOnDragDropListBox;
  fFrmPrincipal.lstGeral.OnDragOver := plOnDragOverListBox;

  fFrmPrincipal.lstCreditos.OnDragDrop := plOnDragDropListBox;
  fFrmPrincipal.lstCreditos.OnDragOver := plOnDragOverListBox;

  fFrmPrincipal.lstDebitos.OnDragDrop := plOnDragDropListBox;
  fFrmPrincipal.lstDebitos.OnDragOver := plOnDragOverListBox;
end;

procedure TIFormPrincipal.plOnDragDropListBox(Sender, Source: TObject; X,
  Y: Integer);
var
  lbSender, lbSoure : TListBox;
  loPlanoContasItem : TPlanoContasItem;
begin
  lbSender := TListBox(Sender);
  lbSoure  := TListBox(Source);

  if   (lbSoure.ItemIndex <> -1) then
        begin
          loPlanoContasItem := TPlanoContasItem(lbSoure.Items.Objects[lbSoure.ItemIndex]);
          lbSender.Items.AddObject(lbSoure.Items[lbSoure.ItemIndex], loPlanoContasItem);
          lbSoure.Items.Delete(lbSoure.ItemIndex);

          case lbSender.Tag of
            1: fFrmPrincipal.lblTotalDebitos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalDebitos.Caption) + loPlanoContasItem.Quantidade);
            2: fFrmPrincipal.lblTotalCreditos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalCreditos.Caption) + loPlanoContasItem.Quantidade);
          end;

          case lbSoure.Tag of
            1: fFrmPrincipal.lblTotalDebitos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalDebitos.Caption) - loPlanoContasItem.Quantidade);
            2: fFrmPrincipal.lblTotalCreditos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalCreditos.Caption) - loPlanoContasItem.Quantidade);
          end;

          fFrmPrincipal.lblTotal.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalDebitos.Caption) - StrToInt(fFrmPrincipal.lblTotalCreditos.Caption));
          if   StrToInt(fFrmPrincipal.lblTotal.Caption) < 0 then
               fFrmPrincipal.lblTotal.Font.Color := clRed
          else
               fFrmPrincipal.lblTotal.Font.Color := clBlack;
        end;
end;

procedure TIFormPrincipal.plOnDragOverListBox(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Sender <> Source;
end;

end.