module ApplicationHelper
  GREETINGS = [
    'Sunday Funday! ⭐️',
    'Happy Monday! 🍃',
    'Happy Tuesday! ☘',
    'We’re half way through week! 🚀',
    'It’s almost Friday! 🔥',
    'Thank God it’s Friday! 🍺',
    'Let’s get party! 🎉',
  ];

  def bem_class(*args)
    classes = []

    args.each do |arg|
      case arg
      when String
        classes.push(arg) if arg.strip.size > 0
      when Hash
        arg.each do |k, v|
          classes.push(k.to_s) if !!v == true
        end
      when Array
        classes.push(dom_class(*arg))
      end
    end

    classes.join(" ")
  end

  def m(markdown)
    content_tag :div, Kramdown::Document.new(markdown).to_html.html_safe, class: "markdown"
  end

  def greetings
    GREETINGS[Time.now.wday]
  end

  def timeline_button(url, icon, html_options)
    link_to url, html_options.merge(class: 'timeline-button') do
      content_tag :i, '', 'data-feather': icon
    end
  end
end
