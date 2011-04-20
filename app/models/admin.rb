class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :trackable, :timeoutable, :lockable, :validatable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessible :email, :username, :password, :password_confirmation
  
  protected

    def self.find_for_database_authentication(conditions)
      value = conditions[authentication_keys.first]
      where(["username = :value OR email = :value", { :value => value }]).first
    end
end