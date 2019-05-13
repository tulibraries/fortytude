klass = controller.class.to_s.gsub(/Controller$/, "").singularize
resource = "@#{klass.downcase}"
serializer =  "#{klass}Serializer".constantize
serialized_hash = BuildingSerializer.new(instance_variable_get(resource)).serializable_hash
json.extract! serialized_hash, *serialized_hash.keys
