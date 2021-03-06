# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20220405205821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comentarios", force: :cascade do |t|
    t.string   "titulo"
    t.text     "conteudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "livro_id"
  end

  add_index "comentarios", ["livro_id"], name: "index_comentarios_on_livro_id", using: :btree

  create_table "livros", force: :cascade do |t|
    t.string   "nome"
    t.string   "autor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "usuario_id"
    t.boolean  "concluido"
    t.string   "imagem"
  end

  add_index "livros", ["usuario_id"], name: "index_livros_on_usuario_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comentarios", "livros"
  add_foreign_key "livros", "usuarios"
end
