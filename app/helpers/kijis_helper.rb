module KijisHelper
  def auther?
    if !current_user.nil?
      return current_user.id==@kiji.user_id
    else
      return false
    end
  end
end
