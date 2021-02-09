# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nathan = User.create(username: "nathan", password: "drums", first_name: "Nathan", last_name: "Lewis")
marshall = User.create(username: "marshall", password: "drums", first_name: "Marshall", last_name: "Lewis")
katie = User.create(username: "katie", password: "drums", first_name: "Katie", last_name: "Lewis")
hs = Audition.create(school: "High School", year: DateTime.new(2021))
nathan.auditions << hs
marshall.auditions << hs
katie.auditions << hs
flute = Instrument.create(name: "Flute", available_spots: 8)
clarinet = Instrument.create(name: "Clarinet", available_spots: 8)
oboe = Instrument.create(name: "Oboe", available_spots: 8)
bassoon = Instrument.create(name: "Bassoon", available_spots: 8)
trumpet = Instrument.create(name: "Trumpet", available_spots: 8)
horn = Instrument.create(name: "Horn", available_spots: 8)
euphonium = Instrument.create(name: "Euphonium", available_spots: 8)
trombone = Instrument.create(name: "Trombone", available_spots: 8)
tuba = Instrument.create(name: "Tuba", available_spots: 8)
percussion = Instrument.create(name: "Percussion", available_spots: 8)
flute.audition = hs
clarinet.audition = hs
oboe.audition = hs
bassoon.audition = hs
trumpet.audition = hs
horn.audition = hs
euphonium.audition = hs
trombone.audition = hs
tuba.audition = hs
percussion.audition = hs
player1 = Player.create(first_name: "John", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player1.instrument = flute
player1.audition = hs
player1.save
player2 = Player.create(first_name: "Jill", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player2.instrument = oboe
player2.audition = hs
player2.save
player3 = Player.create(first_name: "Jack", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player3.instrument = clarinet
player3.audition = hs
player3.save
player4 = Player.create(first_name: "Mark", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player4.instrument = bassoon
player4.audition = hs
player4.save
player5 = Player.create(first_name: "Mel", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player5.instrument = trumpet
player5.audition = hs
player5.save
player6 = Player.create(first_name: "Larry", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player6.instrument = horn
player6.audition = hs
player6.save
player7 = Player.create(first_name: "Leta", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player7.instrument = euphonium
player7.audition = hs
player7.save
player8 = Player.create(first_name: "Leon", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player8.instrument = trombone
player8.audition = hs
player8.save
player9 = Player.create(first_name: "Rick", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player9.instrument = tuba
player9.audition = hs
player9.save
player10 = Player.create(first_name: "Rene", last_name: "Smith", virtual: false, comment: "no comments", first_choice: "Flute", second_choice: "Sax", third_choice: "Trumpet")
player10.instrument = percussion
player10.audition = hs
player10.save