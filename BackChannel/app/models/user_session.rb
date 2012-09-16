class UserSession < Authlogic::Session::Base
  # To change this template use File | Settings | File Templates.

  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

end