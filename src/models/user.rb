class User
    include Mongoid::Document
    include Shield::Model

    field :username, type: String
    field :crypted_password, type: String

    validates :username, presence: true
    validates_uniqueness_of :username

    def self.fetch(username)
        where(email: username).first
    end
end