module PageObjects
  module LoadingSelectDoor
    class LoadingSelectDoorPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/loading/select-door"

      element :select_door, "*[role=“listitem”] div h3"
    end
  end
end