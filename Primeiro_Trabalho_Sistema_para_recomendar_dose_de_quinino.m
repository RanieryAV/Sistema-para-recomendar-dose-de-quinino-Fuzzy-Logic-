% Nome do aluno: Raniery Alves Vasconcelos
% Matrícula: 473532

% Conforme orienta o livro “Inteligência Artificial”, Ben Coppin; LTC,
% 2010, é preciso seguir 3 passos para criar um sistema especialista
% nebuloso:
%   1º - Obter informações a partir de um ou mais especialistas.
%   2º - Definir os conjuntos nebulosos.
%   3º - Definir as regras nebulosas.

% Assim, definimos as seguintes variáveis linguísticas ou conjuntos
% nebulosos:
%   --> temperatura média do destino (T)
%   --> umidade média do destino (U)
%   --> proximidade a grandes massas de água (P)
%   --> industrialização do destino (I)

% Agora, definimos a faixa dos valores possíveis para tais variáveis:
%   --> temperatura, umidade e industrialização:
%       - alta (A)
%           OU
%       - baixa (B)
%   --> proximidade a grandes massas de água:
%       - perto (P)
%           OU
%       - longe (L)

% Os valores nítidos que são recebidos como entradas estarão
% na faixa de 0 a 100 para temperatura, umidade e industrialização
% e de 0 a 50 para proximidade a água.

% Então, definimos as funções de pertinência para cada um destes
% subconjuntos nebulosos. No lugar da nomenclatura do livro, aqui usa-se
% identações para identificar qual é o tópico macro e o subtópico micro:
%
% OBS.: Observações sobre cada função de pertinência estão entre chaves {}
% e "x" refere-se ao valor de entrada das funções.
%
%   --> temperatura média do destino (T):
%       - alta (A):
%           (x-25)/75 {para x >= 25}
%               OU
%               0     {para x < 25}
%       - baixa (B):
%           1 - (x/75) {para x <= 75}
%               OU
%               0      {para x > 75}
%
%   --> umidade média do destino (U):
%       - alta (A):
%           x/100
%       - baixa (B):
%           1 - (x/100)
%
%   --> proximidade a grandes massas de água (P):
%       - perto (P):
%               1       {para x < 10}
%               OU
%           (40-x)/30   {para 10 <= x < 40}
%               OU
%               0       {para x >= 40}
%       - longe (L):
%               0       {para x < 10}
%               OU
%           (x-10)/30   {para 10 <= x < 40}
%               OU
%               1       {para x >= 40}
%
%   --> industrialização do destino (I):
%       - alta (A):
%               0       {para x < 10}
%               OU
%           (x-10)/10   {para 10 <= x < 20}
%               OU
%               1       {para x >= 20}
%       - baixa (B):
%               1       {para x < 10}
%               OU
%           (20-x)/10   {para 10 <= x < 20}
%               OU
%               0       {para x >= 20}

% Agora, definir mais um conjunto nebuloso, que é o conjunto usado para
% descrever a saída do sistema. Assim, no caso aqui estudado, o sistema
% prescreverá uma dose de quinino que poderá ter um de três valores:
%
%   --> Saída de quinino do sistema (representado por "Q", onde "Q" vai de 0 até 100):
%       - dose muito baixa (M):
%           (10-x)/10 {para x <= 10}
%               OU
%               0     {para x > 10}
%       - dose baixa (B):
%           (50-x)/50 {para x <= 50}
%               OU
%               0     {para x > 50}
%       - dose alta (A):
%               0     {para x <= 40}
%               OU
%           (x-40)/60 {para x > 40}

% Depois, a segunda etapa da criação do sistema especialista nebuloso é
% definir um conjunto de regras nebulosas (depois do código de execução)

%-----------------------------------
% COMEÇO DA EXECUÇÃO DO PROGRAMA
%-----------------------------------
% Ler o valor de T do teclado do usuário e tratar os intervalos aceitos
T_value = double(input("\nDigite o valor entre 0 e 100 da temperatura média do destino (T): "));
while(T_value < 0 || T_value > 100)
    T_value = double(input("\nDigite o valor entre 0 e 100 da temperatura média do destino (T): "));
end
fprintf("\nTeste de impressao do valor de T: %f\n", T_value);

% Ler o valor de U do teclado do usuário e tratar os intervalos aceitos
U_value = double(input("\nDigite o valor entre 0 e 100 da umidade média do destino (U): "));
while(U_value < 0 || U_value > 100)
    U_value = double(input("\nDigite o valor entre 0 e 100 da umidade média do destino (U): "));
end
fprintf("\nTeste de impressao do valor de U: %f\n", U_value);

% Ler o valor de P do teclado do usuário e tratar os intervalos aceitos
P_value = double(input("\nDigite o valor (A PARTIR DE 0) da proximidade a grandes massas de água (P): "));
while(P_value < 0)
    P_value = double(input("\nDigite o valor (A PARTIR DE 0) da proximidade a grandes massas de água (P): "));
end
fprintf("\nTeste de impressao do valor de P: %f\n", P_value);

% Ler o valor de I do teclado do usuário e tratar os intervalos aceitos
I_value = double(input("\nDigite o valor entre 0 e 100 da industrialização do destino (I): "));
while(I_value < 0 || I_value > 100)
    I_value = double(input("\nDigite o valor entre 0 e 100 da industrialização do destino (I): "));
end
fprintf("\nTeste de impressao do valor de U: %f\n", I_value);

% Chamamos a função (definida no final deste código) que define e calcula o valor para cada regra nebulosa das ENTRADAS (T), (U), (P) e (I)
[funcao_pertinencia_T_alta, funcao_pertinencia_T_baixa, funcao_pertinencia_U_alta, funcao_pertinencia_U_baixa, funcao_pertinencia_P_perto, funcao_pertinencia_P_longe, funcao_pertinencia_I_alta, funcao_pertinencia_I_baixa] = definirEcalcularRegrasNebulosas(T_value, U_value, P_value, I_value);
arrayFuncoesDePertinencia = [funcao_pertinencia_T_alta, funcao_pertinencia_T_baixa, funcao_pertinencia_U_alta, funcao_pertinencia_U_baixa, funcao_pertinencia_P_perto, funcao_pertinencia_P_longe, funcao_pertinencia_I_alta, funcao_pertinencia_I_baixa];
%fprintf(arrayFuncoesDePertinencia);

% Confirmamos que os valores da função definirEcalcularRegrasNebulosas(*args) foram retornados e armazenados corretamente
fprintf("\nArray com os valores das funcoes de Pertinencia: %.3f ", arrayFuncoesDePertinencia(:));

% Chamamos a função (definida no final deste código) que aplica AND e OR para determinar os valores de ativação para as quatro regras definidas pelo livro
funcao_pertinencia_T_alta = arrayFuncoesDePertinencia(1,1);
fprintf("\nArray linha 1, coluna 1 (valores das funcoes de Pertinencia): %.3f ", funcao_pertinencia_T_alta);
funcao_pertinencia_T_baixa = arrayFuncoesDePertinencia(1,2);
funcao_pertinencia_U_alta = arrayFuncoesDePertinencia(1,3);
funcao_pertinencia_U_baixa = arrayFuncoesDePertinencia(1,4);
funcao_pertinencia_P_perto = arrayFuncoesDePertinencia(1,5);
funcao_pertinencia_P_longe = arrayFuncoesDePertinencia(1,6);
funcao_pertinencia_I_alta = arrayFuncoesDePertinencia(1,7);
funcao_pertinencia_I_baixa = arrayFuncoesDePertinencia(1,8);

[valor_final_de_ativacao_regras_1_e_3, valor_final_de_ativacao_regra_2, valor_final_de_ativacao_regra_4] = determinarValoresDeAtivacao(funcao_pertinencia_T_alta, funcao_pertinencia_T_baixa, funcao_pertinencia_U_alta, funcao_pertinencia_U_baixa, funcao_pertinencia_P_perto, funcao_pertinencia_P_longe, funcao_pertinencia_I_alta, funcao_pertinencia_I_baixa);
arrayValoresDeAtivacao = [valor_final_de_ativacao_regras_1_e_3, valor_final_de_ativacao_regra_2, valor_final_de_ativacao_regra_4];
valor_final_de_ativacao_regras_1_e_3 = arrayValoresDeAtivacao(1,1);
fprintf("\nArray linha 1, coluna 1 (valores finais de ativacao): %.3f ", valor_final_de_ativacao_regras_1_e_3);
valor_final_de_ativacao_regra_2 = arrayValoresDeAtivacao(1,2);
valor_final_de_ativacao_regra_4 = arrayValoresDeAtivacao(1,3);


% Chamamos a função (definida no final deste código) que define e calcula o valor para cada regra nebulosa das SAÍDAS (Q)
[funcao_pertinencia_Q_muito_baixa, funcao_pertinencia_Q_baixa, funcao_pertinencia_Q_alta] = definirEcalcularRegrasNebulosasDasSAIDAS(valor_final_de_ativacao_regras_1_e_3, valor_final_de_ativacao_regra_2, valor_final_de_ativacao_regra_4);
arrayRegrasNebulosasDasSAIDAS = [funcao_pertinencia_Q_muito_baixa, funcao_pertinencia_Q_baixa, funcao_pertinencia_Q_alta];

funcao_pertinencia_Q_muito_baixa = arrayRegrasNebulosasDasSAIDAS(1,1);
fprintf("\nArray linha 1, coluna 1 (valores de funcao de pertinencia de Q): %.3f \n\n", funcao_pertinencia_Q_muito_baixa);
funcao_pertinencia_Q_baixa = arrayRegrasNebulosasDasSAIDAS(1,2);
funcao_pertinencia_Q_alta = arrayRegrasNebulosasDasSAIDAS(1,3);

% Chamamos a função (definida no final deste código) que faz a desnebulização para obter a dose de quinino
dosagemNitidaFinal = desnebulizacaoSaidaQuinino(funcao_pertinencia_Q_muito_baixa, funcao_pertinencia_Q_baixa, funcao_pertinencia_Q_alta)

%**********************************************************
% DEFINIÇÃO DE TODAS AS FUNÇÕES MENCIONADAS ANTERIORMENTE *
%**********************************************************

function [funcao_pertinencia_T_alta, funcao_pertinencia_T_baixa, funcao_pertinencia_U_alta, funcao_pertinencia_U_baixa, funcao_pertinencia_P_perto, funcao_pertinencia_P_longe, funcao_pertinencia_I_alta, funcao_pertinencia_I_baixa] = definirEcalcularRegrasNebulosas(T_value, U_value, P_value, I_value)
    funcao_pertinencia_T_alta = 0;
    funcao_pertinencia_T_baixa = 0;
    funcao_pertinencia_U_alta = 0;
    funcao_pertinencia_U_baixa = 0;
    funcao_pertinencia_P_perto = 0;
    funcao_pertinencia_P_longe = 0;
    funcao_pertinencia_I_alta = 0;
    funcao_pertinencia_I_baixa = 0;

    %-----------------------------------
    % DEFINIÇÃO DAS REGRAS NEBULOSAS
    %-----------------------------------
    fprintf("\n---------- VALORES DOS GRAUS DE PERTENCIMENTO PARA CADA SUBCONJUNTO ----------\n");
    % --> Regra nebulosa da temperatura média do destino (T):
    %       - alta (A):
    if(T_value >= 25) % Limiar: {para x >= 25}
        funcao_pertinencia_T_alta = (T_value-25)/75; % Aplicamos a função de pertinência para valor de T alto
        % Informamos ao usuário o grau de pertencimento do valor T informado anteriormente:
        fprintf("\n --> Grau de pertencimento de T ao subconjunto nebuloso 'alta (A)': %.3f\n", funcao_pertinencia_T_alta);
    else
        if(T_value < 25) % Limiar: {para x < 25}
            funcao_pertinencia_T_alta = 0;
            fprintf("\n --> Grau de pertencimento de T ao subconjunto nebuloso 'alta (A)': %.3f\n", funcao_pertinencia_T_alta);
        end
    end
    %       - baixa (B):
    if(T_value <= 75) % Limiar: {para x <= 75}
        funcao_pertinencia_T_baixa = 1 - (T_value/75); % Aplicamos a função de pertinência para valor de T baixo
        % Informamos ao usuário o grau de pertencimento do valor T informado anteriormente:
        fprintf("\n --> Grau de pertencimento de T ao subconjunto nebuloso 'baixa (B)': %.3f\n", funcao_pertinencia_T_baixa);
    else
        if(T_value > 75) % Limiar: {para x > 75}
            funcao_pertinencia_T_baixa = 0;
            fprintf("\n --> Grau de pertencimento de T ao subconjunto nebuloso 'baixa (B)': %.3f\n", funcao_pertinencia_T_baixa);
        end
    end
    
    % --> Regra nebulosa da umidade média do destino (U):
    %       - alta (A):
    %           OBS.: Não há condições de limiar para U, então, ambas as
    %           funções de pertinência são calculadas de imediato
    funcao_pertinencia_U_alta = U_value/100; % Aplicamos a função de pertinência para valor de U alto
    % Informamos ao usuário o grau de pertencimento do valor U informado anteriormente:
    fprintf("\n --> Grau de pertencimento de U ao subconjunto nebuloso 'alta (A)': %.3f\n", funcao_pertinencia_U_alta);
    %       - baixa (B):
    funcao_pertinencia_U_baixa = 1 - (U_value/100);
    % Informamos ao usuário o grau de pertencimento do valor U informado anteriormente:
    fprintf("\n --> Grau de pertencimento de U ao subconjunto nebuloso 'baixa (B)': %.3f\n", funcao_pertinencia_U_baixa);
    
    % --> Regra nebulosa da proximidade a grandes massas de água (P):
    %       - perto (P):
    if(P_value < 10)
        funcao_pertinencia_P_perto = 1;
        fprintf("\n --> Grau de pertencimento de P ao subconjunto nebuloso 'perto (P)': %.3f\n", funcao_pertinencia_P_perto);
    else
        if(P_value >= 10 && P_value < 40)
            funcao_pertinencia_P_perto = (40-P_value)/30;
            fprintf("\n --> Grau de pertencimento de P ao subconjunto nebuloso 'perto (P)': %.3f\n", funcao_pertinencia_P_perto);
        end
    
        if(P_value >= 40)
            funcao_pertinencia_P_perto = 0;
            fprintf("\n --> Grau de pertencimento de P ao subconjunto nebuloso 'perto (P)': %.3f\n", funcao_pertinencia_P_perto);
        end
    end
    %       - longe (L):
    if(P_value < 10)
        funcao_pertinencia_P_longe = 0;
        fprintf("\n --> Grau de pertencimento de P ao subconjunto nebuloso 'longe (L)': %.3f\n", funcao_pertinencia_P_longe);
    else
        if(P_value >= 10 && P_value < 40)
            funcao_pertinencia_P_longe = (P_value-10)/30;
            fprintf("\n --> Grau de pertencimento de P ao subconjunto nebuloso 'longe (L)': %.3f\n", funcao_pertinencia_P_longe);
        end
    
        if(P_value >= 40)
            funcao_pertinencia_P_longe = 1;
            fprintf("\n --> Grau de pertencimento de P ao subconjunto nebuloso 'perto (P)': %.3f\n", funcao_pertinencia_P_longe);
        end
    end
    
    % --> Regra nebulosa da industrialização do destino (I):
    %       - alta (A):
    if(I_value < 10)
        funcao_pertinencia_I_alta = 0;
        fprintf("\n --> Grau de pertencimento de I ao subconjunto nebuloso 'alta (A)': %.3f\n", funcao_pertinencia_I_alta);
    else
        if(I_value >= 10 && I_value < 20)
            funcao_pertinencia_I_alta = (I_value-10)/10;
            fprintf("\n --> Grau de pertencimento de I ao subconjunto nebuloso 'alta (A)': %.3f\n", funcao_pertinencia_I_alta);
        end
    
        if(I_value >= 20)
            funcao_pertinencia_I_alta = 1;
            fprintf("\n --> Grau de pertencimento de I ao subconjunto nebuloso 'alta (A)': %.3f\n", funcao_pertinencia_I_alta);
        end
    end
    %       - baixa (B):
    if(I_value < 10)
        funcao_pertinencia_I_baixa = 1;
        fprintf("\n --> Grau de pertencimento de I ao subconjunto nebuloso 'baixa (B)': %.3f\n", funcao_pertinencia_I_baixa);
    else
        if(I_value >= 10 && I_value < 20)
            funcao_pertinencia_I_baixa = (20-I_value)/10;
            fprintf("\n --> Grau de pertencimento de I ao subconjunto nebuloso 'baixa (B)': %.3f\n", funcao_pertinencia_I_baixa);
        end
    
        if(I_value >= 20)
            funcao_pertinencia_I_baixa = 0;
            fprintf("\n --> Grau de pertencimento de I ao subconjunto nebuloso 'baixa (B)': %.3f\n", funcao_pertinencia_I_baixa);
        end
    end
    fprintf("\n-----------------------------------------------------------------------\n\n");

end

function [valor_final_de_ativacao_regras_1_e_3, valor_final_de_ativacao_regra_2, valor_final_de_ativacao_regra_4] = determinarValoresDeAtivacao(funcao_pertinencia_T_alta, funcao_pertinencia_T_baixa, funcao_pertinencia_U_alta, funcao_pertinencia_U_baixa, funcao_pertinencia_P_perto, funcao_pertinencia_P_longe, funcao_pertinencia_I_alta, funcao_pertinencia_I_baixa)
    valores_de_pertinencia_regra_1 = 0;
    valor_final_de_ativacao_regra_1 = 0;
    valores_de_pertinencia_regra_2 = 0;
    valor_final_de_ativacao_regra_2 = 0;
    valores_de_pertinencia_regra_3 = 0;
    valor_final_de_ativacao_regra_3 = 0;
    valores_de_pertinencia_regra_4 = 0;
    valor_final_de_ativacao_regra_4 = 0;
    valor_final_de_ativacao_regras_1_e_3 = 0;
    
    fprintf("\n---------- VALORES DE ATIVACAO PARA CADA UMA DAS QUATRO REGRAS ----------\n");
    % Aplicar os operadores AND/E (min do MATLAB) e OR/OU (max do MATLAB)
    
    % Regra 1: SE a temperatura for alta E a umidade for alta E a proximidade a água for perto E a industrialização for baixa ENTÃO a dose de quinino será alta
    valores_de_pertinencia_regra_1 = [funcao_pertinencia_T_alta, funcao_pertinencia_U_alta, funcao_pertinencia_P_perto, funcao_pertinencia_I_baixa];
    valor_final_de_ativacao_regra_1 = min(valores_de_pertinencia_regra_1);
    
    fprintf("\n --> Valor de ativacao da Regra 1: %.3f\n", valor_final_de_ativacao_regra_1);
    
    % Regra 2: SE a industrialização for alta ENTÃO a dose de quinino será baixa
    valores_de_pertinencia_regra_2 = [funcao_pertinencia_I_alta];
    valor_final_de_ativacao_regra_2 = valores_de_pertinencia_regra_2; % Aqui não precisa usar "min" nem "max"
    
    fprintf("\n --> Valor de ativacao da Regra 2: %.3f\n", valor_final_de_ativacao_regra_2);
    
    % Regra 3: SE a umidade for alta E a temperatura for alta E a industrialização for baixa OU a proximidade a água for perto ENTÃO a dose de quinino será alta
    % Aviso: Devido a seguinte observação do professor: "Obs. 1 – na Regra 3, executar o operador lógico OU antes do E."
    % tem-se a seguinte lógica: U_alta AND T_alta AND (I_baixa OR P_perto)
    valores_de_pertinencia_regra_3 = min([funcao_pertinencia_U_alta, funcao_pertinencia_T_alta, max([funcao_pertinencia_I_baixa, funcao_pertinencia_P_perto])]);
    valor_final_de_ativacao_regra_3 = valores_de_pertinencia_regra_3;
    
    fprintf("\n --> Valor de ativacao da Regra 3: %.3f\n", valor_final_de_ativacao_regra_3);
    
    % Regra 4: SE a temperatura for baixa E a umidade for baixa ENTÃO a dose de quinino será muito baixa
    valores_de_pertinencia_regra_4 = [funcao_pertinencia_T_baixa, funcao_pertinencia_U_baixa];
    valor_final_de_ativacao_regra_4 = min(valores_de_pertinencia_regra_4);
    
    fprintf("\n --> Valor de ativacao da Regra 4: %.3f\n", valor_final_de_ativacao_regra_4);
    
    % Percebe-se que ambas as Regras 1 e 3 dão valores para o conjunto nebuloso
    % "dose alta". Neste caso, o livro diz que tomaremos o valor máximo (MAX)
    valor_final_de_ativacao_regras_1_e_3 = max([valor_final_de_ativacao_regra_1, valor_final_de_ativacao_regra_3]);
    
    fprintf("\n --> Valor final de ativacao das Regras 1 e 3 com operador max(): %.3f\n", valor_final_de_ativacao_regras_1_e_3);
    fprintf("\n-----------------------------------------------------------------------\n\n");
end

function [funcao_pertinencia_Q_muito_baixa, funcao_pertinencia_Q_baixa, funcao_pertinencia_Q_alta] = definirEcalcularRegrasNebulosasDasSAIDAS(valor_final_de_ativacao_regras_1_e_3, valor_final_de_ativacao_regra_2, valor_final_de_ativacao_regra_4)
    funcao_pertinencia_Q_muito_baixa = 0;
    funcao_pertinencia_Q_baixa = 0;
    funcao_pertinencia_Q_alta = 0;
    %--------------------------------------------------------
    % DEFINIÇÃO DAS REGRAS NEBULOSAS DA SAÍDA DO SISTEMA (Q)
    %--------------------------------------------------------
    % --> Regra nebulosa da Saída de quinino do sistema (Q):
    fprintf("\n---------- VALORES DOS GRAUS DE PERTENCIMENTO PARA CADA SUBCONJUNTO DA SAIDA DE QUININO (Q) ----------\n");
    %       - dose muito baixa (M): % Só a Regra 4 retorna dose de quinino muito baixa
    funcao_pertinencia_Q_muito_baixa = valor_final_de_ativacao_regra_4;
    fprintf("\n --> Grau de pertencimento de Q ao subconjunto nebuloso 'dose muito baixa (M)': %.3f\n", funcao_pertinencia_Q_muito_baixa);
    
    %       - dose baixa (B): % Só a Regra 2 retorna dose de quinino baixa
    funcao_pertinencia_Q_baixa = valor_final_de_ativacao_regra_2;
    fprintf("\n --> Grau de pertencimento de Q ao subconjunto nebuloso 'dose baixa (B)': %.3f\n", funcao_pertinencia_Q_baixa);
    
    %       - dose alta (A): % As Regras 1 e 3 retornam dose de quinino alta, então, calculou-se o max() entre elas.
    funcao_pertinencia_Q_alta = valor_final_de_ativacao_regras_1_e_3;
    fprintf("\n --> Grau de pertencimento de Q ao subconjunto nebuloso 'dose alta (A)': %.3f\n", funcao_pertinencia_Q_alta);
    fprintf("\n-----------------------------------------------------------------------\n\n");
end

function dosagemNitidaFinal = desnebulizacaoSaidaQuinino(funcao_pertinencia_Q_muito_baixa, funcao_pertinencia_Q_baixa, funcao_pertinencia_Q_alta)
    %-----------------------------------
    % DESNEBULIZAÇÃO DAS REGRAS DA SAÍDA DO SISTEMA (Q)
    %-----------------------------------
    limiteSuperior = max([funcao_pertinencia_Q_muito_baixa, funcao_pertinencia_Q_baixa, funcao_pertinencia_Q_alta]);
    limiteInferior = 0;
    
    somatorioNumerador = 0;
    somatorioDenominador = 0;
    
    contMax = 100;
    i = 1;

    for cont = 1:5:contMax % Avança de 1 até 100, de cinco em cinco
        % Buscar o limite superior manualmente
        if(funcao_pertinencia_Q_alta > funcao_pertinencia_Q_baixa && funcao_pertinencia_Q_alta > funcao_pertinencia_Q_muito_baixa)
            % Sabendo qual é o limite superior, buscamos o limite inferior manualmente (que é o maior valor excluindo o limite superior)
            if(funcao_pertinencia_Q_baixa > funcao_pertinencia_Q_muito_baixa)
                limiteInferior = funcao_pertinencia_Q_baixa;
                %fprintf("\nLimite inferior: %.3f\n", limiteInferior);
            else
                limiteInferior = funcao_pertinencia_Q_muito_baixa;
                %fprintf("\nLimite inferior: %.3f\n", limiteInferior);
            end
        else
            % Buscar o limite superior manualmente
            if(funcao_pertinencia_Q_baixa > funcao_pertinencia_Q_alta && funcao_pertinencia_Q_baixa > funcao_pertinencia_Q_muito_baixa)
                % Sabendo qual é o limite superior, buscamos o limite inferior manualmente (que é o maior valor excluindo o limite superior)
                if(funcao_pertinencia_Q_alta > funcao_pertinencia_Q_muito_baixa)
                    limiteInferior = funcao_pertinencia_Q_alta;
                    %fprintf("\nLimite inferior: %.3f\n", limiteInferior);
                else
                    limiteInferior = funcao_pertinencia_Q_muito_baixa;
                    %fprintf("\nLimite inferior: %.3f\n", limiteInferior);
                end
            end

            % Buscar o limite superior manualmente
            if(funcao_pertinencia_Q_muito_baixa > funcao_pertinencia_Q_alta && funcao_pertinencia_Q_muito_baixa > funcao_pertinencia_Q_baixa)
                % Sabendo qual é o limite superior, buscamos o limite inferior manualmente (que é o maior valor excluindo o limite superior)
                if(funcao_pertinencia_Q_alta > funcao_pertinencia_Q_baixa)
                    limiteInferior = funcao_pertinencia_Q_alta;
                else
                    limiteInferior = funcao_pertinencia_Q_baixa;
                end
            end
        end
        j = i * 5;
        
        

        somatorioNumerador = somatorioNumerador + j*(limiteSuperior-(j*0.01199999999999999));
        somatorioDenominador = somatorioDenominador + limiteSuperior-(j*0.01199999999999999);

        
        i = i + 1;

        if(limiteInferior > (limiteSuperior-(j*0.01199999999999999)))% Garante que não multiplicaremos valores abaixo do limite inferior apropriado
            break;
        end
    end
    
    centroide_valor_desnebulizado = somatorioNumerador/somatorioDenominador;
    fprintf("\nValor desnebulizado (dose real de quinino): %.3f\n", centroide_valor_desnebulizado);
    dosagemNitidaFinal = centroide_valor_desnebulizado;
end