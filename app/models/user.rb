class User < ApplicationRecord
  before_save{self.email=self.email.downcase}
  regulex=/\A[\w+\-.]+@[a-z\d\-.]*[a-z\d]+\.[a-z]+\z/
  validates :email,presence:true,length:{maximum:255},format:{with:regulex},uniqueness:{case_sensitive:false}
  validates :password,presence:true,length:{minimum:6},allow_nil:true

  has_secure_password
end
  