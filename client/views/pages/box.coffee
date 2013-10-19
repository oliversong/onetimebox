Template.boxPage.created = ()->
  @filesHandle = Meteor.subscribe 'files', Session.get('currentBoxId')

Template.boxPage.helpers(
  currentBox: ()->
    Boxes.findOne Session.get('currentBoxId')

  files: ()->
    Files.find({boxId: Session.get('currentBoxId')})
)

Template.boxPage.events(
  'click .altUpload': (e)->
    filepicker.pickMultiple (InkBlobs)->
      for ink in InkBlobs
        file =
          boxId: Session.get('currentBoxId')
          url: ink.url
          name: ink.filename
          size: ink.size
          type: ink.mimetype
        Meteor.call 'makeFile', file, (error, id)->
          if error
            Errors.throw(error.reason)
      $('.myUrl').val(document.URL)
      $(".float-in").addClass('float')
)

Template.boxPage.dropPaneSet = false

Template.boxPage.rendered = ()->
  unless Template.boxPage.dropPaneSet
    filepicker.setKey(filepickerKey)

    # create a drop pane
    filepicker.makeDropPane $(".fileDrop")[0],
      multiple: true
      dragEnter: ->
        $(".fileDrop").css
          backgroundColor: "#E0E0E0"
          border: "1px solid #000"
        $(".fileDrop div:first-child").html("Drop to upload")

      dragLeave: ->
        $(".fileDrop").css
            backgroundColor: "#F6F6F6"
            border: "dashed 2px #CCC"
        $(".fileDrop div:first-child").html("Drag files here")

      onSuccess: (InkBlobs) ->
        $(".fileDrop div:first-child").html("Shazam, done.")
        for ink in InkBlobs
          file =
            boxId: Session.get('currentBoxId')
            url: ink.url
            name: ink.filename
            size: ink.size
            type: ink.mimetype
          Meteor.call 'makeFile', file, (error, id)->
            if error
              Errors.throw(error.reason)
        $('.myUrl').val(document.URL)
        $(".float-in").addClass('float')


      onError: (type, message) ->
        Errors.throw("(" + type + ") " + message)

      onProgress: (percentage) ->
        $(".fileDrop div:first-child").html("Uploading (" + percentage + "%)")
        $(".altUpload").remove()

    Template.boxPage.dropPaneSet = true
