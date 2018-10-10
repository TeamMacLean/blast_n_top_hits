## Introduction

Most BLAST user want to get top N best hits. The option -max_target_seqs 1 is misleading to the most users that they think gives top 1 hit for each query. But it's not. See a paper here about this issue. https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/bty833/5106166

I have tried to get the top N best hits with this script. It uses the commands awk and sort for getting the results.

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
