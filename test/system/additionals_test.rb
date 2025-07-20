require "application_system_test_case"

class AdditionalsTest < ApplicationSystemTestCase
  setup do
    @additional = additionals(:one)
  end

  test "visiting the index" do
    visit additionals_url
    assert_selector "h1", text: "Additionals"
  end

  test "should create additional" do
    visit additionals_url
    click_on "New additional"

    fill_in "Name", with: @additional.name
    fill_in "Price", with: @additional.price
    click_on "Create Additional"

    assert_text "Additional was successfully created"
    click_on "Back"
  end

  test "should update Additional" do
    visit additional_url(@additional)
    click_on "Edit this additional", match: :first

    fill_in "Name", with: @additional.name
    fill_in "Price", with: @additional.price
    click_on "Update Additional"

    assert_text "Additional was successfully updated"
    click_on "Back"
  end

  test "should destroy Additional" do
    visit additional_url(@additional)
    click_on "Destroy this additional", match: :first

    assert_text "Additional was successfully destroyed"
  end
end
