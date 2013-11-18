class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    @builder.send(:"#{input_type}_local_field", attribute_name, input_html_options)
  end
end
