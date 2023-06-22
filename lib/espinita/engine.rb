module Espinita
  class Engine < ::Rails::Engine
    isolate_namespace Espinita
    
    config.generators do |g|
      g.test_framework  :rspec,
                        :fixture_replacement => :factory_girl ,
                        :dir => "spec/factories"
      g.integration_tool :rspec
    end

    initializer "include Auditor request into action controller" do |app|
      ActiveSupport.on_load :action_controller do
        include Espinita::AuditorRequest
      end
      ActiveSupport.on_load :active_record do
        include Espinita::Auditor
      end
    end


  end
end
