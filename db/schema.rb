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

ActiveRecord::Schema.define(version: 20140625232608) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "beginDate"
    t.date     "endDate"
    t.integer  "ref",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id", limit: 4
  end

  add_index "activities", ["project_id"], name: "index_activities_on_project_id", using: :btree

  create_table "activity_states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignements", force: :cascade do |t|
    t.integer "task_id",     limit: 4
    t.integer "employee_id", limit: 4
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "task_id",     limit: 4
    t.integer  "employee_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["employee_id"], name: "index_assignments_on_employee_id", using: :btree
  add_index "assignments", ["task_id"], name: "index_assignments_on_task_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "fax",        limit: 255
    t.string   "website",    limit: 255
    t.integer  "ref",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar",     limit: 255
    t.integer  "contact_id", limit: 4
  end

  add_index "companies", ["contact_id"], name: "index_companies_on_contact_id", using: :btree

  create_table "document_types", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.string   "ref",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "link",             limit: 255
    t.date     "date"
    t.integer  "document_type_id", limit: 4
    t.integer  "activity_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_file_name",   limit: 255
  end

  add_index "documents", ["activity_id"], name: "index_documents_on_activity_id", using: :btree
  add_index "documents", ["document_type_id"], name: "index_documents_on_document_type_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.string   "link",        limit: 255
    t.integer  "project_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["project_id"], name: "index_images_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.date     "date"
    t.text     "description",    limit: 65535
    t.integer  "ref",            limit: 4
    t.integer  "responsible_id", limit: 4
    t.integer  "type",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id",     limit: 4
  end

  add_index "projects", ["contact_id"], name: "index_projects_on_contact_id", using: :btree
  add_index "projects", ["responsible_id"], name: "index_projects_on_responsible_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "task_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "duration",     limit: 4
    t.string   "state",        limit: 255
    t.integer  "task_type_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id",  limit: 4
  end

  add_index "tasks", ["activity_id"], name: "index_tasks_on_activity_id", using: :btree
  add_index "tasks", ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "firstname",              limit: 255
    t.string   "phone",                  limit: 255
    t.string   "fax",                    limit: 255
    t.string   "function",               limit: 255
    t.integer  "zip",                    limit: 4
    t.string   "city",                   limit: 255
    t.string   "country",                limit: 255
    t.string   "address",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "type",                   limit: 255
    t.integer  "company_id",             limit: 4
    t.string   "avatar",                 limit: 255
    t.string   "db_token",               limit: 255
    t.string   "db_secret",              limit: 255
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
