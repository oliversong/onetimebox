MyCron = new Cron()

MyCron.addJob(60, ()->
  console.log "Garbage collecting old files and boxes..."
  # find all expired files and boxes and delete them, also remove files from filepicker
  # current timestamp
  ts = Math.round(new Date().getTime() / 1000)
  expiredFiles = Files.find({dateCreated: {$lte: ts - 604800}}).fetch()
  expiredBoxes = Boxes.find({dateCreated: {$lte: ts - 604800}}).fetch()
  console.log("Found " + expiredBoxes.length + " expired boxes")
  console.log("Found " + expiredFiles.length + " expired files")

  Boxes.remove({dateCreated: {$lte: ts - 604800}})
  console.log("Removed " + expiredBoxes.length + " boxes")
  # Files.remove({dateCreated: {$lte: ts - 604800}})
  # console.log("Removed " + expiredFiles.length + " files")

  i = 0
  for file in expiredFiles
    Meteor.setTimeout ( ->
      file = Files.findOne({dateCreated: {$lte: ts - 604800}})
      url = file.url+"?key="+Meteor.filepickerKey
      console.log url
      try
        HTTP.del url, (error, result)->
          if error
            console.log "There was an error: " + error
          else
            console.log "File " + file.name + " removed from filepicker."
            Files.remove({_id: file._id})
            console.log "File " + file.name + " removed from onetimebox"
      catch error
        console.log "Something went wrong with the request: " + error
    ), i*200
    i += 1
)
