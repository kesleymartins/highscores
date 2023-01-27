class User
    include Mongoid::Document

    field :username, type: String
    field :password, type: String
    
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true

    before_create :hash_password

    def authenticate(password)
        Argon2::Password.verify_password(password, self.password)
    end

    protected

    def hash_password
        self.password = Argon2::Password.create(self.password)
    end
end