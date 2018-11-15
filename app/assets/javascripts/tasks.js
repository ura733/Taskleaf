window.onload = function() {
  document.querySelectorAll('td').forEach(function(td) {
    td.addEventListener('mouseover', function(e){
      e.currentTarfet.style.backgroundColor = '#eff';
    });

    td.addEventListener('mouseout', function(e) {
      e.currentTatget.style.backgroundColor = '';
    });
  });
};
