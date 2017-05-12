class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes, dependent: :destroy)
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  before_save(:capitalize)

  define_method(:capitalize) do
    words = self.name.split(" ")
    words.each do |word|
      word.capitalize!()
    end
    self.name=(words.join(" "))
  end
end
