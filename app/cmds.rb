require_dependency 'base'
require_dependency 'generic_base'
Dir[Rails.root.join("app/cmds/*.rb")].each {|f| require_dependency f}
