fillForm = () ->
  existingPosition = $('.existing-positions-select option:selected').text()
  $suggestionForm = $('.suggest-new-position')
  $orTag = $('.or-tag')

  if existingPosition is 'Please select a position...'
    $orTag.text('or')
    $suggestionForm.val('')
  else
    $orTag.text('You selected...')
    $suggestionForm.val(existingPosition)

$(document).ready ->
  $(document).on('change', '.existing-positions-select', fillForm)