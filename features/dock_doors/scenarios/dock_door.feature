Feature: Dock Door
  In order to ship pallet
  As a logged in User
  I should be able to scan Dock Door

#  Background:
    #    Given build some models used in pallet shipping

  Scenario: Dock Door scan
    Given I select the "Pallet Shipping" tool
    And I select "Loading" on Pallet Shipping

    When I am on "PalletLoading" page
    And "DD-01" is part of the active doors list
#    And I click the door "DD-01"
#    And I click the Shipment Number "BulkOrder 2728263"

