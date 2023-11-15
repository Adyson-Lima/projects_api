puts 'Gerando projects...'

5.times do |i|
  Project.create(
    name: ["API", "Fullstack"].sample ,
    tool: ["react","rails"].sample
    )
end

puts 'projects gerados com sucesso!'
