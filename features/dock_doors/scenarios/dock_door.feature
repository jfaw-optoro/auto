Feature: Dock Door
  In order to ship pallet
  As a logged in User
  I should be able to scan Dock Door

#  Background:
#  Given I have available dock door

  Scenario: Dock Door scan
    Given I select the "Pallet Shipping" tool
    And I select "Loading" on Pallet Shipping

    When "PalletLoading" is displayed
    And I select the door "DD-05"
    And I select the Shipment Number "BulkOrder 2728292"
#    TODO - uncomment when build dock door + order + lots --> page factory
#    And I scan lot "PTAB16225" to door "DD-05"
#    And I scan lot "PTBN23234" to door "DD-05"
#    Then I can checkout door "DD-05"
    And "CheckoutTruck" is displayed