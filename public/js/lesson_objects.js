$( function() {
    $( ".object" ).draggable({
        cursor: "move",
        grid: [20,20],
        opacity: 0.7,
        helper: "clone",
        containment: "body"
      });
  } );
