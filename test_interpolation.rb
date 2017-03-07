def _(str)
  str
end

def another_name
  "Maggie"
end

cat_name = "Twinky"
puts _("Name: #{cat_name} and #{value0}")

msg = _(<<MSG)
Here comes #{cat_name}!
MSG
puts msg
