class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :trackable, :timeoutable, :lockable

  attr_accessible :email, :password, :password_confirmation
end
