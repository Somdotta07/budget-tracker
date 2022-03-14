require 'application_system_test_case'

class ExpansesTest < ApplicationSystemTestCase
  setup do
    @expanse = expanses(:one)
  end

  test 'visiting the index' do
    visit expanses_url
    assert_selector 'h1', text: 'Expanses'
  end

  test 'should create expanse' do
    visit expanses_url
    click_on 'New expanse'

    fill_in 'Amount', with: @expanse.amount
    fill_in 'Name', with: @expanse.name
    click_on 'Create Expanse'

    assert_text 'Expanse was successfully created'
    click_on 'Back'
  end

  test 'should update Expanse' do
    visit expanse_url(@expanse)
    click_on 'Edit this expanse', match: :first

    fill_in 'Amount', with: @expanse.amount
    fill_in 'Name', with: @expanse.name
    click_on 'Update Expanse'

    assert_text 'Expanse was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Expanse' do
    visit expanse_url(@expanse)
    click_on 'Destroy this expanse', match: :first

    assert_text 'Expanse was successfully destroyed'
  end
end
