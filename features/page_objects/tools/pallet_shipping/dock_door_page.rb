module PageObjects
  module DockDoor
    class DockDoorPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/loading/door{/variable}"
     
      # element :dock_door_button "*[role='listitem'] button[aria-label^='DD-02']"
      element :listitem, "*[ng-app='pallet_shipping_tool']"


      def click_door(door_name)
      	listitem.all("button[aria-label^='#{door_name}']").click
      end 
    end
  end
end