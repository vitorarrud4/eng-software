Pessoa = class
  private
    FNome: string;
    FDtCad: TDateTime;
    FStatus: integer;
    FSenha: string;
    FDtAlt: TDateTime;
    FGUUID: string;
    FTipo: integer;
    procedure SetNome(const Value: string);
    procedure SetDtAlt(const Value: TDateTime);
    procedure SetDtCad(const Value: TDateTime);
    procedure SetGUUID(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetStatus(const Value: integer);
    procedure SetTipo(const Value: integer);
  public
    procedure validarCampos;
    function TratarCPFCNPJ(value : string) : string;
    property Nome : string read FNome write SetNome;
    property GUUID : string read FGUUID write SetGUUID;
    property Senha : string read FSenha write SetSenha;
    property Tipo : integer read FTipo write SetTipo;
    property Status : integer read FStatus write SetStatus;
    property DtCad : TDateTime read FDtCad write SetDtCad;
    property DtAlt : TDateTime read FDtAlt write SetDtAlt;
  end;
