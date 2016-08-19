$( function() {
  var $object = $(".object");
  var $desktop = $("#lesson_desktop");
  var objectName;

    // let the objects be draggable
    $object.draggable({
      cursor: "move",
      grid: [20,20],
      opacity: 0.7,
      helper: "clone",
      containment: "#lesson_desktop",
      drag: function(event, ui) {
        objectName = $(this).attr("class").split(" ")[1];
      }
    });

    // let the desktop be droppable, accepting objects
    $desktop.droppable({
      accept: ".object",
      drop: function(event, ui) {
        addToLayout(objectName);
      }
    });

    // add dragged object to the desktop
    function addToLayout(objectName) {
      console.log(objectName);
      $desktop.append(objectName + "<br>");
    }
  } );
