class User < ActiveRecord::Base
    has_many  :gems
    has_secure_password
end