require 'test_helper'

describe User do

  def valid_params 
<<<<<<< HEAD
    { name: "John Doe", email: "john@example.com" }
  end

  it "is valid with valid params" do
=======
    { client_id: "John Doe", email: "john@example.com" }
  end

  it "is valid with valid params"
>>>>>>> b506132309545c7fae5a3d1dec6b37582508024b
  user = User.new valid_params

  user.must_be :valid?, # Must create with valid params

<<<<<<< HEAD
  it "is invalid without an email" do
=======
  it "is invalid without an email"
>>>>>>> b506132309545c7fae5a3d1dec6b37582508024b
  # Delete email before user let is called
  user_params.delete :email

  user.wont_be :valid? #Must not be valid without email
  user.errors[:email].must_be :present? # Must have error for missing email
  end
end