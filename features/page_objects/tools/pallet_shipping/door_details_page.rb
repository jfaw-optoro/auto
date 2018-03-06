module PageObjects
  module DoorDetails
    class DoorDetailsPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/checkout/door{/param}"

      elements :orders_list, "*[ng-repeat='shipment in vm.door.trailer.shipments']"

      def orders
        total_loaded = []
        orders_list.each do |element|
          total_loaded << element.find(:css, 'div').text
        end
        puts "Orders: #{total_loaded}"
      end

    end
  end
end