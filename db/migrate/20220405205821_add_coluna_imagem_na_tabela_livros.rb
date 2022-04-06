class AddColunaImagemNaTabelaLivros < ActiveRecord::Migration
  def change
    add_column :livros, :imagem, :string
    remove_column :livros, :comentario
  end
end
