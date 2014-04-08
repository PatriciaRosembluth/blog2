  class Post < ActiveRecord::Base
  after_create :likes_Cero
  has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :title, presence: true,
                    length: { minimum: 5 }
  def likes_Cero
	likes=0
  end

  def correspondeApost(texto)
    texto_a_buscar = self.text.split
    texto_a_buscar.each do |palabra|
      if palabra.downcase.include?(texto.downcase)
	     return true
    end
  end
  false
  end

end