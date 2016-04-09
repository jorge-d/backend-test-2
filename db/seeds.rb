# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


jane  = User.create!(name: "Jane", role: "CEO")
luke  = User.create!(name: "Luke", role: "CTO")
peter = User.create!(name: "Peter", role: "COO")

mainNumber    = CompanyNumber.create!(sip_endpoint: 'sip:main160408183339@phone.plivo.com'    , name: 'Main'    )
salesNumber   = CompanyNumber.create!(sip_endpoint: 'sip:sales160408161440@phone.plivo.com'   , name: 'Sales'   )
supportNumber = CompanyNumber.create!(sip_endpoint: 'sip:support160408183416@phone.plivo.com' , name: 'Support' )

mainNumber.users    << [jane, luke, peter]
salesNumber.users   << [jane, peter]
supportNumber.users << luke

jane.numbers << UserNumber.create!(sip_endpoint: 'sip:Jane160408155457@phone.plivo.com')
luke.numbers << UserNumber.create!(sip_endpoint: 'sip:luke160409112049@phone.plivo.com')
peter.numbers << UserNumber.create!(sip_endpoint: 'sip:peter160409112128@phone.plivo.com')
