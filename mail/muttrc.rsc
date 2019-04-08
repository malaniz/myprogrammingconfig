#======================================================#
# Boring details
set realname = "Marcelo Alaniz (Rockstart coder)"
set from = "marcelo.alaniz@mail.rockstarcoders.com"
set use_from = yes
set envelope_from ="yes"

# Use a signature
set signature="./sign.rsc"

# Use msmtp rather than sendmail. Check that
# the path is correct for your system:
#set sendmail="tsocks msmtp"

# ============================================== #
# Folders                                        #
set mbox_type = Maildir
set spoolfile = "/home/malaniz/.mail/marceloalanizATrockstarcoders" #
set folder    = "/home/malaniz/.mail/marceloalanizATrockstarcoders" # Local mailboxes stored here
set mask      = "!^\\.[^.]"                      #
set record    = "+sent"                          # Where to store sent messages
set postponed = "+postponed"                     # Where to store draft messages
set move      = no                               # Don't move mail from spool
# ============================================== #

source ./smtp.rsc
