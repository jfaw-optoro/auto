module PageObjects
  module ScanLotToLoad
    class ScanLotToLoadPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/loading/door{/param}/order/OR"

      def scan_lot(lot_name)
        expect(page).to have_content("Scan Lot to Load")
        expect(page).to have_css("*[ng-app='pallet_shipping_tool'] *[ng-repeat='item in vm.order.lotsToLoad']", :minimum => 1)
        page.execute_script("window.onScanAppBarCodeData('#{lot_name}')")
        puts "Scanned lot: #{lot_name}"
      end

    end
  end
end