@Chats = new Meteor.Collection 'chats'

if (Meteor.isClient)

  Template.chats.collection = -> Chats.find {}

  Template.chats.events
    'click .remove' : -> Chats.remove @_id

  Template.new_chat.events
    'submit #new_chat' : (e) ->
      e.preventDefault()

      Chats.insert { name: $(e.target).children()[0].value },
        (error) ->
          $('#new_chat')[0].reset()

