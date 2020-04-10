# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_10_105508) do

  create_table "alcohols", force: :cascade do |t|
    t.string "name"
    t.string "colour"
    t.integer "alcohol_content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cocktail_alcohols", force: :cascade do |t|
    t.integer "cocktail_id", null: false
    t.integer "alcohol_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alcohol_id"], name: "index_cocktail_alcohols_on_alcohol_id"
    t.index ["cocktail_id"], name: "index_cocktail_alcohols_on_cocktail_id"
  end

  create_table "cocktail_garnishes", force: :cascade do |t|
    t.integer "cocktail_id", null: false
    t.integer "garnish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_cocktail_garnishes_on_cocktail_id"
    t.index ["garnish_id"], name: "index_cocktail_garnishes_on_garnish_id"
  end

  create_table "cocktail_mixers", force: :cascade do |t|
    t.integer "cocktail_id", null: false
    t.integer "mixer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_cocktail_mixers_on_cocktail_id"
    t.index ["mixer_id"], name: "index_cocktail_mixers_on_mixer_id"
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.string "instructions"
    t.string "description"
    t.string "difficulty"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cocktails_on_user_id"
  end

  create_table "garnishes", force: :cascade do |t|
    t.string "name"
    t.boolean "edible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mixers", force: :cascade do |t|
    t.string "name"
    t.string "sweet_sour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "favourite_cocktail"
    t.string "location"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cocktail_alcohols", "alcohols"
  add_foreign_key "cocktail_alcohols", "cocktails"
  add_foreign_key "cocktail_garnishes", "cocktails"
  add_foreign_key "cocktail_garnishes", "garnishes"
  add_foreign_key "cocktail_mixers", "cocktails"
  add_foreign_key "cocktail_mixers", "mixers"
  add_foreign_key "cocktails", "users"
end
