class Post < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :category, presence: true,
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

  def EstaEnPost(categoria)
    categoria_a_buscar = self.category.split('')
    categoria_a_buscar.each do |letra|
      if letra.downcase.include?(categoria.downcase)
       return true
      end
    end
    false
  end
end

 
