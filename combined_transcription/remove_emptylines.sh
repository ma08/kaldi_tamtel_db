for set in test dev train; do
	for file_path in $set/*; do
		sed -i '/^$/d' $file_path
	done
done
