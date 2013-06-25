class User < ActiveRecord::Base
   # Setup accessible (or protected) attributes for your model
  attr_accessible :username
  attr_accessible :first_name, :email, :last_name, :age
    
end
