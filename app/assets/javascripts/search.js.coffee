class Search

  WAIT_TIME = 250

  constructor: (form) ->
    @self = $(form)
    @attachEventListeners()

  attachEventListeners: ->
    @self.on 'focus', 'input', $.proxy @, '_onInputFocus'
    @self.on 'blur', 'input', $.proxy @, '_onInputBlur'
    @self.on 'keyup', 'input', $.proxy @, '_onInputKeyUp'
    @self.on 'search', 'input', $.proxy @, '_onSearch'

  # event handlers
  # 

  _onInputFocus: -> @self.css width: '25%'
  _onInputBlur:  -> @self.css width: '10em'

  _onInputKeyUp: (event) ->
    @_submitSearch event.currentTarget.value

  _onSearch: (event) ->
    @_submitSearch event.currentTarget.value

  # private
  # 

  _submitSearch: (query) ->
    if query isnt @_lastQuery
      clearTimeout(@_pause) if @_pause?
      @_pause = setTimeout =>
        @_pause = null
        @_lastQuery = query
        $.ajax
          url: @self.attr 'action'
          method: 'GET'
          contentType: 'json'
          data: q: query
          success: (script) -> script

      , WAIT_TIME

this.Search = Search
