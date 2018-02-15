module PageObjects
  module PalletLoading
    class PalletLoadingPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/loading/select-door"

      # element :dock_door_button "*[role='listitem'] button[aria-label^='DD-01']"
      element :shipping_tool, "*[ng-app='pallet_shipping_tool']"


      def click_door(door_name)
        shipping_tool.find("button[aria-label^='#{door_name}']").click
      end

      # TODO
      # def activedoors
      #   shipping_tool.all("*[role='list']").first
      # end

      # def inactivedoors
      #   shipping_tool.all("*[role='list']").last
      # end
    end
  end
end

