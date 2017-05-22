require "application_system_test_case"

class ImportBoardTest < ApplicationSystemTestCase

  setup do
    visit new_user_session_url

    fill_in "Email", with: "one@example.com"
    fill_in "Password", with: "MyPassword"

    click_on "Log in"
  end

  test "creating a new board" do
    VCR.use_cassette("trello_api_import_board") do
      visit boards_url
      click_on "Create new board..."

      Capybara.using_wait_time 10 do
        select "Welcome Board", from: "Trello board id"
        click_on "Import"

        assert_selector "h3", text: "Welcome Board"
        assert_selector "h3.panel-title", text: "Stuff To Try (this is a list)"
        assert_selector "h3.panel-title", text: "Tried It (this is another list)"
      end
    end
  end
end
