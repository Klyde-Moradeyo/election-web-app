# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

role = Role.find_or_create_by(name: 'admin') # create or find admin role
# creating or finding first admin user
User.create_or_find_by(first_name: "admin", last_name: "user", email: "admin@esa.com",
                       password: "ESA_admin_user", password_confirmation: 'ESA_admin_user', roles: [role],
                       confirmed_at: DateTime.now)
