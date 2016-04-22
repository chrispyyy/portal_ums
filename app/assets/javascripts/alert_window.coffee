# # Override Rails handling of confirmation
#
# $.rails.allowAction = (element) ->
#   # The message is something like "Are you sure?"
#   message = element.data('confirm')
#   # If there's no message, there's no data-confirm attribute,
#   # which means there's nothing to confirm
#   return true unless message
#   # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
#   $link = element.clone()
#     # We don't necessarily want the same styling as the original link/button.
#     .removeAttr('class')
#     # We don't want to pop up another confirmation (recursion)
#     .removeAttr('data-confirm')
#     # We want a button
#     .addClass('button').addClass('button is-danger')
#     # We want it to sound confirmy
#     .html("Yes, I'm positively certain.")
#
#     if element.get(0).tagName == "BUTTON"
#     random_id = Math.random().toString(36).substring(7)
#     $form = element.parent('form')
#     $form.attr('id', random_id)
#     $link.attr('onClick', "document.getElementById('#{random_id}').submit();")
#
#   # Create the modal box with the message
#   modal_html = """
#     <div class="modal" id="confirmationDialog">
#       <div class="modal-background"></div>
#       <div class="modal-container">
#         <div class="modal-content">
#           <h3>#{message}</h3>
#         </div>
#       </div>
#       <button class="modal-close">Cancel</button>
#     </div>
#                """
#   $modal_html = $(modal_html)
#   # Add the new button to the modal box
#   $modal_html.find('.modal-footer').append($link)
#   # Pop it up
#   $modal_html.modal()
#   # Prevent the original link from working
#   return false
