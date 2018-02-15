module PageObjects
  module SelectShipmentScanLotDoor
    class SelectShipmentScanLotDoorPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/loading/door{/door_name}"

      element :shipment, "*[ng-app='pallet_shipping_tool'] [role='list']"

      def click_shipment(shipment_name)
        shipment.find("button[aria-label^='#{shipment_name}']").click
      end

    end
  end
end