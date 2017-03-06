require 'pry'
require 'pry-nav'

class StringWrapper < Parser::Rewriter
  def on_send(node)
    method_name = node.loc.selector.source
    return unless method_name != "_"
    super
  end

  def on_dstr(node)
    node.children.each do |child|
      puts child
    end
  end
end

