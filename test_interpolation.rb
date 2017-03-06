cat_name = "Twinky"
puts _("Name: #{cat_name} and #{another_name}")
puts _("Name: %{cat_name}") % {cat_name: cat_name}
