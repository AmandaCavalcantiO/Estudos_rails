class Livro < ActiveRecord::Base
  belongs_to :usuario
  has_many :comentarios, dependent: :destroy
  validates :autor, presence: true
  validates :nome, presence: true

  scope :leitura_concluida, -> { where(concluido: true) }
  scope :leitura_pendente, -> { where(concluido: false) }

end
