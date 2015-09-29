var paintIt = function(element, backgroundColor, textColor) {
  element.style.backgroundColor = backgroundColor;
  if (textColor != null) {
    return element.style.color = textColor;
  }
};

// var dropZoneOne = document.querySelector('#sprint');
// var dragElement = document.querySelectorAll('.one_issue');

// var moveit = function() {	
// 	('.one_issue').draggable({distance: 200});
// }

