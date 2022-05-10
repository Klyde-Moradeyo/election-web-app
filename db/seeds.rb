# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# creating or finding first admin User
role = Role.find_or_create_by(name: 'admin') # create or find admin role
admin = User.create_or_find_by( first_name: "admin", last_name: "Moradeyo", email: "admin@klydemoradeyo.com",
                                password: "12345678", password_confirmation: '12345678', roles: [role],
                                confirmed_at: DateTime.now)

# Creating or finding User                         
user_role = Role.find_or_create_by(name: 'newuser')
user = User.create_or_find_by(  first_name: "Klyde", last_name: "Moradeyo", email: "km00905@surrey.ac.uk",
                                password: "12345678", password_confirmation: '12345678', roles: [user_role],
                                confirmed_at: DateTime.now)

ballot = Ballot.create_or_find_by(title: "title", description: "desc", start_date: DateTime.now,
                                  end_date: DateTime.now + 3.days, show_voter_results: true,
                                  expected_voters: 50, voting_type: "Popular vote")
