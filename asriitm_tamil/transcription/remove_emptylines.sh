for set in test dev train; do
    file_path=$set/wav.scp
	sed -i '/^$/d' $file_path
done
