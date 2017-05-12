class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => { :maximum => 20 }})
  validates(:price, {:presence => true, :length => { :maximum => 12 }})
  before_save(:capitalize)

  define_method(:capitalize) do
      words = self.brand.split(" ")
      words.each do |word|
        word.capitalize!()
      end
      self.brand=(words.join(" "))
  end

end
