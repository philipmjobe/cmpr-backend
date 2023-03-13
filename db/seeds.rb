require 'csv'

# User.create(first_name: "Lee", last_name: "Carver", email: "lee@test.com")

CSV.foreach('csv/CanadaCamp.csv', "r:ISO-8859-1", headers: true) do |row|
  Campground.create!(row.to_hash)
end