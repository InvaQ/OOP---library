class DataBase

  def initialize
    readers, authors, books, orders = [], [], [], []

    15.times do
      readers << Reader.new(Faker::Name.name, Faker::Internet.email, Faker::Address.city, 
                            Faker::Address.street_name, Faker::Address.building_number)
      authors << Author.new(Faker::Name.name, Faker::Lorem.sentence)
      books << Book.new(Faker::Book.title, authors.sample)
      orders << Order.new(books.sample, readers.sample)
    end
    buffer = Library.new(readers, authors, books, orders)

    File.open('data.yml', 'w') do |string|
      string.write buffer.to_yaml
    end
  end

end