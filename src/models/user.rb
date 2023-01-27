class User
    include Mongoid::Document
    include BCrypt

    field :username, type: String
    field :password, type: String
    
    validates :username, presence: true
    validates :password, presence: true, confirmation: true
    validates_uniqueness_of :username
end