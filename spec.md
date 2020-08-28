# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    Used Sinatra to create the routes, get to the erb files in the views folder, etc. 
- [x] Use ActiveRecord for storing information in a database
    Persisted objects to the database via associations and methods
- [x] Include more than one model class (e.g. User, Gemstone)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Gemstones (aka gems))
- [x] Include at least one belongs_to relationship on another model (e.g. Gemstones (aka gems) belongs_to User)
- [x] Include user accounts with unique login attribute (username or email)
    Set up signup validations for uniqueness
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    The user is able to create, look at, edit, and delete the gems they create
- [x] Ensure that users can't modify content created by other users
    Set up user authentication to ensure only the gem creator could change a gem. 
- [x] Include user input validations
    User isn't allowed to submit empty strings for the gem name or gem description. 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    Used sinatra-flash gem to create flash messages. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message