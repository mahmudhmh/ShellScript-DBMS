echo "Available tables in $1"
ls data/$1
read -p "Enter table Name: " dtb
if [[ -f data/$1/$dtb ]]; then
	awk -F: 'BEGIN{FS=" - "}{if(NR==1){print $0}}' data/$1/$dtb;
	read -p "Enter column to delete record from  : " coldel;
	read -p "Enter value : " vldel;
	awk -F:  'BEGIN{FS=":"}
	{
		if(NR==1){
			for(i=1;i<=NF;i++){
				if($i=="'$coldel'"){var=i}
			}
		}
		else{
			if($var=='$vldel'){
				loc=NR
			}
		}
		{if(NR!=loc)print 
		}
	}' data/$1/$dtb > tmp && mv tmp data/$1/$dtb;
else
	echo "$updtb doesn't exist";
fi