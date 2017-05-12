class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => { :maximum => 100 }})
  validates(:price, {:presence => true, :length => { :maximum => 12 }})
  before_save(:capitalize)
  before_save(:monify)

  define_method(:capitalize) do
    words = self.brand.split(" ")
    excluded_words = ["and", "of", "And", "Of", "AND", "OF"]
    words.each do |word|
      if excluded_words.include?(word)
        word.downcase!
      else
        word.capitalize!()
      end
    end
    self.brand=(words.join(" "))
  end

  define_method(:monify) do
    self.price = self.price.to_f.round(2)
  end

  define_method(:display_price) do
    fancy_price = self.price.to_s
    fancy_price = "$" + ("%0.2f" % (fancy_price))
    fancy_price
  end
end
