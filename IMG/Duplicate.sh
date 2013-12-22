HF="$PWD/hashes.out"
echo HF=$HF
rm "$HF"
touch "$HF"
for x in `ls -bd *`; do
	echo x=$x
	cd $x
	for y in *; do
		m=`md5sum "$y" | awk -F '{print $1}'`
		echo $y: $m
		g=`grep $m "$HF"`
		echo g=$g
		if [[ "$g" != "" ]]; then
			echo "MATCH!!";
			echo rm "$y"
		else
			echo "no match"
			echo $m >> "$HF"
		fi
	done
	cd ..
done