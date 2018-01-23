module PageObjects
  module PalletShipping
    class PalletShippingPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/"
      # elements
      element :loading_icon, "a[href='#!/loading/select-door'] img"
      element :truck_checkout_icon, "a[href='#!/checkout/select-door'] img"
    end
  end
end

