class @Chat extends Model
  @collection: new Meteor.Collection 'chats'

  @has_many 'messages'
