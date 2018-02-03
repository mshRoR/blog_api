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

ActiveRecord::Schema.define(version: 20180203115042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "auth_tokens", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "token",      null: false
    t.text     "public_key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_auth_tokens_on_token", using: :btree
  end

  create_table "posts", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade, comment: "Store All Posts" do |t|
    t.string   "title",       null: false, comment: "Post Title"
    t.text     "description", null: false, comment: "Post Description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade, comment: "User Details" do |t|
    t.string   "name",                           null: false
    t.string   "email",                          null: false
    t.string   "username",                       null: false
    t.string   "password_digest",                null: false
    t.integer  "role",            default: 0,    null: false
    t.boolean  "is_active",       default: true, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

end
