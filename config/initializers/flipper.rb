require 'flipper'

Flipper.configure do |config|
  config.default do
    # pick an adapter, this uses memory, any will do
    adapter = Flipper::Adapters::Memory.new

    # pass adapter to handy DSL instance
    Flipper.new(adapter)
  end
end

if Rails.configuration.draftable == "true"
  Flipper.enable(:draftable)
else
  Flipper.disable(:draftable)
end
