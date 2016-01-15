$ ->
  parentContainer = $('#linky-container')
  window.urls = []
  renderList = () ->
    list = urls.map (url) ->
      link = $('<a>').attr('href', 'http://' + url)
                     .attr('target', '_blank')
                     .html(url)
      $('<li>').html(link)
    $(parentContainer).find('.content .list')
                      .html(list.reverse())

  # initial query to populate list from database
  $.get 'links.json', (data) ->
    window.urls = urls.concat(data)
    renderList()

  pollDatabase = () -> $.post 'links', {hosts: urls}

  setInterval pollDatabase, 15000

  urlRegExp = /[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9](?:\.[a-zA-Z]{2,})+/
  urlInput = $(parentContainer).find('input[name=url]')
  urlInput.on 'keypress', (e) ->
    if e.which == 13
      value = e.target.value
      if value.match(urlRegExp)
        host = value.match(urlRegExp).pop()
        urls.push(host) if urls.indexOf(host) == -1
        renderList()
        $(parentContainer).find('.error').html('')
        $(this).val('')
      else
        $(this).select()
        $(parentContainer).find('.error')
          .html($('<span>').html('Invalid URL!'))

