require './author.rb'
require './book.rb'
require './order.rb'
require './reader.rb'


class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
  end

  def the_most_popular_book
    find_by_orders
  end

  def who_often_takes_the_book

  end


  private

  def find_by_orders
    book_orders = @orders.group_by { |order| order.book.title }
    book_orders.sort_by { |title, orders| orders.size }.last
  end
  
end