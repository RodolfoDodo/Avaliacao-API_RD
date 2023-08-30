            # language: pt

            Funcionalidade: Consulta de CEP com Sucesso
            Consulta CEP de todo o Brasil através do serviço da ViaCEP

            #Este cenário e o modelo de Data Table
            #Ele informar um cep e valida as informações do response retornada
            #Caso queira um cenario de erro basta mudar alguma informação que na validação vai acontecer o erro
            Cenario: Consulta CEP no modelo Data Table
            Dado que eu faça uma consulta do CEP e valide as informações da consulta
            | cep      | logradouro                      | bairro           | localidade  | uf | ibge    | ddd | siafi |
            | 33082200 | Rua Belém                       | Padre Miguel     | Santa Luzia | MG | 3157807 | 31  | 5155  |
            | 32405400 | Avenida João Evangelista Grossi | Novo Barreirinho | Ibirité     | MG | 3129806 | 31  | 4595  |

            #Este cenário e o modelo de Data Table
            #Ele pode ser usado para executar varias vezes o mesmo teste assim gerando uma massa de teste unica
            #Validando se a consulta foi realizada com sucesso pelo status code 200
            Cenario: Consulta CEP no modelo Data Table Somente o CEP
            Dado que eu faça uma consulta do CEP
            | cep      |
            | 33082200 |
            | 32405400 |
            Então o CEP é consultado com sucesso

            #Modelo de cenario simples informando a pesquisar de um unico CEP
            #Validando se a consulta foi realizada com sucesso pelo status code 200
            Cenário: Consultar um CEP com Sucesso e validar o Status Code
            Dado que faça uma consulta do CEP "32405400"
            Então o CEP é consultado com sucesso

            #Esquema do Cenario utilizado para pesquisar varios ceps
            #Ele pode ser usado para executar varias vezes o mesmo teste assim gerando uma massa de teste unica
            #Validando o status code se foi 200
            Esquema do Cenário: Consulta de varios CEP e Validando o retorno do Status Code
            Dado que faça uma consulta pelo CEP "<cep>"
            Então o CEP é consultado com sucesso

            Exemplos:
            | cep      |
            | 33082200 |
            | 32405400 |

            #Esquema de Cenário muito usado para executar um teste com varias validações
            #Ele pode ser usado para executar varias vezes o mesmo teste assim gerando uma massa de teste unica
            #Neste cenario estou consultando um cep e validando todas as informações
            Esquema do Cenário: Consulta CEP e valida as informações de Retorno
            Dado que faça uma consulta pelo CEP "<cep>"
            Então valido todas as informações da consulta "<logradouro>" "<bairro>" "<localidade>" "<uf>" "<ibge>" "<ddd>"

            Exemplos:
            | cep      | logradouro                      | bairro           | localidade  | uf | ibge    | ddd |
            | 33082200 | Rua Belém                       | Padre Miguel     | Santa Luzia | MG | 3157807 | 31  |
            | 32405400 | Avenida João Evangelista Grossi | Novo Barreirinho | Ibirité     | MG | 3129806 | 31  |





