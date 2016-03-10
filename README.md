# Blocipedia

## Summary
A production quality SaaS app that allows users to create and collaborate on wikis.
I made it with the help of a mentor through the Bloc FullStack Web Development Apprenticeship.  

## Features
* Users can  sign up for a free Standard account to create, edit, and delete public wikis.
* Users can purchase a Premium account that allows them to create private wikis.
* If User downgrades from Premium to Standard account, private wikis become public.
* When collaborators are removed they are no longer able to view or work on private wikis.
* Users can chose collaborators from a dropdown menu to work on privatewikis.
* Users can edit wikis using Markdown syntax.

## Technologies
Languages, Libraries, and Frameworks:     
* Ruby on Rails 4.2.1 
* jQuery
* Bootstrap
* 
Databases:     
* SQLite (Test, Development)    
* PostgreSQL (Production)   

Development Tools, Gems and Methodologies:   

* Faker for database seeding     
* Figaro to manage sensitive information     
* Devise for user authentication and confirmation 
* SendGrid for email processing
* Pundit for authorization of user roles (standard, premium, admin)
* Stripe payment integration API and Stripe-ruby gem
* Redcarpet for Markdown formatting    

## Deployment
You can view the app on Heroku: [stacia-blocipedia app](https://stacia-blocipedia.herokuapp.com)

