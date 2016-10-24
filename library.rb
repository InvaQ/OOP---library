require_relative "author"
require_relative "book"
require_relative "order"
require_relative "reader"

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize(readers = nil, authors = nil, books = nil, orders = nil)
    @readers, @authors, @books, @orders = readers, authors, books, orders
  end

  def most_popular_book
    find_by_orders(3)[0][0]
  end

  def who_often_takes_the_book
    @orders.group_by { |order| order.reader.name }.sort_by { |name, orders| orders.size }.last[0]
  end

  def count_fans_of_three_popular_books    
    find_by_orders(3).map { |e| e[1] }.flatten.map { |order| order.reader.name }.uniq.size    
  end


  def self::fill_data
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
  
  def load_data
      @temp = YAML.load_file('data.yml')
      @books = @temp.books
      @orders = @temp.orders
      @readers = @temp.readers
      @authors = @temp.authors    
  end
  

  private
  def find_by_orders(amount)
    @orders.group_by { |order| order.book.title }.sort_by { |title, orders| orders.size }.last(amount)
  end  
  
end