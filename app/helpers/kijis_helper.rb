module KijisHelper
  def auther?
    current_user==User.find_by(id:@kiji[:user_id])
  end
end
