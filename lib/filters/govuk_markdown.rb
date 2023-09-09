require 'govuk_markdown'

Nanoc::Filter.define(:govuk_markdown) do |content, _params|
  GovukMarkdown.render(content)
end
