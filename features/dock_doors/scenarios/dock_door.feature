Feature: Dock Door
  In order to ship pallet
  As a logged in User
  I should be able to scan Dock Door

#  Background:
    #    Given build some models used in pallet shipping

  Scenario: Dock Door scan
    Given I select the "Pallet Shipping" tool
    And I select "Loading" on Pallet Shipping
    When I scan "CSBN120122"