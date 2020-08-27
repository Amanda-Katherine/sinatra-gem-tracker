# Ruby Gem Tracker Made in Sinatra

## Description
Tired or trying to remember what Ruby gems do what?  Yea...me too. The Gem Tracker allows Ruby developers to add the names and a description of gems they want to remember. Developers are able to see other dev's gems as well so you can learn what other cool gems are out there. Shiny? 

## Built With

* [Ruby 2.6.1](https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/)
* [Sinatra](http://sinatrarb.com/) and [ActiveRecord](https://apidock.com/rails/ActiveRecord/Base) - The Ruby frameworks used
* [SQLITE3](https://www.sqlite.org/) - The relational database used for development
* HTML5 & CSS

## Development

Clone this repo and run 

    $ bundle install

Then run: 

    $ rake db:migrate

Start up local server by running

    $ shotgun 

For interactive console

    $ rake console
OR

    $ tux

## Future improvements 
* Add password confirmation at signup
* Allow developers to add more than just ruby gems (framework themes, other languages 'gems', etc)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Amanda-Katherine/sinatra-gem-tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://contributor-covenant.org/) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby Gem Tracker project is expected to follow the [code of conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct).