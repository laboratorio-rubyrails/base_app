namespace :db do
  desc "Llenamos la base"
  task llenaDB: :environment do
    Usuario.create!(nombre: "Alfredo Pavel",
                 email: "laboratorio.rubyrails@gmail.com",
                 password: "testing00",
                 password_confirmation: "testing00",
                 admin: true)
    99.times do |n|
      nombre  = Faker::Name.name
      email = "usuario_test#{n+1}@ejemplo.org"
      password  = "testing#{n+1}"
      Usuario.create!(nombre: nombre,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    usuarios = Usuario.all(limit: 5)
    50.times do
      contenido = Faker::Lorem.sentence(6)
      usuarios.each { |usuario| usuario.mensajes.create!(contenido: contenido) }
    end
  end
end