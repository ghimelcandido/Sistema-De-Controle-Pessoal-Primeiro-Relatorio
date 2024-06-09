USE SistemaDeControlePessoal;

CREATE TABLE Funcionario (
    IdFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20),
    Enderecos TEXT,
    TipoSanguineo VARCHAR(5)
);

CREATE TABLE NecessidadeEspecial (
    IdNecessidadeEspecial INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE FuncionarioNecessidadeEspecial (
    IdFuncionario INT,
    IdNecessidadeEspecial INT,
    PRIMARY KEY (IdFuncionario, IdNecessidadeEspecial),
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE,
    FOREIGN KEY (IdNecessidadeEspecial) REFERENCES NecessidadeEspecial(IdNecessidadeEspecial) ON DELETE CASCADE
);

CREATE TABLE Dependentes (
    IdDependente INT AUTO_INCREMENT PRIMARY KEY,
    IdFuncionario INT,
    Nome VARCHAR(100) NOT NULL,
    TipoDependencia VARCHAR(50),
    DataNascimento DATE,
    InscritoUniversidade VARCHAR(20),
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE
);

CREATE TABLE AcompanhamentoDeSaude (
    IdAcompanhamento INT AUTO_INCREMENT PRIMARY KEY,
    Necessidades VARCHAR(145) NOT NULL
);

CREATE TABLE FuncionarioAcompanhamentoDeSaude (
    IdFuncionario INT,
    IdAcompanhamento INT,
    PRIMARY KEY (IdFuncionario, IdAcompanhamento),
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE,
    FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE
);

CREATE TABLE Limitacoes (
    IdLimitacao INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    IdAcompanhamento INT,
    FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE
);

CREATE TABLE ObrigacoesDaEmpresa (
    IdObrigacao INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    IdAcompanhamento INT,
    FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE
);

CREATE TABLE PossiveisDoencas (
    IdDoenca INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    IdAcompanhamento INT,
    FOREIGN KEY (IdAcompanhamento) REFERENCES AcompanhamentoDeSaude(IdAcompanhamento) ON DELETE CASCADE
);

CREATE TABLE RegistroDeExames (
    IdExame INT AUTO_INCREMENT PRIMARY KEY,
    IdFuncionario INT,
    DataExame DATE,
    TipoExame VARCHAR(100),
    Descricao TEXT,
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE
);

CREATE TABLE ResultadosEValoresDeReferencia (
    IdResultado INT AUTO_INCREMENT PRIMARY KEY,
    IdExame INT,
    Resultado VARCHAR(255),
    ValorReferencia VARCHAR(255),
    FOREIGN KEY (IdExame) REFERENCES RegistroDeExames(IdExame) ON DELETE CASCADE
);

CREATE TABLE ExamesOcupacionais (
    IdExameOcupacional INT AUTO_INCREMENT PRIMARY KEY,
    IdExame INT,
    TipoOcupacional VARCHAR(100),
    Descricao TEXT,
    AptoOuInapto TEXT,
    FOREIGN KEY (IdExame) REFERENCES RegistroDeExames(IdExame) ON DELETE CASCADE
);

CREATE TABLE Setor (
    IdSetor INT AUTO_INCREMENT PRIMARY KEY,
    IdFuncionario INT,
    Funcao VARCHAR(100) NOT NULL,
    DataDeEntradaNoSetor DATE NOT NULL,
    DataDeSaidaNoSetor DATE,
    Setor VARCHAR(100),
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE
);

CREATE TABLE HistoricoDePassagens (
    IdHistorico INT AUTO_INCREMENT PRIMARY KEY,
    IdSetor INT,
    Setores VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdSetor) REFERENCES Setor(IdSetor) ON DELETE CASCADE
);

CREATE TABLE FeriasDoFuncionario (
    IdFerias INT AUTO_INCREMENT PRIMARY KEY,
    IdFuncionario INT,
    QuantidadeDeDias INT NOT NULL,
    DataDeInicio DATE NOT NULL,
    DataDeFim DATE NOT NULL,
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE
);

CREATE TABLE PorcentagemDeLiberacao (
    IdPorcentagem INT AUTO_INCREMENT PRIMARY KEY,
    IdFerias INT,
    IdSetor INT,
    Porcentagem INT NOT NULL,
    FOREIGN KEY (IdFerias) REFERENCES FeriasDoFuncionario(IdFerias) ON DELETE CASCADE,
    FOREIGN KEY (IdSetor) REFERENCES Setor(IdSetor) ON DELETE CASCADE
);

CREATE TABLE QualificacaoDoFuncionario (
    IdQualificacao INT AUTO_INCREMENT PRIMARY KEY,
    IdFuncionario INT,
    NivelDeEscolaridade VARCHAR(45) NOT NULL,
    FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE CASCADE
);

CREATE TABLE Cursos (
    IdCurso INT AUTO_INCREMENT PRIMARY KEY,
    IdQualificacao INT,
    RegistroDeCurso VARCHAR(255) NOT NULL,
    CargaHorariaDoCurso INT NOT NULL,
    DataDoInicioDoCurso DATE NOT NULL,
    DataDoFimdoCurso DATE NOT NULL,
    FOREIGN KEY (IdQualificacao) REFERENCES QualificacaoDoFuncionario(IdQualificacao) ON DELETE CASCADE
);

CREATE TABLE CompetenciasDoCurso (
    IdCompetencia INT AUTO_INCREMENT PRIMARY KEY,
    IdCurso INT,
    Descricao VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdCurso) REFERENCES Cursos(IdCurso) ON DELETE CASCADE
);
