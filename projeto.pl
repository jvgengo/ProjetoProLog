% curso(cc,nc).
curso(1,informatica).
curso(2,eletroeletronica).
curso(3,mecanica).
curso(4,alimentos).
curso(5,enfermagem).
curso(6,plasticos).

% materia(cm,mm,am).
materia(1,tecnicas_de_programacao,8).
materia(2,programacao_orientada_a_objetos,5).
materia(3,estruturas_de_dados,4).
materia(4,topicos_em_metodologias_de_programacao).
materia(5,circuitos_eletricos,4).
materia(6,eletronica_digital,5).
materia(7,arquitetura_computadores,6).
materia(8,microcontroladores,4).

%curriculo(cc,[cm1,cm2,...,cmn]).
curriculo(1,[1,2,3,4]]).
curriculo(2,[5,6,7,8]]).

% aluno(ra,na).
aluno(12176,joao).
aluno(12189,maria).
aluno(12123,rodrigo).
aluno(12789,bruno).
aluno(12746,lais).

% cursa(ra,cc)
cursa(12176,1).
cursa(12189,2).

%======================================================================
%1)Descobrir se um aluno, cujo RA ser� fornecido, concluiu o curso cujo
% c�digo tamb�m ser� fornecido; execu��o pretendida:
%======================================================================


%======================================================================
%2)Produzir a lista dos nomes das mat�rias que faltam para um aluno,
% cujo RA ser� fornecido, concluir o curso, cujo c�digo tamb�m ser�
% fornecido (a lista produzida deve ser retornada em um terceiro
% par�metro); execu��o pretendida:
%======================================================================

%======================================================================
% 3) Produzir a lista dos nomes das mat�rias extra curriculares cursadas
% pelo aluno, cujo RA ser� fornecido (o c�digo do curso a ser considerado
% ser� fornecido em um segundo par�metro e a lista produzida deve ser
% retornada em um terceiro par�metro); execu��o pretendida:
%======================================================================


%======================================================================
% 4. Calcular quantos por cento das mat�rias obrigat�rias para a
% conclus�o do curso cujo c�digo ser� fornecido, um aluno, cujo RA ser�
% fornecido j� cumpriu (disciplinas extra curriculares devem ser
% desconsideradas e o percentual calculado deve ser retornado em um
% terceiro par�metro); e.g.:
%======================================================================
