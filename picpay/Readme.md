# Ambiente
- RUBY
- RSPEC
- HttParty

Desenvolvimento executado no "Visual Studio Code"

# Setup
Tendo o Ruby instalado, no terminal dentro da raiz do projeto digitar o comando "Bundle Install" para a instalação das GEMS contendo: RSPEC e HttParty

# Execução
Na pasta RAIZ:
 - "rspec .\spec\" (para rodar todos os testes)
 - "rspec .\spec\[nome do cenario]" (para rodar um teste especifico)

Ex: rspec .\spec\_todososcenarios_spec.rb

# Evidencias
No final da execução é gerado um relatorio de log na pasta .\log


# Explicando os passos criados
- Para ficar bem claro criei os cenarios de 1 a 3 para repartir o que foi solicitado e para ser validado por vcs em separado
- Como fiquei em dúvidas se vcs realmente queriam algo de ponta a ponta criei o passo "_todososcenarios_spec.rb", onde tudo eh executado com apenas um usuario
- Para garantir que todos os testes funcionam de forma independente no final de todos os testes eu APAGO o registro para não impactar as proximas execuções
- Nos cenarios padrões (delete, post, put, get) não tenho o cuidado com a massa de testes, gerando apenas usuarios aleatorios (não eh uma pratica correta) fiz apenas para mostrar outra forma de execuções
- E Claro se tivesse acesso a Base de Dados teria criado um script para limpeza da Base sempre antes das execuções, principalmente para regressão



# Observação
- Não utilizei cucumber com gherkin por motivo de tempo

- Entendo que o teste eh pedido para ver o conhecimento das ferramentas, nao fiz todos os testes necessário para um teste completo porque essa nao era a ideia mas sei q precisamos testar usuarios em duplicados, inexistentes, invalidos, etc... e assim por diante

- Tambem nao fiz todos os testes para todos os retornos, conforme lista abaixo, pois não tem documentação com todos os retornos existentes fora os padroes

- Não fiz validações do corpo todo pois o conhecimento esta implicido nos testes, ver _cenario2

- Espero que tudo tenha ficado claro e vcs possam executar o teste com facilidade pois foi feito com muito carinho

- Agradeço a oportunidade, OBRIGADO!


# Retornos padrões de Status Codes:

1XX: Informações (pouco usado)

2XX: Sucesso (tudo certo)
- 200 => Genérico indicando que deu tudo certo
- 201 => Algo foi criado
- 202 => Aceito
- 204 => Sem conteúdo (no Body)

3XX: Redirects (muito usado em sistemas antigos)

4XX: Erro do lado do cliente
- 400 => Requisição mal formatada ou inválida
- 404 => Nada encontrado
- 401 => Sem autorização (normalmente quando não envia o token)
- 409 => Conflito de informações (usuário duplicado ou alguma regra de negócio)
- 412 => Alguma precondição não foi atendida (dados obrigatórios por exemplo)

5XX: Erro do lado do servidor (backend)
- 500 => Famoso 500tão (Internal Server Error)
- 503 => Indisponível