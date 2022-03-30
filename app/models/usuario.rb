class Usuario < ActiveRecord::Base

    has_many :livros, dependent: :destroy

    validates :nome, :presence => true
    validates :email, presence: true, uniqueness: true, on: :create
    validates :senha, presence: true, length: {minimum: 8}

end
