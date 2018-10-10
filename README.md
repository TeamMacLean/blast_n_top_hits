## Introduction

Bash script to get top n best results. It uses the commands awk and sort for getting the results.

## Methodology

The input BLAST output hits are filtered for number of mismatches and gaps that are specified by user. Any hit with number of mismatches and gaps higher than user specified are remove.

The rest hits are sorted by Query, alignment length (descending order) and % identity in descending order.

From the sorted result, the top N hits are output for each query ID.

## Requirement

1) awk
2) gnu sort command
3) bash

## Usage:

bash scripts/get_top_n_blastoutput.sh -f ../assembly_comparison/results/bait_mapped_to_solanum.txt -m 0 -g 0 -t 3

Final result is output at the terminal. It can be saved to a file using redirection operator '>'

bash scripts/get_top_n_blastoutput.sh -f ../assembly_comparison/results/bait_mapped_to_solanum.txt -m 0 -g 0 -t 3 > myoutput.txt
