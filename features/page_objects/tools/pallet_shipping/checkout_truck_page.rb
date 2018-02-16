module PageObjects
  module CheckoutTruck
    class CheckoutTruckPage < SitePrism::Page
      set_url "http://snowflake-005.stage.optiturn.com/pallet_shipping_tool#!/loading/door{/param}/order/OR"

      element :checkout_truck, "*[aria-label='Check Out Truck']"

      def click_checkout(dock_door_name)
        expect(page).to have_content("Loading Complete")
        expect(page).to have_content("All shipments have been loaded onto #{dock_door_name}")
        checkout_truck.click
      end

    end
  end
end