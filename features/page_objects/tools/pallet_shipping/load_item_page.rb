module PageObjects
  module LoadItem
    class LoadItemPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/loading/load-item{/param}"

      element :shipping_tool, "*[ng-app='pallet_shipping_tool']"

      def scan_door(door_name)
        expect(page).to have_content("Put item on Trailer")
        page.execute_script("window.onScanAppBarCodeData('#{door_name}')")
        puts "Scanned door: #{door_name}"
      end

    end
  end
end