class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => { :maximum => 20 }})
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
    if self.to_s.split('').include?('.')
      self.price = self.price.to_f.round(2)
    else
      num_a = self.price.to_s.split('')
      num_a.push('.00')
      new_num = num_a.join('').to_f
      self.price = new_num
    end
  end

end
