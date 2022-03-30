class Livro < ActiveRecord::Base
  belongs_to :usuario

  validates :autor, presence: true
  validates :nome, presence: true

end
