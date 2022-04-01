class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :titulo
      t.text :conteudo
      t.timestamps null: false
      t.references :livro, index: true, foreign_key: true
    end
  end
end
