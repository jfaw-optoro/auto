
When("I navigate to the {string} page") do |existing_module|
  visit_page("#{existing_module}::LoginPage")
end

When(/^I login as "(.*?)" using password "(.*?)"$/) do |email, password|
  # ToDo handle different login for mobile vs normal
  visit_page("MobileLogin::MobileLoginPage")
  within('#login-page') do
    fill_in 'login', with: email
    fill_in 'password', with: password
    click_button 'Log in'
  end
  assert_on_page("Tools::ToolsPage")
end

When("I select the {string} tool") do |string|
  binding.pry
  current_tools = string
  case current_tools
    when 'Receiving'
      visit_page("Tools::ToolsPage").receiving.click
      assert_on_page("Receiving::ReceivingPage")
    when 'Bin Change'
      visit_page("Tools::ToolsPage").bin_change.click
      assert_on_page("Binchange::BinchangePage")
    when 'Picklist'
      visit_page("Tools::ToolsPage").picklist_v3.click
      assert_on_page("Picklist::PicklistPage")
    when 'Pallet Shipping'
      visit_page("Tools::ToolsPage").pallet_shipping_tool.click
      assert_on_page("PalletShipping::PalletShippingPage")
    when 'Edit Serial'
      visit_page("Tools::ToolsPage").unit_updater.click
      assert_on_page("EditSerial::EditSerialPage")
    when 'Directed Sorting'
      visit_page("Tools::ToolsPage").directed_sorting.click
      assert_on_page("DirectedSorting::DirectedSortingPage")
    when 'Cycle Count'
      visit_page("Tools::ToolsPage").cycle_count.click
      assert_on_page("CycleCount::CycleCountPage")
    when 'Unit Photo'
      visit_page("Tools::ToolsPage").unit_photo_tool.click
      assert_on_page("UnitPhoto::UnitPhotoPage")
    else
      fail(ArgumentError.new("Selected tool #{string} -- does not exist"))
  end
end

When("I select {string} on Pallet Shipping") do |string|
  current_options = string
  case current_options
    when 'Loading'
      visit_page("PalletShipping::PalletShippingPage").loading_icon.click
      assert_on_page("PalletLoading::PalletLoadingPage")
    when 'Truck Checkout'
      visit_page("PalletShipping::PalletShippingPage").truck_checkout_icon.click
      assert_on_page("TruckCheckout::TruckCheckoutPage")
    else
      fail(ArgumentError.new("Option #{string} -- does not exist"))
  end
end

When("I scan {string}") do |string|
  binding.pry
  # implement event that scan
  # window.onScanAppBarCodeData('CSBN120122')
end
