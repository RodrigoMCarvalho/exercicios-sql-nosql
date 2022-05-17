----- Consulta paginada

SELECT
	CASE WHEN CdVeiculoLegal = 1 THEN '59588111000103' WHEN CdVeiculoLegal = 1455 THEN '01858774000110' END AS CNPJEmissor,
	CdSNA AS CdISIN,
	'CDB' AS DsProduto,
	'CDI' AS Indexador,
	PcIndexador AS Taxa,
	DtVencimentoOperacao AS Vencimento,
	CASE WHEN TpOperacao = 1 THEN 'EMISSAO' WHEN TpOperacao = 2 THEN 'RESGATE' END AS TpMovimentacao,
	DtInicioOperacao AS DtMovimentacao,
	VrPrecoUnitario,
	QtOperacaoCDB AS Quantidade,
	VrBruto AS VrMovimentacao
FROM 
	TbMovimentoOperacao
WHERE
	DtInicioOperacao >= '20220418' AND
	DtInicioOperacao < dateadd(dd, 1, '20220418') AND
	CdStatusOperacao IN (0, 1, 5, 7) AND
	CdVeiculoLegal = 1
ORDER BY
	CdMovimento
	OFFSET ((3 - 1) * 5) ROWS
	FETCH NEXT 5 ROWS ONLY



---- Numero de páginas

SELECT
	CAST(CEILING(CAST(COUNT(CdMovimento) AS FLOAT)/ 5)AS INT)
FROM 
	TbMovimentoOperacao
WHERE
	DtInicioOperacao >= '20220418' AND
	DtInicioOperacao < dateadd(dd, 1, '20220418') AND
	CdStatusOperacao IN (0, 1, 5, 7) AND
	CdVeiculoLegal = 1