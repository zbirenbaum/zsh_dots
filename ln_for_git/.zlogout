#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code only if STDERR is bound to a TTY.
# Commented because this is annoying and messes up windows terminal sometimes
# [[ -o INTERACTIVE && -t 2 ]] && {
#
# SAYINGS=(
#     "So long and thanks for all the fish.\n  -- Douglas Adams"
#     "Good morning! And in case I don't see ya, good afternoon, good evening and goodnight.\n  --Truman Burbank"
# )
#
# # Print a randomly-chosen message:
# echo $SAYINGS[$(($RANDOM % ${#SAYINGS} + 1))]
#
# } >&2
