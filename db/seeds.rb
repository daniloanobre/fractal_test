# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors = Author.create([{ name: "Ayn Rand", email: "silva.ss@gmail.com", writing_style: 0, library_agreement_attributes: { starting_date: "01/01/2017" , duration: 12 } },
                         { name: "Sigmund Freud", email: "nobre@gmail.com", writing_style: 3, library_agreement_attributes: { starting_date: "01/01/2017" , duration: 24 } },
                         { name: "Olivia Laing", email: "silva@gmail.com", writing_style: 1, library_agreement_attributes: { starting_date: "01/01/2017" , duration: 36 } }])

author = Author.first

books = author.books.create([{ title: "Game of Thrones", year: 2017 },
  { title: "Senhor dos Anéis", year: 2016 }])

book = Book.first.chapters = Chapter.create([{ title: "Chapter 1", content: "Content of this chapter", book_id: Book.first.id }, { title: "Chapter 2", content: "Content of chapter two", book_id: Book.first.id }])
