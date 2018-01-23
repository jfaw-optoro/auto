module PageObjects
  module Tools
    class ToolsPage < SitePrism::Page
      set_url "/mobile#!/"
      # elements
      element :receiving, ".app-list a[href='#!/receiving/programs']"
      element :bin_change, ".app-list a[href='#!/bin_change']"
      element :unit_updater, ".app-list a[href='#!/unit_updater']"
      element :picklist_v3, ".app-list a[href='#!/picklist_v3/nav']"
      element :directed_sorting, ".app-list a[href='/directed_sorting']"
      element :cycle_count, ".app-list a[ng-click='goToCycleCount()']"
      element :unit_photo_tool, ".app-list a[href='/unit_photo_tool']"
      element :pallet_shipping_tool, ".app-list a[href='/pallet_shipping_tool']"
    end
  end
end

