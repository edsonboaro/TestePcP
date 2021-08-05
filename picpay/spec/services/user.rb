class ApiUser
  include HTTParty
  base_uri "https://gorest.co.in/public-api"
  headers "Content-Type" => "application/json; charset=utf-8"

  def self.save(user)
    post("/users", body: user.to_json, headers: { "Authorization" => "Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba" })
  end

  def self.update(id, user)
    put("/users/#{id}", body: user.to_json, headers: { "Authorization" => "Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba" })
  end

  def self.remove(user)
    delete("/users/#{user}", headers: { "Authorization" => "Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba" })
  end

  def self.validate(user)
    get("/users/#{user}", headers: { "Authorization" => "Bearer 2275e2cbbf8dc1d113b25fb018cdb2e07e088b35bb5f7b7c13ca160ed96a82ba" })
  end

  def self.full()
    get("/users")
  end

  def self.list(user)
    puts "ATENÇÃO: Aqui demora um pouco porque esta interagindo com toda a lista atraves de paginas"
    @ListaCompleta = get("/users")
    for i in 1..@ListaCompleta["meta"]["pagination"]["pages"]
      parada = false
      @ListaCompleta = get("/users?page=" + i.to_s)

      @ListaCompleta["data"].each do |pagina|
        if pagina["id"] == user["id"]
          puts "**************************************************************************************"
          puts "Usuario encontrado na página " + i.to_s + " utilizando endpoint 'Listar todos Usuarios'"
          puts "**************************************************************************************"
          parada = true
          break
        end
      end
      if parada then break end
    end
  end
end
