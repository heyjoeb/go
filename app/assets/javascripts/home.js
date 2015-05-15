$(document).ready(function(){
  /* jshint strict: false */
  /*jshint camelcase: false */

  // OCULTAR USER ACTIONS DESPUÉS DE 2 SEGUNDOS


  setTimeout(function() {
    $('.user-actions').fadeOut();
  }, 2000);

  // ADD SLIDEDOWN ANIMATION TO DROPDOWN //
  $('.dropdown').on('show.bs.dropdown', function(){
    $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
  });


  // ADD SLIDEUP ANIMATION TO DROPDOWN //
  $('.dropdown').on('hide.bs.dropdown', function(){
    $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
  });

  /*
  // BOTÓN VISTA MAPA/LISTA
  $('.list-view').hide();
  $('.view-mode').click(function() {
      var $this = $(this);

      $this.toggleClass('list-mode');

      if ($this.hasClass('list-mode')) {
          $this.text('ver en modo mapa');
          $('.map-view').hide();
          $('.list-view').show();
      } else {
          $this.text('ver en modo lista');
          $('.map-view').show();
          $('.list-view').hide();
      }


  });
  // FANCYBOX //
  $('.fancybox').fancybox({
    padding: 0
  });
  

  // BOOTSTRAP DATEPICKER //
  $('.datepicker').datepicker();
  */
});


