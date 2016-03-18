module UsersHelper

  def je_admin(user)
    user.admin ? 'ano' : 'ne'
  end

end
