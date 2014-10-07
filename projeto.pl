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
materia(4,topicos_em_metodologias_de_programacao,6).
materia(5,circuitos_eletricos,4).
materia(6,eletronica_digital,5).
materia(7,arquitetura_computadores,6).
materia(8,microcontroladores,4).

%curriculo(cc,[cm1,cm2,...,cmn]).
curriculo(1,[1,2,3,4]).
curriculo(2,[5,6,7,8]).
curriculo(3,[1]).

% aluno(ra,na).
aluno(12176,joao).
aluno(12189,maria).
aluno(12123,rodrigo).
aluno(12789,bruno).
aluno(12179,lais).

% cursa(ra,cc)
cursa(12176,1).
cursa(12189,2).
cursa(12179,3).

% historico (ra,[i1,i2,....,in])
historico(12176,[item(1,1,2012,3.0,0.77),item(1,2,2013,6.5,0.90),item(5,1,2014,8.0,0.80)]).
historico(12189,[item(1,1,2012,7.0,0.80),item(2,2,2013,8.5,0.80),item(3,1,2014,5.0,0.75)]).
historico(12123,[item(5,1,2012,6.0,0.70),item(5,2,2013,7.5,0.90),item(6,1,2014,5.0,0.90)]).
historico(12789,[item(7,1,2012,6.0,0.75),item(8,2,2014,8.0,0.89)]).
historico(12179,[item(1,2,2000,9,0.8),item(5,2,2000,9,0.8)]).

% predicado que retorna a lista dos codigos de materias aprovadas
materias_aprovadas(RA,LISTA_R):-historico(RA,A),materias_aprovadas_aux(A,LISTA_R).
materias_aprovadas_aux([],[]).
materias_aprovadas_aux([item(CM,_,_,N,F)|R],[CM|NOVO_R]):-N@>=5,F@>=0.75,materias_aprovadas_aux(R,NOVO_R).
materias_aprovadas_aux([item(_,_,_,N,F)|R],NOVO_R):-N@>=5,F@<0.75,materias_aprovadas_aux(R,NOVO_R).
materias_aprovadas_aux([item(_,_,_,N,F)|R],NOVO_R):-N@<5,F@>=0.75,materias_aprovadas_aux(R,NOVO_R).
materias_aprovadas_aux([item(_,_,_,N,F)|R],NOVO_R):-N@<5,F@<0.75,materias_aprovadas_aux(R,NOVO_R).

% predicado que retorna a lista dos codigos de materias cursadas
materias_cursadas(RA,LISTA_R):-historico(RA,A),materias_cursadas_aux(A,LISTA_R).
materias_cursadas_aux([],[]).
materias_cursadas_aux([item(CM,_,_,_,_)|R],[CM|NOVO_R]):-materias_cursadas_aux(R,NOVO_R).

% predicado que remove os elementos da primeira lista de uma segunda
removeLista([],L,L).
removeLista([P|R],L1,L2):-removeOcorrencias(P,L1,L3),removeLista(R,L3,L2).

% predicado que retorna uma lista sem as ocorrencias de determinado elemento X
removeOcorrencias(_,[],[]).
removeOcorrencias(X,[X|R],NR):-removeOcorrencias(X,R,NR).
removeOcorrencias(X,[Y|R],[Y|NR]):-X\==Y,removeOcorrencias(X,R,NR).

%predicado que retorna o nome das matérias de uma lista de Cod de cursos
nomeMaterias([],[]).
nomeMaterias([item(CM,_,_,N,_)|R],[N|NOVO_R]):-nomeMaterias(R,NOVO_R).

%======================================================================
% 1) Descobrir se um aluno, cujo RA ser� fornecido, concluiu o curso
% cujo c�digo tambem ser fornecido; execu��o pretendida:
% concluiu(12909,1).
%======================================================================

tem(X,[X|_]).
tem(X,[P|R]):-X\==P,tem(X,R).

contem_lista([],[]).
contem_lista([X|R],LISTA):-tem(X,LISTA),contem_lista(R,LISTA).

concluiu(RA,CC):-materias_aprovadas(RA,LISTA_R),curriculo(CC,LISTA_C),contem_lista(LISTA_C,LISTA_R).

%=====================================================================
% 2) Produzir a lista dos nomes das mat�rias que faltam para um aluno,
% cujo RA ser� fornecido, concluir o curso, cujo c�digo tamb�m ser�
% fornecido (a lista produzida deve ser retornada em um terceiro
% par�metro); execucaoo pretendida:
%======================================================================

falta(RA,CC,OQUE):-materias_aprovadas(RA,LISTA_R),curriculo(CC,LISTA_C),removeLista(LISTA_R,LISTA_C,S),nomeMaterias(S,N).

%======================================================================
% 3) Produzir a lista dos nomes das mat�rias extra curriculares cursadas
% pelo aluno, cujo RA ser� fornecido (o c�digo do curso a ser considerado
% ser� fornecido em um segundo par�metro e a lista produzida deve ser
% retornada em um terceiro par�metro); execu��o pretendida:
%======================================================================

extra(RA,CC,LISTA_R):-materiasCursadas(RA,LISTA_M),curriculo(CC,LISTA_C),removeLista(LISTA_C,LISTA_M,S),nomeMaterias(S,N).

%======================================================================
% 4) Calcular quantos por cento das mat�rias obrigat�rias para a
% conclus�o do curso cujo c�digo ser� fornecido, um aluno, cujo RA ser�
% fornecido j� cumpriu (disciplinas extra curriculares devem ser
% desconsideradas e o percentual calculado deve ser retornado em um
% terceiro par�metro); e.g.:
%======================================================================

%  quanto(CC,RA,QUANTO):-