Meteor.publish 'files', (boxId)->
  return Files.find({boxId:boxId})

Meteor.publish 'boxes', ()->
  return Boxes.find()

# server: publish the current size of a collection
Meteor.publish 'filecount', () ->
  return FileCount.find()
