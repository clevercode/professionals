window.questions = 

  init: ->
    @self            = $('body.questions')
    @_deleteButton   = $('a.delete')
    @_replyButton    = $('a.reply')
    @_replyForm      = $('form')
    @_questionDetail = $('.question-detail')
    @_readingState   = on
    @attachEventListeners()

  attachEventListeners: ->
    @self.on 'click', 'a.reply', $.proxy @, '_onReplyClick'
    @self.on 'click', 'a.cancel', $.proxy @, '_onCancelClick'

  # Event handlers
  # 

  _onReplyClick: ->
    if @_readingState is on
      @_questionDetail.animate width: '55%'
      @_deleteButton.text 'Cancel'
      @_toggleState()

    off

  _onCancelClick: ->
    if @_readingState is off
      @_questionDetail.animate width: '100%'
      @_deleteButton.text 'Delete'
      @_toggleState()

    off

  # private
  # 

  _toggleState: ->
    @_readingState = if @_readingState then off else on
    @_deleteButton.toggleClass 'cancel'
    @_replyForm.toggle 300
    @_replyButton.toggle()
