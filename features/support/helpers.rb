# Document needed to call visit and assert methods
module PageObjects
  def visit_page(name, args = {}, &block)
    build_page(name).tap do |page|
      page.load(args)
      # wait_for_readiness
      yield page if block
    end
    binding.pry
  end


  def build_page(name)
    name = name.to_s.camelize if name.is_a? Symbol
    puts "build PO: " + name
    Object.const_get("PageObjects::#{name}").new
  end

  def wait_for_readiness
    Timeout.timeout(Capybara.default_wait_time) do
      loop do
        if !finished_angular_requests?
          # puts "WAITING FOR ANGULAR HTTP"
        elsif !finished_angular_loading?
          # puts "WAITING FOR ANGULAR LOADING"
        elsif !no_animations?
          # puts "WAITING FOR ANIMATIONS"
        elsif !no_overlays?
          # puts "WAITING FOR OVERLAYS"
        else
          break
        end
        sleep 0.1
        # break if finished_angular_requests? && no_animations? && no_overlays?
      end
    end
  end
end
