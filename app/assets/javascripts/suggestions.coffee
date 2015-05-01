fillForm = ->
  existingPosition = $('.existing-positions-select option:selected').text()
  $suggestionForm = $('.suggest-new-position')
  $orTag = $('.or-tag')

  if existingPosition is 'Please select a position...'
    $orTag.text 'or'
    $suggestionForm.val ''
  else
    $orTag.text 'You selected...'
    $suggestionForm.val existingPosition

findSigLink = ->
  selectedSig = $('.sig-suggestion-select').val()
  request = $.getJSON "/sigs/#{selectedSig}"
  request.done (data) ->
    $('.sig-url')
      .attr 'href', data["url"]
      .text "Click here to find out more information about the #{data["name"]}"

$(document).ready ->
  $(document).on 'change', '.existing-positions-select', fillForm
  $(document).on 'change', '.sig-suggestion-select', findSigLink