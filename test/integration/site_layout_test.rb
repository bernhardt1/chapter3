require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_select "a[href=?]", signup_path
    get signup_path
    assert_select "title", full_title("Sign up")
    get root_path
    assert_template 'static_pages/home'
    @user = users(:jason)
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    get users_path
    assert_select "title", full_title("All users")
  end
end
