INSERT INTO Funcionario (IdFuncionario, Nome, Telefone, Enderecos, TipoSanguineo) VALUES
(1, 'Ghimel', '85992708974', 'Rua Raimundo Oliveira Filho 153', 'A+');

INSERT INTO NecessidadeEspecial (Descricao) VALUES
('Obesidade');

INSERT INTO FuncionarioNecessidadeEspecial (IdFuncionario, IdNecessidadeEspecial) VALUES
(1, 1);

INSERT INTO Dependentes (IdFuncionario, Nome, TipoDependencia, DataNascimento, InscritoUniversidade) VALUES
(1, 'Amalia', 'Mae', '1963-05-04', 'Não');

INSERT INTO AcompanhamentoDeSaude (Necessidades) VALUES
('Acompanhamento com Endocrinologista');

INSERT INTO FuncionarioAcompanhamentoDeSaude (IdFuncionario, IdAcompanhamento) VALUES
(1, 1);

INSERT INTO Limitacoes (Descricao, IdAcompanhamento) VALUES
('Subir escadas', 1);

INSERT INTO ObrigacoesDaEmpresa (Descricao, IdAcompanhamento) VALUES
('Elevador', 1);

INSERT INTO PossiveisDoencas (Nome, IdAcompanhamento) VALUES
('Diabetes', 1);

INSERT INTO RegistroDeExames (IdFuncionario, DataExame, TipoExame, Descricao) VALUES
(1, '2024-01-01', 'Exame de Sangue', 'Hemograma completo');

SET @last_exame_id = LAST_INSERT_ID();

INSERT INTO ResultadosEValoresDeReferencia (IdExame, Resultado, ValorReferencia) VALUES
(@last_exame_id, 'Resultado', '21mg');

INSERT INTO ExamesOcupacionais (IdExame, TipoOcupacional, Descricao, AptoOuInapto) VALUES
(@last_exame_id, 'Admissional', 'Exame realizado na chegada', 'Apto');

INSERT INTO Setor (IdFuncionario, Funcao, DataDeEntradaNoSetor, DataDeSaidaNoSetor, Setor) VALUES
(1, 'Desenvolvedor de Software', '2024-01-01', '2025-01-01', 'TI');

INSERT INTO HistoricoDePassagens (IdSetor, Setores) VALUES
(1, 'TI');

INSERT INTO FeriasDoFuncionario (IdFuncionario, QuantidadeDeDias, DataDeInicio, DataDeFim) VALUES
(1, 29, '2024-02-01', '2024-02-29');

INSERT INTO PorcentagemDeLiberacao (IdFerias, IdSetor, Porcentagem) VALUES
(1, 1, 100);

INSERT INTO QualificacaoDoFuncionario (IdFuncionario, NivelDeEscolaridade) VALUES
(1, 'Superior Incompleto');

INSERT INTO Cursos (IdQualificacao, RegistroDeCurso, CargaHorariaDoCurso, DataDoInicioDoCurso, DataDoFimDoCurso) VALUES
(1, 'Curso de JavaScript', 200, '2023-01-10', '2023-06-10');

INSERT INTO CompetenciasDoCurso (IdCurso, Descricao) VALUES
(1, 'Programação em JavaScript');