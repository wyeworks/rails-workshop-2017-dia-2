require "application_system_test_case"

class BoardsTest < ApplicationSystemTestCase

  setup do
    visit new_user_session_url

    fill_in "Email", with: "one@example.com"
    fill_in "Password", with: "MyPassword"

    click_on "Log in"
  end

  test "visiting the index" do
    visit boards_url

    assert_selector "h1", text: "Boards"
  end
end
