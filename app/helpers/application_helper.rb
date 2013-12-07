module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_field button small", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def humanized_money_with_symbol_and_cents money
    humanized_money_with_symbol money, no_cents_if_whole: false
  end

  def humanized_money(value, options={})
    if !options || !options.is_a?(Hash)
      warn "humanized_money now takes a hash of formatting options, please specify { :symbol => true }"
      options = { :symbol => options }
    end

    options = {
      :no_cents_if_whole => true,
      :symbol => false
    }.merge(options)

    if value.is_a?(Money)
      value.format(options)
    elsif value.respond_to?(:to_money)
      value.to_money.format(options)
    else
      ""
    end
  end

  def humanized_money_with_symbol(value, options={})
    humanized_money(value, options.merge(:symbol => true))
  end
end
