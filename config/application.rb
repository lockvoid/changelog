require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "active_storage/engine"

Bundler.require(*Rails.groups)

module Changelog
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators.system_tests = nil

    # config.assets.enabled = false

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      if html_tag =~ /<(input|textarea|select)/
        html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        html_field.children.add_class 'field-input--invalid'

        template = <<-eos
          #{html_field.to_s}

          <p class="field-error">
            #{instance.error_message.first.capitalize}
          </p>
        eos

        template.html_safe
      else
        html_tag
      end
    }

    config.generators.stylesheets = false
    config.generators.javascripts = false

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    }
  end
end
