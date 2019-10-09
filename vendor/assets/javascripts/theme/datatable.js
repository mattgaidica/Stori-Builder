'use strict';

/*-----------------------------------------------
|   Data table
-----------------------------------------------*/
window.utils.$document.ready(() => {
  
  // $.fn.dataTable.ext.classes.sPageButton = 'btn btn-falcon-default btn-sm';
  const dataTables = $('.data-table');
  const customDataTable = (elem) => {
    elem.find('table').find('tfoot').addClass('bg-200');
    elem
      .find('.pagination')
      .addClass('pagination-sm');
    //   .closest('[class*="col"]')
    //   .removeClass('col-sm-12 col-md-7')
    //   .addClass('col-auto mt-2 px-1')
    //   .closest('.row')
    //   .addClass('no-gutters justify-content-center justify-content-md-between px-3 pb-3');
  };
  dataTables.length && dataTables.each((index, value) => {
    const $this = $(value);
    const options = $.extend({responsive: true}, $this.data('options'));
    $this.DataTable(options);
    const $wrpper = $this.closest('.dataTables_wrapper');
    customDataTable($wrpper);
    $this.on('draw.dt', () => customDataTable($wrpper));
  });
});
