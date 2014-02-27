class @Message extends Model
  @collection: new Meteor.Collection 'messages'

  @belongs_to 'chat'
