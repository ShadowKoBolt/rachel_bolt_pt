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

ActiveRecord::Schema.define(version: 20170917102121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.text "address"
    t.string "mobile"
    t.string "occupation"
    t.string "support_contact"
    t.string "catchup_contact"
    t.boolean "smoke"
    t.boolean "pregnant"
    t.boolean "medical_heart"
    t.boolean "medical_chest_pain"
    t.boolean "medical_dizzy"
    t.boolean "medical_high_blood_pressure"
    t.boolean "medical_arthritis"
    t.boolean "medical_asthma"
    t.boolean "medical_bone_or_joint_problems"
    t.boolean "medical_back_problems"
    t.boolean "medical_epilepsy"
    t.boolean "medical_sports_injury"
    t.boolean "medical_depression"
    t.text "medical_other"
    t.string "skype_username"
    t.string "stripe_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.string "slug"
    t.string "name"
    t.index ["slug"], name: "index_videos_on_slug", unique: true
  end

end
