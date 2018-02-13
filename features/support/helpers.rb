# Document needed to call visit and assert methods
include RSpec::Matchers
module PageObjects
  def visit_page(name, args = {}, &block)
    build_page(name).tap do |page|
      page.load(args)
      yield page if block
    end
  end

  def on_page(name, _args = {}, &block)
   build_page(name).tap do |page|
     wait_for_readiness
     yield page if block
   end
 end

  def assert_on_page(name, args = {}, &block)
    build_page(name).tap do |page|
      expect(page).to be_displayed(args)
      yield page if block
    end
  end

  def build_page(name)
    name = name.to_s.camelize if name.is_a? Symbol
    puts "build PO: " + name
    Object.const_get("PageObjects::#{name}").new
  end

end
