jQuery ->
  $(document).on 'click', 'form .remove_field', (event) ->
    $(this).closest('tr').find('input[type=hidden]').val('1')
    $(this).closest('tr').hide()
    update_total()
    event.preventDefault()

  $(document).on 'click', 'form .add_field', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('.expandable_fields').append($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $(document).on 'change', '.order_item_quantity, .order_item_price', (event) ->
    parent_row = $(this).closest('tr')

    quantity = parent_row.find('.order_item_quantity').val()
    price = parent_row.find('.order_item_price').val()
    new_value = parseFloat(price) * parseInt(quantity)

    parent_row.find('.order_item_subtotal').text(format_money(new_value))

    update_total()

  $(document).on 'change', '.new_order_item .order_item_type_select', (event) ->
    parent_row = $(this).closest('tr')
    default_price = $(this).find('option:selected').data('price')
    parent_row.find('.order_item_price').val(default_price)

  format_money = (value) ->
    if $.isNumeric(value) then (value).toFixed(2) else '---'

  update_total = ->
    new_total = 0.0
    $('.order_item_subtotal:visible').each () ->
      new_total+= parseFloat($(this).text())

    $('.order_total').text(format_money(new_total))
