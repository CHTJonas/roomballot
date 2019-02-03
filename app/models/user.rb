class User < ApplicationRecord

  # Grants site administrator privileges to the user.
  def make_admin!
    self.admin = true
  end

  # Revokes site administrator privileges from the user.
  def revoke_admin!
    self.admin = false
  end

  # Block a user - stops them from logging in.
  def block!
    self.blocked = true
  end

  # Unblock a user.
  def unblock!
    self.blocked = false
  end
end
