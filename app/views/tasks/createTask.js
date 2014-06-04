$("#TaskList tr:last").append("<%= escape_javascript( render :partial => 'form', :locals => {:prenom => @activity} ) %>")
$("#prenom_text").val('').focus()

