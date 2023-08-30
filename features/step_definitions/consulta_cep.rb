Dado("que eu faça uma consulta do CEP e valide as informações da consulta") do |table|
  table.hashes.each do |row|
    cep = row["cep"]
    bairro = row["bairro"]
    logradouro = row["logradouro"]
    localidade = row["localidade"]
    uf = row["uf"]
    ibge = row["ibge"]
    ddd = row["ddd"]
    siafi = row["siafi"]

    @response = HTTParty.get("/#{cep}/json/")

    response_data = JSON.parse(@response.body)
    expect(response_data["bairro"]).to eq(bairro)
    expect(response_data["logradouro"]).to eq(logradouro)
    expect(response_data["localidade"]).to eq(localidade)
    expect(response_data["uf"]).to eq(uf)
    expect(response_data["ibge"]).to eq(ibge)
    expect(response_data["ddd"]).to eq(ddd)
    expect(response_data["siafi"]).to eq(siafi)
  end
end

Dado("que eu faça uma consulta do CEP") do |table|
  cep = table.hashes.first["cep"]
  @response = HTTParty.get("/#{cep}/json/")
end

Dado("que faça uma consulta do CEP {string}") do |cep|
  @response = HTTParty.get("/#{cep}/json/")
end

Então("o CEP é consultado com sucesso") do
  expect(@response.code).to eql 200
end

Dado("que faça uma consulta pelo CEP {string}") do |cep|
  @response = HTTParty.get("/#{cep}/json/")
end

Então("valido todas as informações da consulta {string} {string} {string} {string} {string} {string}") do |logradouro, bairro, localidade, uf, ibge, ddd|
  response_data = JSON.parse(@response.body)
  expect(response_data["bairro"]).to eq(bairro)
  expect(response_data["logradouro"]).to eq(logradouro)
  expect(response_data["localidade"]).to eq(localidade)
  expect(response_data["uf"]).to eq(uf)
  expect(response_data["ibge"]).to eq(ibge)
  expect(response_data["ddd"]).to eq(ddd)
end
