unit PlanoContasItem;

interface

type
  TTipoPlanoContasItem = (ttpciAtivo, ttpciPassivo);

  TPlanoContasItem = class
  private
    fTipo    : TTipoPlanoContasItem;
    fQuantidade : Integer;

  public
    property Tipo : TTipoPlanoContasItem read fTipo write fTipo;
    property Quantidade : Integer read fQuantidade write fQuantidade;

    constructor Create(const ceTipoPlanoContasItem : TTipoPlanoContasItem; const ciQuantidade : Integer); reintroduce;
  end;

implementation

{ TPlanoContasItem }

constructor TPlanoContasItem.Create(const ceTipoPlanoContasItem : TTipoPlanoContasItem; const ciQuantidade : Integer);
begin
  fTipo := ceTipoPlanoContasItem;
  fQuantidade := ciQuantidade;
end;

end.
