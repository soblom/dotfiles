for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

unset LSCOLORS
export CLICOLOR=1
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31'
#export LS_COLORS=exfxcxdxbxegedabagacad


color00="235" # Base 00 - Black
color01="124" # Base 08 - Red
color02="106" # Base 0B - Green
color03="172" # Base 0A - Yellow
color04="66" # Base 0D - Blue
color05="132" # Base 0E - Magenta
color06="72" # Base 0C - Cyan
color07="246" # Base 05 - White
color08="234" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="fb/f1/c7" # Base 07 - Bright White
color16="fe/80/19" # Base 09
color17="d6/5d/0e" # Base 0F
color18="3c/38/36" # Base 01
color19="50/49/45" # Base 02
color20="bd/ae/93" # Base 04
color21="eb/db/b2" # Base 06
color_foreground="d5/c4/a1" # Base 05
color_background="28/28/28" # Base 00
