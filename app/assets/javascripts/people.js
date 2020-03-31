$(document).ready(function () {
  $("table[role='datatable'").each(function(){
    $(this).DataTable({
      bFilter: false,
      bLengthChange: false,
      pageLength: 25,
      procesing: true,
      serverSide: true,
      ajax: $(this).data('url')
     });
  }) 
});
