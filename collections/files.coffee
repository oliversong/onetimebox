@Files = new Meteor.Collection('files')

Meteor.methods(
  makeFile: (fileDetails)->
    file = _.pick(fileDetails, 'boxId', 'url','name','size', 'type')

    fileId = Files.insert(file)
    fileId
)

Files.allow(
  remove: (userId, doc)->
    true
)
