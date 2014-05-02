MIXCLOUD = HashWithIndifferentAccess.new

config = YAML.load_file(Rails.root.join("config", "mixcloud.yml"))[Rails.env]
if config
  MIXCLOUD.update(config)
end

