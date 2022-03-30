class AddReferenciasToLivros < ActiveRecord::Migration
  def change
    change_table :livros do |t|
      t.references :usuario, index: true, foreign_key: true
    end
  end
end
