class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader)
    @book, @reader = book, reader
    @date = Time.now.strftime("%d/%m/%Y %H:%M")
  end

end