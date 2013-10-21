MyCron = new Cron()

MyCron.addJob(1, ()->
  console.log "Garbage collecting old files and boxes..."
  # find all expired files and boxes and delete them, also remove files from filepicker
  # current timestamp
  ts = Math.round(new Date().getTime() / 1000)
  expiredFiles = Files.find({dateCreated: {$lte: ts - 604800}}).fetch()
  expiredBoxes = Boxes.find({dateCreated: {$lte: ts - 604800}}).fetch()
  console.log("Found " + expiredBoxes.length + " expired boxes")
  console.log("Found " + expiredFiles.length + " expired files")
  for file in expiredFiles
    url = file.url+"?key="+Meteor.filepickerKey
    try
      HTTP.del url, (error, result)->
        if error
          console.log "There was an error: " + error
        else
          console.log "File " + file.name + " removed from filepicker."
    catch error
      console.log "Something went wrong with the request: " + error

  Boxes.remove({dateCreated: {$lte: ts - 604800}})
  console.log("Removed " + expiredBoxes.length + " boxes")
  Files.remove({dateCreated: {$lte: ts - 604800}})
  console.log("Removed " + expiredFiles.length + " files")
)
