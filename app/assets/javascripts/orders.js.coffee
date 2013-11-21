jQuery ->
  $(document).on 'click', 'form .remove_field', (event) ->
    $(this).closest('tr').find('input[type=hidden]').val('1')
    $(this).closest('tr').hide()
    event.preventDefault()

  $(document).on 'click', 'form .add_field', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
