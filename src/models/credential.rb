class Credential
  include ActiveModel::Validations

  attr_accessor :username, :password

  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end

  validates :username, presence: true
  validates :password, presence: true
end