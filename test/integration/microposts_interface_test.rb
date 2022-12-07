require "test_helper"

class MicropostsInterface < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    log_in_as(@user)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    assert_select'input[type=file]'
    post microposts_path, params: { micropost: { content: "" } }
    assert_select 'div#error_explanation'
    #valid submission
    content = "This is a valid micropost."
    image = fixture_file_upload('test/fixtures/files/kitten.jpg', 'image/jpeg')
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content,
                                                   image:   image } }
    end
    assert assigns(:micropost).image.attached?
    follow_redirect!
    assert_match content, response.body
    # Delete a post.
    assert_select 'a', 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # Visit a different user.
    get user_path(users(:fuser))
    assert_select 'a', { text: 'delete', count: 0 }
  end
end