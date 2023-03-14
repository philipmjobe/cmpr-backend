require 'csv'

# # User.create(first_name: "Lee", last_name: "Carver", email: "lee@test.com")

csv_text = File.read(Rails.root.join('lib', 'seeds', 'CanadaCamp.csv'))
put csv_text