for dir in $(find export-new/ -maxdepth 1 -mindepth 1 -type d | grep -v .venv | sort); do
	d=$(echo "$dir" | cut -d/ -f2-)
	echo $d
	echo 'channel	user	ts' > "messages/$d.tsv"
	cat $dir/2021*.json | jq '.[] | (select(.type="message")) | [.user, .ts] | @tsv' -r > "messages/$d-data.tsv";
	sed -i "s/^/$d\t/g" "messages/$d-data.tsv"
	cat "messages/$d-data.tsv" >> "messages/$d.tsv"
	rm "messages/$d-data.tsv"
done
