$(document).ready(function () {
  $("table[role='datatable'").each(function(){
    $(this).DataTable({
      bFilter: false,
      bLengthChange: false,
      pageLength: 25,
      procesing: true,
      serverSide: true,
      ajax: $(this).data('url'),
      initComplete: function(settings, json) {
        $(".btn-char-count").on('click', function(event){
          event.stopPropagation();
          event.stopImmediatePropagation();
          email = $(this).data("user-email");
          user_id = $(this).data("user-id");
          counting_chars(email, user_id)
        });
      }
     });
  });

  function counting_chars(email, user_id) {
    var counts = {}
    for (var i = 0; i < email.length; i++) {
      if(counts[email[i]] == undefined)
        counts[email[i]] = 1
      else
        counts[email[i]] += 1
    }

    sorted = Object.entries(counts).sort((a, b) => b[1] - a[1]);
    new_table_body = '<tbody class="character-count"> ';

    jQuery.each(sorted, function(index, counted) {
      new_table_body = new_table_body +
        "<tr> <th scope='row'>" + counted[0] +
        " </th> <td> "+counted[1]+" </td> </tr>";
    });

    new_table_body = new_table_body + " </tbody> ";

    $('.character-count').replaceWith(new_table_body);
    $("#charCountModal").modal('toggle');
  }
});
