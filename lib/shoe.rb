class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => { :maximum => 100 }})
  validates(:price, {:presence => true, :length => { :maximum => 12 }})
  before_save(:capitalize)
  before_save(:monify)

  define_method(:capitalize) do
    words = self.brand.split(" ")
    words.each do |word|
      word.capitalize!()
    end
    self.brand=(words.join(" "))
  end

  define_method(:monify) do
    self.price = self.price.to_f.round(2)
  end
end
