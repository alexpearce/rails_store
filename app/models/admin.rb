class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :trackable, :timeoutable, :lockable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :login
  
  protected

    def self.find_for_database_authentication(conditions)
      value = conditions[authentication_keys.first]
      where(["username = :value OR email = :value", { :value => value }]).first
    end
end
