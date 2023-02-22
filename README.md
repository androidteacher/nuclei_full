## This program should probably be run by no one, ever.

## amass_runner.sh
- requires amass installed and in your path
- backs up previous data to found/old_amass_results/
- read domains from in targets.txt and enumerates subdomains for each line
- subdomains found are written out to the found/ directory in a series of named files.
## myamass
- used by amass_runner to run a simple active enum
- I should probably put this in amass_runner.sh

## gau_runner.sh
- grabs all files found from amass in the found/folder
- sorts them into a single list in current_check/current_list.txt
- backs up current_list if it already exists to current_check/previous_lists/
- runs gau on each domain in current_list.txt
- writes the output to a series of named text files in gau_links/
- each line in current_list.txt is deleted after gau finishes running
## nuc_runner.sh
- Takes all files in gau_links and writes them to a single list in gau_links/gau_compiled/gau_compiled.txt
- The list is sorted and duplicates removed.
- This list is backed up to gau_links/gau_compiled/previous_compiled/
- nuclei is run with the critical, high, and medium flags for all templates on each line in the list.
- each time a domain is checked in gau_compiled.txt, it is deleted from the file.

## Use
- place target domains in target.txt
- run amass_runner.sh
- run gau_runner.sh
- run nuclei_runner.sh

