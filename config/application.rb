require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Changelog
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators.system_tests = nil

    config.assets.enabled = false

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
  end
end


