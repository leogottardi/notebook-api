namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind| 
      Kind.create(description: kind)
    end

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name ,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 45.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end


    Contact.all.each do |contact| 
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
      end
    end
  end

end
