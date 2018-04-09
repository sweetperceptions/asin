require "logger"
require "confiture"

module ASIN

  # Rails initializer configuration.
  #
  # Expects at least +secret+ and +key+ for the API call:
  #
  #   ASIN::Configuration.configure do |config|
  #     config.secret         = 'your-secret'
  #     config.key            = 'your-key'
  #     config.associate_tag  = 'your-associate_tag'
  #   end
  #
  # Confiture is used as a basis for configuration. Have a look at the documentation[https://github.com/phoet/confiture] for more configuration styles.
  #
  # ==== Options:
  #
  # [secret] the API secret key (required)
  # [key] the API access key (required)
  # [associate_tag] your Amazon associate tag (required)
  # [host] the host, which defaults to 'webservices.amazon.com'
  # [logger] a different logger than logging to STDERR (nil for no logging)
  # [version] a custom version of the API calls. Default is 2010-11-01
  #
  class Configuration
    include Confiture::Configuration
    confiture_allowed_keys(:secret, :key, :associate_tag, :host, :version, :logger)
    confiture_mandatory_keys(:secret, :key, :associate_tag)
    confiture_defaults({
      :secret        => '',
      :key           => '',
      :associate_tag => '',
      :host          => 'webservices.amazon.com',
      :version       => '2011-08-01',
      :logger        => Logger.new(STDERR),
    })
  end
end
