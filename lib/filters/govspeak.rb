require 'govspeak'

Nanoc::Filter.define(:govspeak) do |content, _params|
  Govspeak::Document.new(content).to_html
end
