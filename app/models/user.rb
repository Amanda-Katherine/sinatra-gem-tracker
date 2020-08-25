class User < ActiveRecord::Base
    has_many  :gemstones
    has_secure_password

    validates :username, presence: true, uniqueness: true

    def slug
        username.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end
end