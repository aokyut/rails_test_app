class User < ApplicationRecord
  validates :name,presence:true,length:{maximum:50}
  regulex=/\A[\w+\-.]+@[a-z\d\-.]*[a-z\d]+\.[a-z]+\z/
  validates :email,presence:true,length:{maximum:255},format:{with:regulex},uniqueness:{case_sensitive:false}

end
  