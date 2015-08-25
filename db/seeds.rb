require 'faker'


50.times do
    user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
end
users = User.all


100.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph
    )
end
wikis = Wiki.all


admin = User.new(
    name: 'admin user',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin'
)
admin.skip_confirmation!
admin.save!
    

    
puts "Seeds finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"