
require 'yaml'
require 'faker'
require_relative "library"
require_relative "data.rb"

DataBase.new if File.zero?('data.yml')
library = Library.new
library.load_data


p "The most popular book in the library is #{library.most_popular_book}"
p "#{library.who_often_takes_the_book} likes to read the most"
p "#{library.count_fans_of_three_popular_books} of our readers ordered one of three most popular books"



  