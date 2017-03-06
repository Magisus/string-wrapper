require 'pry'
require 'pry-nav'

class InterpolationExtracter < Parser::Rewriter
  def on_send(node)
    receiver_node, method_name, *arg_nodes = *node
    if method_name == :_
      process_string(arg_nodes[0])
    end
    super
  end

  def process_string(node)
    # Strings with interpolation are dstr nodes
    return if node.type != :dstr

    interpolated_values = {}
    count = 0
    node.children.each do |child|
      if child.type == :begin
        value = child.children[0]
        hash_key = "value"
        if value.type == :lvar
          hash_key = value.loc.name.source
        else
          # These are placeholders that will manually need to be given
          # a descriptive name
          hash_key << "#{count}"
          count += 1
        end
        interpolated_values[hash_key] = value
      end
    end
    puts interpolated_values
  end
end

