window.articles = 

  init: ->
    @articles = $('article.article')
    @articles.first().addClass 'active'
    @attachEventListeners()

  attachEventListeners: ->
    @articles.find('h1').on 'click', $.proxy @, 'onArticleToggle'

  onArticleToggle: (event) ->
    $article = $(event.currentTarget).parent '.article'
    @articles.not($article).removeClass 'active'
    $article.toggleClass 'active' unless $article.hasClass 'active'

    