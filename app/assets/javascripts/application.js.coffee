#= require jquery
#= require jquery_ujs
#= require jquery-ui-1.8.24.custom.min
#= require jquery.cycle
#= require turbolinks
#= require_tree .

$ -> window.app.init()

window.app =

  init: ->
    @attachEventListeners()

  attachEventListeners: ->
    $('body').on 'submit', 'form', $.proxy @, '_onFormSubmit'
    $('body').on 'keypress', 'input, textarea', $.proxy @, '_onInputKeyPress'

  _onFormSubmit: (event) ->
    $form  = $ event.currentTarget
    fields = $form.find 'input, textarea'

    perfectForm = yes
    for field in fields
      $field = $ field

      if $field.val().length is 0
        perfectForm = no
        $field.focus().addClass 'error'
        break

    off unless perfectForm

  _onInputKeyPress: (event) ->
    $input = $ event.currentTarget
    $input.removeClass 'error'
