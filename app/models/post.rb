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
end