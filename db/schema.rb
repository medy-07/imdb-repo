# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_26_170253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_actors_on_city_id"
  end

  create_table "actors_movies", force: :cascade do |t|
    t.bigint "actor_id"
    t.bigint "movie_id"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_actors_movies_on_actor_id"
    t.index ["movie_id"], name: "index_actors_movies_on_movie_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_comments_on_movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directors_movies", force: :cascade do |t|
    t.bigint "director_id"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["director_id"], name: "index_directors_movies_on_director_id"
    t.index ["movie_id"], name: "index_directors_movies_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "gen_title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movie_casts", force: :cascade do |t|
    t.bigint "actor_id"
    t.bigint "movie_id"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_movie_casts_on_actor_id"
    t.index ["movie_id"], name: "index_movie_casts_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.date "release_date"
    t.integer "budget"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "attachment"
  end

  create_table "movies_reviewers", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "reviewer_id"
    t.integer "review_stars"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_movies_reviewers_on_movie_id"
    t.index ["reviewer_id"], name: "index_movies_reviewers_on_reviewer_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "reviewer_id"
    t.integer "review_stars"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
    t.index ["reviewer_id"], name: "index_ratings_on_reviewer_id"
  end

  create_table "reviewers", force: :cascade do |t|
    t.string "rev_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "movies"
end
