ALTER TABLE FuncionarioNecessidadeEspecial
ADD FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE;

ALTER TABLE FuncionarioNecessidadeEspecial
ADD FOREIGN KEY (IdNecessidadeEspecial) REFERENCES NecessidadeEspecial(IdNecessidadeEspecial) ON DELETE CASCADE;

ALTER TABLE Dependentes
ADD FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE;

ALTER TABLE FuncionarioAcompanhamentoDeSaude
ADD FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE;

ALTER TABLE FuncionarioAcompanhamentoDeSaude
ADD FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE;

ALTER TABLE Limitacoes
ADD FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE;

ALTER TABLE ObrigacoesDaEmpresa
ADD FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE;

ALTER TABLE PossiveisDoencas
ADD FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE;

ALTER TABLE RegistroDeExames
ADD FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE;

ALTER TABLE ResultadosEValoresDeReferencia
ADD FOREIGN KEY (IdExame) REFERENCES RegistroDeExames(IdExame) ON DELETE CASCADE;

ALTER TABLE ExamesOcupacionais
ADD FOREIGN KEY (IdExame) REFERENCES RegistroDeExames(IdExame) ON DELETE CASCADE;

ALTER TABLE Setor
ADD FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE;

ALTER TABLE HistoricoDePassagens
ADD FOREIGN KEY (IdSetor) REFERENCES Setor(IdSetor) ON DELETE CASCADE;

ALTER TABLE FeriasDoFuncionario
ADD FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE;

ALTER TABLE PorcentagemDeLiberacao
ADD FOREIGN KEY (IdFerias) REFERENCES FeriasDoFuncionario(IdFerias) ON DELETE CASCADE;

ALTER TABLE PorcentagemDeLiberacao
ADD FOREIGN KEY (IdSetor) REFERENCES Setor(IdSetor) ON DELETE CASCADE;

ALTER TABLE QualificacaoDoFuncionario
ADD FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE;

ALTER TABLE Cursos
ADD FOREIGN KEY (IdQualificacao) REFERENCES QualificacaoDoFuncionario(IdQualificacao) ON DELETE CASCADE;

ALTER TABLE CompetenciasDoCurso
ADD FOREIGN KEY (IdCurso) REFERENCES Cursos(IdCurso) ON DELETE CASCADE;