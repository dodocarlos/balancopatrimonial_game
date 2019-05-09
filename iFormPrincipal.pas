unit iFormPrincipal;

interface

uses
  fFormPrincipal,
  Vcl.Controls,
  Vcl.StdCtrls;

type
  TTipoLancamento = (ttlContasAPagar, ttlContasAReceber,
                     ttlCaixa, ttlVeiculos, ttlEstoque,
                     ttlFornecedores, ttlSalariosAPagar,
                     ttlCapitalSocial, ttlEmprestimos);

  TIFormPrincipal = class
  private
    fFrmPrincipal : TFormPrincipal;

    procedure plAdicionaValores;
    procedure plCriaForm;
    procedure plLigaEventos;
    procedure plValidaDados;

    //Eventos
    procedure plOnDragOverListBox(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure plOnDragDropListBox(Sender, Source: TObject; X, Y: Integer);
    procedure plOnClickBtnValidar(Sender : TObject);

  public
    procedure Executa;
  end;

  procedure FormPrincipal_AbreTela;

const
  STR_EXIBICAO_LANCAMENTO = '%s - R$%d';

  TTipoLancamentoAtivo   = [ttlContasAReceber, ttlCaixa, ttlVeiculos, ttlEstoque];
  TTipoLancamentoPassivo = [ttlContasAPagar, ttlFornecedores, ttlSalariosAPagar, ttlCapitalSocial, ttlEmprestimos];
  TDescTipoLancamento: array of String = ['Contas a pagar', 'Contas a receber', 'Caixa', 'Veiculos', 'Estoque',
                                            'Fornecedores', 'Salarios a pagar', 'Capital Social', 'Emprestimos'];
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
var
  liMaximoBalanco : Integer;
  ldRazaoLancamento : Double;

  procedure GeraValoresLancamentosAtivos;
  var
    loTipoLancamento  : TTipoLancamento;
    liValorLancamento,
    liLancamentoRestante : Integer;
  begin
    liLancamentoRestante := liMaximoBalanco;

    for loTipoLancamento in TTipoLancamentoAtivo do
        if   (liMaximoBalanco > 0) then
             begin
               liValorLancamento := RandomRange(50, Round(liMaximoBalanco * ldRazaoLancamento));

               if   (liValorLancamento > liLancamentoRestante) then
                    liValorLancamento := liLancamentoRestante;

               if   not (liValorLancamento > 0) then
                    Exit;

               fFrmPrincipal.lstGeral.AddItem(Format(STR_EXIBICAO_LANCAMENTO, [TDescTipoLancamento[Ord(loTipoLancamento)], liValorLancamento]),
                                              TPlanoContasItem.Create(ttpciAtivo, liValorLancamento));
               liLancamentoRestante := liLancamentoRestante - liValorLancamento;
             end;

    liMaximoBalanco := liMaximoBalanco - liLancamentoRestante;
  end;

  procedure GeraValoresLancamentosPassivos;
  var
    loTipoLancamento  : TTipoLancamento;
    liValorLancamento,
    liLancamentoRestante : Integer;
  begin
    liLancamentoRestante := liMaximoBalanco;
    for loTipoLancamento in (TTipoLancamentoPassivo - [ttlCapitalSocial]) do
        if   (liMaximoBalanco > 0) then
             begin
               liValorLancamento := RandomRange(50, Round(liMaximoBalanco * ldRazaoLancamento));

               if   (liValorLancamento > liLancamentoRestante) then
                    liValorLancamento := liLancamentoRestante;

               if   not (liValorLancamento > 0) then
                    Exit;

               fFrmPrincipal.lstGeral.AddItem(Format(STR_EXIBICAO_LANCAMENTO, [TDescTipoLancamento[Ord(loTipoLancamento)], liValorLancamento]),
                                              TPlanoContasItem.Create(ttpciPassivo, liValorLancamento));
               liLancamentoRestante := liLancamentoRestante - liValorLancamento;
             end;

    if   (liLancamentoRestante > 0) then
         fFrmPrincipal.lstGeral.AddItem(Format(STR_EXIBICAO_LANCAMENTO, [TDescTipoLancamento[Ord(ttlCapitalSocial)], liLancamentoRestante]),
                                        TPlanoContasItem.Create(ttpciPassivo, liLancamentoRestante));
  end;


begin
  //Tratar em outro lugar, pois podemos parametrizar por n�vel(talvez at� usar decimais ou algo do tipo)
  liMaximoBalanco := 30000;
  ldRazaoLancamento := 1/(Integer(High(TTipoLancamento))/2);

  GeraValoresLancamentosAtivos;
  GeraValoresLancamentosPassivos;
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

  fFrmPrincipal.btnValidar.OnClick := plOnClickBtnValidar;
end;

procedure TIFormPrincipal.plOnClickBtnValidar(Sender: TObject);
begin
  plValidaDados;
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
            1: begin
                 //Soma no total de debitos
                 fFrmPrincipal.lblTotalDebitos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalDebitos.Caption) + loPlanoContasItem.Quantidade);
                 //Retira do total de creditos
                 fFrmPrincipal.lblTotalCreditos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalCreditos.Caption) - loPlanoContasItem.Quantidade);
               end;

            2: begin
                 //Soma no total de creditos
                 fFrmPrincipal.lblTotalCreditos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalCreditos.Caption) + loPlanoContasItem.Quantidade);
                 //Retira do total de debitos
                 fFrmPrincipal.lblTotalDebitos.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalDebitos.Caption) - loPlanoContasItem.Quantidade);
               end;
          end;

          fFrmPrincipal.lblTotal.Caption := IntToStr(StrToInt(fFrmPrincipal.lblTotalDebitos.Caption) - StrToInt(fFrmPrincipal.lblTotalCreditos.Caption));
        end;
end;

procedure TIFormPrincipal.plOnDragOverListBox(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Sender <> Source;
end;

procedure TIFormPrincipal.plValidaDados;
const
  STR_ALGO_ESTA_ERRADO = 'Ops! Algo est� errado...';
var
  I : Integer;
begin
  for I := 0 to fFrmPrincipal.lstCreditos.Items.Count - 1 do
      if   (TPlanoContasItem(fFrmPrincipal.lstCreditos.Items.Objects[I]).Tipo <> ttpciPassivo) then
           raise Exception.Create(STR_ALGO_ESTA_ERRADO);
      
  for I := 0 to fFrmPrincipal.lstDebitos.Items.Count - 1 do
      if   (TPlanoContasItem(fFrmPrincipal.lstDebitos.Items.Objects[I]).Tipo <> ttpciAtivo) then
           raise Exception.Create(STR_ALGO_ESTA_ERRADO);   
end;

end.
