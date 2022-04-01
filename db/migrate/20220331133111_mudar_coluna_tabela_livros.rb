class MudarColunaTabelaLivros < ActiveRecord::Migration
  def change
      remove_column :livros, :status
      add_column :livros, :concluido, :boolean
  end
end
