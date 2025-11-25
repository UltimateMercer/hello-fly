# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
puts "Clearing existing greetings..."
Greeting.destroy_all

# Create sample greetings
puts "Creating sample greetings..."

greetings_data = [
  { message: "Hello from Rails with PostgreSQL!", name: "Rails Developer" },
  { message: "Welcome to our API", name: "API User" },
  { message: "Greetings from the database!", name: "PostgreSQL" },
  { message: "This is a test greeting", name: "Tester" },
  { message: "Hello World!", name: nil },
  { message: "Ruby on Rails rocks!", name: "Ruby Fan" },
  { message: "PostgreSQL is powerful", name: "DB Admin" },
  { message: "API endpoints are working", name: "Backend Dev" },
  { message: "Sample data loaded successfully", name: "System" },
  { message: "Enjoy using this Rails app!", name: "Creator" }
]

greetings_data.each do |greeting_attrs|
  Greeting.create!(greeting_attrs)
  print "."
end

puts "\n✅ Created #{Greeting.count} greetings!"
puts "\nSeed data loaded successfully!"
