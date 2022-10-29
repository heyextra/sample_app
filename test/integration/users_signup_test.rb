require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "",
                                          email: "user@invalid",
                                          password: "foo",
                                          password_confirmation: "bar" }}
      
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    #block to check if the User length has increased by 1
    assert_difference "User.count", 1 do
      #post or write to the user path with the following params
      post users_path, params: { user: { name: "Example User",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password" }}
    end
    #checks the redirect after submission and pairs with following template
    follow_redirect!
    assert_template 'users/show'
#check to see that flash is indeed not empty
    assert_not flash.empty?
    #could also use refute_empty flash
  end

  test "valid flash" do

  end
end
