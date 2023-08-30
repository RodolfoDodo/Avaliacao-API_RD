require "httparty"

# Definindo a url do projeto por padrão para não ficar chamando ela nos steps
# Isso facilita na manutenção do codigo caso um dia ela mude
HTTParty::Basement.base_uri "https://viacep.com.br/ws"
