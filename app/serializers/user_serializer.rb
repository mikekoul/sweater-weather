class UserSerializer 
  include JSONAPI::Serializer

  def initialize(user)
    @user = user
  end

  def response
    {
    "data": {
      "type": "users",
      "id": @user.id,
      "attributes": {
        "email": @user.email,
        "api_key": @user.api_key
        } 
      }
    }
  end
end