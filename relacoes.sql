-- ----------------------------------Relações ----------------------------------
select * from atletas;
select * from bairro;
select * from cidade;
select * from classificacao;
select * from competicao_equipe;
select * from competicao_individual;
select * from delegacao;
select * from email;
select * from endereco;
select * from equipe;
select * from equipe_de_atletas;
select * from escolaridade;
select * from estado;
select * from estado_civil;
select * from filiacao;
select * from historico;
select * from modalidade;
select * from olimpiada;
select * from pais;
select * from participacao;
select * from participacao_de_equipe;
select * from pessoa;
select * from pessoa_has_endereco;
select * from sexo;
select * from telefone;
select * from tipo_email;
select * from tipo_endereco;
select * from tipo_modalidade;
select * from tipo_telefone;
select * from treinador;
-- ------------------------------ imprimir lista de desemprenho -------------------------------------------
select * from equipe;
select * from modalidade;
select e.*, t.nome_confederacao, p.nome_pessoa from equipe as e
inner join treinador as t on t.id_treinador = e.treinador_id_treinador
inner join pessoa as p on p.id_pessoa = t.pessoa_id_pessoa;

select distinct nome_pessoa, cl.classificacao from competicao_individual as ci
inner join participacao as p
	on p.atletas_id_atletas = ci.participacao_atletas_id_atletas
inner join atletas as a 
	on a.id_atletas = p.atletas_id_atletas
inner join pessoa as ps
	on ps.id_pessoa = a.pessoa_id_pessoa
inner join classificacao as cl
	on cl.id_classificacao = ci.classificacao_id_classificacao ;
    
select distinct e.nome_equipe, cl.classificacao from competicao_equipe as ce
inner join participacao_de_equipe as pe
	on pe.equipe_id_equipe = ce.participacao_de_equipe_equipe_id_equipe
inner join equipe as e
	on e.id_equipe = pe.equipe_id_equipe
inner join classificacao as cl
	on cl.id_classificacao = ce.classificacao_id_classificacao;

-- ----------------------------------------------------------------------------´

select p.nome_pessoa, cl.classificacao from competicao_individual as ci 
inner join participacao as pa 	 
	on  pa.atletas_id_atletas = ci.participacao_atletas_id_atletas
inner join pessoa as p 
	on p.id_pessoa = pa.atletas_id_atletas
inner join classificacao as cl
	on cl.id_classificacao = ci.classificacao_id_classificacao
    group by
    p.nome_pessoa, cl.classificacao;
