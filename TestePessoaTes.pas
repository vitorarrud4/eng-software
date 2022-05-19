…
private
...
   PessoaTES : TPessoaTES
…
[Test]
procedure Insert;
…
procedure TTesteWorkshop.Setup;
begin
  FPessoa := Pessoa.Create;
  PessoaTES := PessoaTES.Create;
end;
..
procedure TTesteWorkshop.Insert;
begin
    try
    PessoaTES.Entidade.GUUID := '123';
    PessoaTES.Entidade.Nome := '123';
    PessoaTES.Entidade.Senha := '123';
    PessoaTES.Entidade.Tipo := 1;
    PessoaTES.Entidade.Status := 1;
    PessoaTES.Entidade.DtCad := now;
    PessoaTES.Entidade.DtAlt := now;
    PessoaTES.Insert;
 
    PessoaTES.BuscaID('123');
    Assert.IsTrue(PessoaTES.Entidade.GUUID = '123','TPEssoaTES.Insert erro ao inserir GUIID');
    Assert.IsTrue(PessoaTES.Entidade.Nome = '123','TPEssoaTES.Insert erro ao inserir NOME');
    Assert.IsTrue(PessoaTES.Entidade.Senha = '123','TPEssoaTES.Insert erro ao inserir SENHA');
    Assert.IsTrue(PessoaTES.Entidade.Tipo = 1,'TPEssoaTES.Insert erro ao inserir TIPO');
    Assert.IsTrue(PessoaTES.Entidade.Status = 1,'TPEssoaTES.Insert erro ao inserir STATUS');
    Assert.IsNotNull(PessoaTES.Entidade.DtCad,'TPEssoaTES.Insert erro ao inserir DTCAD');
    Assert.IsNotNull(PessoaTES.Entidade.DtAlt,'TPEssoaTES.Insert erro ao inserir DTALT');
  finally
    PessoaTES.Entidade.GUUID := '123';
    PessoaTES.Delete;
  end;
end;
