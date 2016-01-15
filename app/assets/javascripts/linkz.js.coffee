$ ->
  urls = []
  renderList = () ->
    return 'hello'
  urlRegExp = /[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9](?:\.[a-zA-Z]{2,})+/
  parentContainer = $('#linky-container')
  urlInput = $(parentContainer).find('input[name=url]')
  urlInput.on 'keypress', (e) ->
    if e.which === 13
      value = e.target.value
      if value.match(urlRegExp)
        urls.push(value)
        renderList()
        $(parentContainer).find('.error').html('')
        $(this).val('')
      else
        $(this).select()
        $(parentContainer).find('.error')
          .html($('<span>').html('Invalid URL!'))

