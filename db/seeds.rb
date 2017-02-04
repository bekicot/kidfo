# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

matt = User.create!(email: 'matt@kidfo.com', password: '123123', password_confirmation: '123123', role: 'parentuser', first_name: 'Matt', last_name: 'Awesome')
matt.avatar = File.open(Rails.root.join('db', 'lego_samurai_by_anggasatriohadi-d388jqr.jpg'))
family = Family.create!(id: '1', name: 'Eves: Boulder, CO', emerg_contact_1: 'Pam Eves', emerg_contact_1_phone: '(760)207-1551', emerg_contact_2: 'Sue Peterson', emerg_contact_2_phone: 'BCBSM', insuranceprovider: 'BCBSM', physicianname: 'Bucknam Robert C MD', physicianphone: '(303)673-9030' )
family.kids << Kid.create!(name: 'Bryar Louise', gender: 'Female', allergies: 'Peanuts', family_id: '1', nonos: 'Nada', avatar: File.open(Rails.root.join('db', 'lego_samurai_by_anggasatriohadi-d388jqr.jpg')))

matt.family = family
matt.save

Doorkeeper::Application.create!(name: 'default', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob')
