type
  PessoaTES = class
  private
    FPessoa : Pessoa;
    FQuery : TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    function Entidade : Pessoa;
    procedure Insert;
    procedure Update;
    procedure Delete;
    procedure BuscaID(ID : string);
  end;
 
implementation
 
uses
  System.SysUtils;
 
{ PessoaTES }
 
procedure PessoaTES.BuscaID(ID: string);
begin
  FQuery.Open('select * from pessoa where guuid='+QuotedStr(FPessoa.GUUID));
  FQuery.First;
  FPessoa.GUUID := FQuery.FieldByName('GUUID').AsString;
  FPessoa.Nome := FQuery.FieldByName('NOME').AsString;
  FPessoa.Senha := FQuery.FieldByName('SENHA').AsString;
  FPessoa.Tipo := FQuery.FieldByName('TIPO').AsInteger;
  FPessoa.Status := FQuery.FieldByName('STATUS').AsInteger;
  FPessoa.DTCAD := FQuery.FieldByName('DTCAD').AsDateTime;
  FPessoa.DTALT := FQuery.FieldByName('GUUID').AsDateTime;
end;
 
constructor PessoaTES.Create;
begin
  FPessoa := Pessoa.Create;
  
if not Assigned(DataModule1) then
    DataModule1 := TDataModule1.Create(nil);
 
  FQuery := DataModule1.FDQuery1;
end;
 
procedure PessoaTES.Delete;
begin
  FQuery.Open('select * from pessoa where guiid='+QuotedStr(FPessoa.GUUID));
  FQuery.Delete;
  FQuery.ApplyUpdates(0);
end;
 
destructor PessoaTES.Destroy;
begin
  FPessoa.DisposeOf;
  inherited;
end;
 
function PessoaTES.Entidade: Pessoa;
begin
  Result := FPessoa;
end;
 
procedure PessoaTES.Insert;
begin
  FQuery.Open('select * from pessoa where 1=2');
  FQuery.Append;
  FQuery.FieldByName('GUUID').AsString := FPessoa.GUUID;
  FQuery.FieldByName('NOME').AsString := FPessoa.Nome;
  FQuery.FieldByName('SENHA').AsString := FPessoa.Senha;
  FQuery.FieldByName('TIPO').AsInteger := FPessoa.Tipo;
  FQuery.FieldByName('STATUS').AsInteger := FPessoa.Status;
  FQuery.FieldByName('DTCAD').AsDateTime := FPessoa.DTCAD;
  FQuery.FieldByName('GUUID').AsDateTime := FPessoa.DTALT;
  FQuery.Post;
  FQuery.ApplyUpdates(0);
end;
 
procedure PessoaTES.Update;
begin
  FQuery.Open('select * from pessoa where guuid='+QuotedStr(FPessoa.GUUID));
  FQuery.Edit;
  FQuery.FieldByName('GUUID').AsString := FPessoa.GUUID;
  FQuery.FieldByName('NOME').AsString := FPessoa.Nome;
  FQuery.FieldByName('SENHA').AsString := FPessoa.Senha;
  FQuery.FieldByName('TIPO').AsInteger := FPessoa.Tipo;
  FQuery.FieldByName('STATUS').AsInteger := FPessoa.Status;
  FQuery.FieldByName('DTCAD').AsDateTime := FPessoa.DTCAD;
  FQuery.FieldByName('GUUID').AsDateTime := FPessoa.DTALT;
  FQuery.Post;
  FQuery.ApplyUpdates(0);
end;
