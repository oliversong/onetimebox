@Files = new Meteor.Collection('files')

Meteor.methods(
  makeFile: (fileDetails)->
    file = _.extend(_.pick(fileDetails, 'boxId', 'url','name','size'),
      userId: 'what'
    )

    fileId = Files.insert(file)
    fileId
)
