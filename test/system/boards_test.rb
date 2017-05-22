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

  test "creating a new board" do
    VCR.use_cassette("trello_api") do
      visit boards_url

      click_on "Create new board..."

      fill_in "Name", with: "My Board"
      select "Private", from: "Visibility"
      check "Favorite"

      click_on "Create Board"

      assert_selector "h3", text: "My Board"
      assert_selector "span.label", text: "private"
    end
  end

  test "creating a list and the first card" do
    board = boards(:one)
    visit board_url(board)

    click_on "Create new list..."

    fill_in "Name", with: "TODO"
    click_on "Create List"

    assert_selector "h3.panel-title", text: "TODO"

    within "div.panel", text: "TODO" do
      fill_in "card[title]", with: "A thing to be done"
      click_on "Create Card"

      assert_selector "ul.list-group li", text: "A thing to be done"
    end
  end
end
