class Administrator < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection

  has_secure_password

  def self.authenticate(email, password)
    admin = find_by_email(email)
    admin.authenticate(password)
  end
end
