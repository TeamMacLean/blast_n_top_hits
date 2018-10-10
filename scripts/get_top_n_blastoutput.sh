#!/bin/bash

mismatches=0
gaps=0
top=1


function usage
{
cat << EOF
usage: $0 < -m mismatches (default: 0) output_dir -g gaps (default: 0) -t 2 (default: 1)>
Example: bash $0 -m 2 -g 1 -t 3

OPTIONS:
        -h      Show this message
		-f		Input BLAST output filename
		-m		maximum number of mismatches to allow
		-g		maxinum number of gaps to allow
		-t		number of top hits to return


EOF
}

# ----------------------------------------------------------------------
# Main program
# ----------------------------------------------------------------------

while getopts hf:m:g:t:x: OPTION
do
    case $OPTION in
		h) usage ; exit 0 ;;
		f) blastout=$OPTARG;;
		m) mismatches=$OPTARG;;
		g) gaps=$OPTARG;;
		t) top=$OPTARG;;
    esac
done

#echo filename $blastout
#echo mismatches $mismatches
#echo gaps $gaps
#echo top $top
#echo mode $mode

awk -v mismatches="$mismatches" -v gaps="$gaps" -F "\t" '{if(mismatches <= $5 && gaps <= $6){print}}' $blastout | sort -k1,1 -k4nr -k3nr | awk -v top="$top" 'BEGIN{query=""; counter=1}{if(query!=$1){counter=1; print; query=$1;} else if(query==$1 && counter<top){print $0; counter+=1}}'
