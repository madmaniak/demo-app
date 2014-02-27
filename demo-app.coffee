@Chats = new Meteor.Collection 'chats'
@Messages = new Meteor.Collection 'messages'

if (Meteor.isClient)

  Template.chats.collection = -> Chats.find {}
  Template.messages.collection = -> Messages.find chat_id: @_id

  Template.chats.events
    'click .remove' : -> Chats.remove @_id

  Template.new_chat.events
    'submit #new_chat' : (e) ->
      e.preventDefault()

      Chats.insert { name: $(e.target).children()[0].value },
        (error) ->
          $('#new_chat')[0].reset()

  Template.new_message.events
    'submit #new_message' : (e) ->
      e.preventDefault()

      Messages.insert { message: $(e.target).children()[0].value, chat_id: @_id },
        (error) ->
          $('#new_message')[0].reset()
