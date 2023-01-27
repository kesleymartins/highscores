class User
    include Mongoid::Document
    include BCrypt

    field :username, type: String
    
    validates :username, presence: true
    validates_uniqueness_of :username
end