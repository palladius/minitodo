module UsersHelper
  
  def user_column(user, verbose = true)
    return "-" unless user
    str = "<b class='user'>" + link_to(user.username.capitalize,user) + "</b>" rescue "UserErr(#{$!})"
    str += " (id=#{user.id}, admin=#{user.is_admin})" if verbose
    return str
  end
  
  
end
