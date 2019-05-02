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

ActiveRecord::Schema.define(version: 2019_05_02_040938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_reviews", force: :cascade do |t|
    t.string "content"
    t.string "description"
    t.bigint "customer_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_reviews_on_customer_id"
    t.index ["worker_id"], name: "index_customer_reviews_on_worker_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "description"
    t.string "title"
    t.bigint "customer_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_jobs_on_customer_id"
    t.index ["worker_id"], name: "index_jobs_on_worker_id"
  end

  create_table "worker_reviews", force: :cascade do |t|
    t.string "content"
    t.string "description"
    t.bigint "customer_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_worker_reviews_on_customer_id"
    t.index ["worker_id"], name: "index_worker_reviews_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "experience"
    t.string "description"
    t.string "firstname" 
    t.string "lastname"
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
    t.index ["username"], name: "index_workers_on_username", unique: true
  end

end
