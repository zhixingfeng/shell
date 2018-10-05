awk '
	BEGIN{ss="null"; lr=0; len=0; rec=""}
	{	
		if($1!=ss){
			if (lr>=15 && len>0){
				print rec;
			} 
			ss = $1; 
			rec = $0;
			len = $2;
			lr = $5;		
		}else{
			if ($2 > len && $5 >= 15){
				rec = $0;
				len = $2;
				lr = $5;
			}
			if ($2 == len && $5 >= 15){
				if ($5 > lr){
					rec = $0;
					lr $5;
				}
			}
		}
	}
	END{
		if (lr>=15 && len>0){
                	print rec;
                } 
	}
' $1



