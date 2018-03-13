module PageObjects
  module PalletLoading
    #
    class Door < SitePrism::Section
      element :door_img, "button img"
      element :door_title, "button h3"
      element :door_subtitle, "button p"
      element :door_subtitle_right, ".text-right p"
    end
    #

    class PalletLoadingPage < SitePrism::Page
      set_url "/pallet_shipping_tool#!/loading/select-door"

      sections :active_door, Door, "*[role='listitem'] button"

      def find_door(door_name)
        match_door = doors.find("*[aria-label^='#{door_name}']").first
      end

      def active_doors_titles
        titles =[]
        active_door.each do |element|
          titles << element.door_title.text
        end
        titles
      end


    end
  end
end

