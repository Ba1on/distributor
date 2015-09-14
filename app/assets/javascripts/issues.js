var dragObject = {};

document.onmousedown = function(e) {

  if (e.which != 1) { // если клик правой кнопкой мыши
    return; // то он не запускает перенос
  }

  var elem = e.target.closest('.one_issue');

  if (!elem) return; // не нашли, клик вне draggable-объекта

  // запомнить переносимый объект
  dragObject.elem = elem;

  // запомнить координаты, с которых начат перенос объекта
  dragObject.downX = e.pageX;
  dragObject.downY = e.pageY;
}
//позже