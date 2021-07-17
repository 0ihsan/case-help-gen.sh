ESC=$(printf '\033')
GREEN="${ESC}[32m";
YELLOW="${ESC}[33m";
RESET="${ESC}[0m";
INDENT="   ";

usage() {

	>&2 printf "%bUSAGE:%b\n\n%s" "${YELLOW}" "${RESET}" "${INDENT}";
	>&2 printf "%b [SUBCOMMAND]\n\n" "$(basename "$0")";

	>&2 printf "%bFLAGS:%b\n" "${YELLOW}" "${RESET}";
	sed -n '/case $[0-9] in/,$p' "$0" |
	   grep '([^)]*)' |
	   grep '(\-\|(\--' |
		sed "/(\*)/d;s/\t/${INDENT}/g;s/ #\([^#]*\)/\1/g" |
		sed "s/|/$RESET, $GREEN/g;s/(/$GREEN/g;s/)/$RESET/g"

	>&2 printf "\n%bSUBCOMMANDS:%b\n" "${YELLOW}" "${RESET}";
	sed -n '/case $[0-9] in/,$p' "$0" |
	   grep '([^)]*)' | grep -v '(\-' |
		sed "/(\*)/d;s/\t/${INDENT}/g" |
		sed "s/#\([^#]*\)/\1/g;s/(/$GREEN/g;s/)/$RESET/g"

}

