require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'pg'
  gem 'activerecord'
end
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "safari_adventure"
)
class Animal < ActiveRecord::Base
end

#p Animal.all

#p Animal.count

loop do
  puts "What do you want to do?"

  command = gets.chomp
  if command == "display_all"
    puts "It's a zoo in here #{command}."
    p Animal.all
    # get all the animals
    break
  elsif command == "increment"
    puts "What species is this?"

    species = gets.chomp.downcase
    animal = Animal.find_by({ "species" => species })
    animal.seen_count += 1
    animal.save
    puts "#{animal.species} count: #{animal.seen_count}"
    break
  elsif command == "species"
    puts "What species are you looking for?"
    species_name = gets.chomp.downcase
    animal = Animal.find_by({ "species" => species_name })
    puts "Found the animal #{animal.id} which is a #{animal.species.capitalize} where animal was seen #{animal.last_seen_location} number of animals #{animal.seen_count}"
    break
  elsif command == "spot"
    puts "What species are you looking for?"
    species_name = gets.chomp.downcase
    puts "Send location"
    location = gets.chomp.downcase
    animal = Animal.find_by({ "species" => species_name })
    animal.last_seen_location = location
    animal.save
    break
  end
  
    # use "puts" to print details about all the animals

 # incriment = Animal.find_by({ "species" => "Lion" })
end