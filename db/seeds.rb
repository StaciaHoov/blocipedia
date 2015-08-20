

admin = Wiki.new(
    name: 'admin user',
    email: 'admin@email.com',
    password: 'helloworld',
    role: 'admin'
)
    user.skip_confirmation!
    user.save!
    
standard = Wiki.new(
    name: 'standard user',
    email: 'standard@email.com',
    password: 'helloworld',
    role: 'standard'
)
    user.skip_confirmation!
    user.save! 
    
premium = Wiki.new(
    name: 'premium user',
    email: 'premium@email.com',
    password: 'helloworld',
    role: 'premium'
)
    user.skip_confirmation!
    user.save! 