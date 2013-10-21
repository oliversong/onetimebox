@Files = new Meteor.Collection('files')

Meteor.methods(
  makeFile: (fileDetails)->
    file = _.pick(fileDetails, 'boxId', 'url','name','size', 'type')
    file.dateCreated = Math.round(new Date().getTime() / 1000)

    count = FileCount.findOne()
    FileCount.update(
      {
        _id: count._id
      },{
        $inc: {count: 1}
      }
    )

    fileId = Files.insert(file)
    fileId
)

Files.allow(
  remove: (userId, doc)->
    true
)
