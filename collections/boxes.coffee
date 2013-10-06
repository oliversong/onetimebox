@Boxes = new Meteor.Collection('boxes')

Meteor.methods(
  makeBox: ()->
    box =
      files = []
    boxId = Boxes.insert(box)
    boxId
)
