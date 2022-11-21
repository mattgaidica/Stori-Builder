'use strict';

import utils from './Utils';

/*-----------------------------------------------
|   Tootltip [bootstrap 4]
-----------------------------------------------*/
utils.$document.ready(() => {
  // https://getbootstrap.com/docs/4.0/components/tooltips/#example-enable-tooltips-everywhere
  $('[data-bs-toggle="tooltip"]').tooltip({ container: '.content' });
  $('[data-bs-toggle="popover"]').popover({ container: '.content' });
  $('body').tooltip({
    selector: '[data-bs-toggle=tooltip]'
  })
});
