Template.boxPage.helpers(
  currentBox: ()->
    Boxes.findOne Session.get('currentBoxId')

  files: ()->
    Files.find({boxId: Session.get('currentBoxId')})
)

Template.boxPage.rendered = ()->
  filepicker.setKey('AwMdR1npIQQ6utPgLzd1Wz')

  # create a drop pane
  filepicker.makeDropPane $(".fileDrop")[0],
    multiple: true
    dragEnter: ->
      $(".fileDrop").html("Drop to upload").css
        backgroundColor: "#E0E0E0"
        border: "1px solid #000"

    dragLeave: ->
      $(".fileDrop").html("Drop files here").css
        backgroundColor: "#F6F6F6"
        border: "1px dashed #666"


    onSuccess: (InkBlobs) ->
      $(".fileDrop").text "Done, see result below"
      for ink in InkBlobs
        file =
          boxId: Session.get('currentBoxId')
          url: ink.url
          name: ink.filename
          size: ink.size
        Meteor.call 'makeFile', file, (error, id)->
          if error
            Errors.throw(error.reason)

    onError: (type, message) ->
      Errors.throw("(" + type + ") " + message)

    onProgress: (percentage) ->
      $(".fileDrop").text "Uploading (" + percentage + "%)"
