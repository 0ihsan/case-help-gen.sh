#=---------=# case-esac based arg parser and help screen generator #=---------=#
p(){ printf "$@";};e=$(p '\033');G="${e}[32m";Y="${e}[33m";R="${e}[0m";I="   ";
    g(){ grep "$@";};t(){ p "%b$1:%b\n" "$Y" "$R";}; i(){ p "$I";};usage(){
      >&2 t "USAGE";echo;i; >&2 p "%b [SUBCOMMAND]\n\n" "$(basename "$0")"
   >&2 t "FLAGS";sed -n '/case $[0-9] in/,$p' "$0"|g '([^)]*)'|g '(\-\|(\--'|
sed "/(\*)/d;s/\t/${I}/g;s/ #\([^#]*\)/\1/g;s/|/$R, $G/g;s/(/$G/g;s/)/$R/g";echo
 >&2 t "SUBCOMMANDS";sed -n '/case $[0-9] in/,$p' "$0"|g '([^)]*)'|g -v '(\-'|
     sed "/(\*)/d;s/\t/${I}/g"|sed "s/#\([^#]*\)/\1/g;s/(/$G/g;s/)/$R/g";}
#=-----------------------=# like a vegan burger huh #=------------------------=#
