if (Meteor.isClient)

  Template.chats.collection = -> Chat.all()
  Template.messages.collection = -> @messages()

  Template.chats.events
    'click .remove' : -> @destroy()

  Template.new_chat.events
    'submit #new_chat' : (e) ->
      e.preventDefault()

      Chat.create name: $(e.target).children()[0].value
      e.target.reset()

  Template.new_message.events
    'submit #new_message' : (e) ->
      e.preventDefault()

      @messages.new message: $(e.target).children()[0].value
      e.target.reset()
