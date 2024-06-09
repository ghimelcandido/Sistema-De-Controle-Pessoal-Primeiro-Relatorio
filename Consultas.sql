-- Primeiro Relatorio
SELECT 
    F.IdFuncionario,
    F.Nome, 
    S.Setor,
    S.Funcao,
    EO.AptoOuInapto
FROM 
    Funcionario F
JOIN 
    Setor S ON F.IdFuncionario = S.IdFuncionario
JOIN 
    RegistroDeExames RE ON F.IdFuncionario = RE.IdFuncionario
JOIN 
    ExamesOcupacionais EO ON RE.IdExame = EO.IdExame;

-- Reiniciando                    
SELECT * FROM FuncionarioNecessidadeEspecial WHERE IdFuncionario = 1;
DELETE FROM FuncionarioNecessidadeEspecial WHERE IdFuncionario = 1;
DELETE FROM Funcionario WHERE IdFuncionario = 1;