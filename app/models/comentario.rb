class Comentario < ActiveRecord::Base
  belongs_to :livro
  validates :titulo, presence: true
  validates :conteudo, presence: true
end
