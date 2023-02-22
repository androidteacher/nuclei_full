cat gau_links/*  > gau_links/gau_compiled/unsorted.txt
cat gau_links/gau_compiled/unsorted.txt | sort -u | uniq > gau_links/gau_compiled/gau_compiled_non-filtered.txt
cat gau_links/gau_compiled/gau_compiled_non-filtered.txt | grep -i -v 'png$\|jpg$\|gif$\|jpeg$\|swf$\|woff$\|svg' > gau_links/gau_compiled/gau_compiled.txt


now=`date +"%Y-%m-%d-at-%H:%M"`
cp gau_links/gau_compiled/gau_compiled.txt gau_links/gau_compiled/previous_compiled/gau_compiled-${now}.txt
rm gau_links/*
for x in $(cat gau_links/gau_compiled/gau_compiled.txt); 
do
nuclei -as -u $x | tee -a results/results.txt
tail -n +2 gau_links/gau_compiled/gau_compiled.txt > gau_links/gau_compiled/gau_compiled_prev.txt
cp gau_links/gau_compiled/gau_compiled_prev.txt gau_links/gau_compiled/gau_compiled.txt
done

