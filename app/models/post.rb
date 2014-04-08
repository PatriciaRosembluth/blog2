  class Post < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :title, presence: true,
                    length: { minimum: 5 }

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