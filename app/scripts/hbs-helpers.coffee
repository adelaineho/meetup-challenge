Handlebars.registerHelper "each-reverse", (context, options) ->
  fn = options.fn
  inverse = options.inverse
  ret = ""
  if context and context.length > 0
    i = context.length - 1

    while i >= 0
      ret += fn(context[i])
      i--
  else
    ret = inverse(this)
  ret