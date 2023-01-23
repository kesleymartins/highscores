class User
    include Mongoid::Document
    include BCrypt

    field :username, type: String
    field :password_hash, type: String
    
    validates :username, presence: true
    validates :password_hash, presence: true
    validates_uniqueness_of :username

    def password
        @password ||= Password.new(password_hash)
    end
    
    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end
end