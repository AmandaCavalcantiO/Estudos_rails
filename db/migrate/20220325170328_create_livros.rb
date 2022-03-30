class CreateLivros < ActiveRecord::Migration
  def change
    create_table :livros do |t|
      t.string :nome
      t.string :autor
      t.string :status
      t.text :comentario
      t.references :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
