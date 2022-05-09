db_path="~/kaldi/egs/tamil_telugu_proj/s5_r3/db"
db_path="."
for partition in "train" "dev" "test"; do
	for file_name in 'spk2utt' 'segments' 'utt2dur' 'text' 'utt2spk' 'wav.scp'; do
		target_file=$db_path/combined_transcription/$partition/$file_name
		rm $target_file
		for dataset in "asriitm_tamil" "mozillacv_tamil" "microsoft_tamil" "openslr_tamil"; do
			current_file=$db_path/$dataset/transcription/$partition/$file_name
			#https://stackoverflow.com/a/16198793/3465519
			#https://unix.stackexchange.com/questions/552188/how-to-remove-empty-lines-from-beginning-and-end-of-file
			sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' $current_file
			sed -i '/^$/d' $current_file
			sed -i '$a\' $current_file 
			cat $current_file >> $target_file
		done
		sed -i '/^$/d' $target_file
		sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' $target_file
		sed -i '$a\' $target_file 
	done
done