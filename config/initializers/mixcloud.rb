MIXCLOUD_CREDENTIALS = HashWithIndifferentAccess.new

config = YAML.load_file(Rails.root.join("config", "mixcloud.yml"))[Rails.env]
if config
  MIXCLOUD_CREDENTIALS.update(config)
end