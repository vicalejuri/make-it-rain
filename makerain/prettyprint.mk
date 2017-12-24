# Spaces should be in a variable, so...
# https://www.gnu.org/software/make/manual/make.html#Syntax-of-Functions
noop=
space = $(noop) $(noop)

# 👁️‍🗨️ Pretty compile!
CYAN=\033[0;36m
GREEN=\033[0;32m
RED=\033[0;31m
BOLD=\033[1m
MAGENTA=\033[0;35m

# No Color
NC=\033[0m

# Symbols
OK=✅
FAIL=❌
EMJ_ROCKET=🚀