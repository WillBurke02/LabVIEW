{--------------------------------------------------------------------------------------------
This procdure extract a specific signal into C-scan data stream
Update 1 October 2004 -Add check channel number for MUX
Update 2 April 2006   -Invert counter 1 & counter into acq_sort_data
---------------------------------------------------------------------------------------------}
unit Acquisition_sort_data;

interface
uses
  Dialogs,SysUtils, Acquisition_global;


function acq_sort_data(
	DataToExtract : integer;
        var pData : array of Byte;
		Channel : integer;
        NumberOfScans : Longword; SizeOfBlock : Longword;
        ByteNumber : Longword; ByteMask : Byte;
        Cscan: Array1D; Ascan : Array2D):integer;

implementation

function acq_sort_data(
        DataToExtract : integer;
        var pData : array of Byte;
		Channel : integer;
        NumberOfScans : Longword; SizeOfBlock : Longword;
        ByteNumber : Longword; ByteMask : Byte;
        Cscan: Array1D; Ascan : Array2D):integer;
var
	iblock : integer;
        jblock : integer;
begin
        jblock:=0;
        case DataToExtract of
        2:	{ Amplitude Gate 1 }
    		for iblock:=0 to NumberOfScans-1 do
	    	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	    	    	Cscan[jblock]:= pData[SizeOfBlock*4*iblock+8];
                    jblock := jblock + 1;
                end;
        	end;
	    3: { Amplitude Gate 2 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		Cscan[jblock]:= pData[SizeOfBlock*4*iblock+16];
                    jblock := jblock + 1;
                end;
	        end;
    	4: { TOF Gate 1 }
    		for iblock:=0 to NumberOfScans-1 do
	        begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	    	    	Cscan[jblock]:= pData[SizeOfBlock*4*iblock+12]
	        	     	+ 256 * pData[SizeOfBlock*4*iblock+13]
    	        	    + 65536 * pData[SizeOfBlock*4*iblock+14];
	    	        Cscan[jblock]:= Cscan[jblock]/1000.0 * 5.0;
                    jblock := jblock + 1;
                end;
    	    end;
	    5: { TOF Gate 2 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
		        	Cscan[jblock]:= pData[SizeOfBlock*4*iblock+20]
    		         	+ 256 * pData[SizeOfBlock*4*iblock+21]
        		        + 65536 * pData[SizeOfBlock*4*iblock+22];
	        	    Cscan[jblock]:= Cscan[jblock]/1000.0 * 5.0;
                    jblock := jblock + 1;
                end;
    	    end;
	    6: { TOF Gate IF }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
		        	Cscan[jblock]:= pData[SizeOfBlock*4*iblock+28]
    		         	+ 256 * pData[SizeOfBlock*4*iblock+29]
        		        + 65536 * pData[SizeOfBlock*4*iblock+30];
            		Cscan[jblock]:= Cscan[jblock]/1000.0 * 5.0;
                    jblock := jblock + 1;
                end;
	        end;
    	7: { Counter 2 - Pulse counter }
    		for iblock:=0 to NumberOfScans-1 do
	        begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	    	    	Cscan[jblock]:= pData[SizeOfBlock*4*iblock+4]
    	    	     	+ 256 * pData[SizeOfBlock*4*iblock+5]
        	    	    + 65536 * pData[SizeOfBlock*4*iblock+6]
            	    	+ 16777216 * pData[SizeOfBlock*4*iblock+7];
                    jblock := jblock + 1;
                end;
	        end;
    	8: { Counter 1 - Scan counter }
    		for iblock:=0 to NumberOfScans-1 do
	        begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	    	    	Cscan[jblock]:= pData[SizeOfBlock*4*iblock+0]
    	    	     	+ 256 * pData[SizeOfBlock*4*iblock+1]
        	    	    + 65536 * pData[SizeOfBlock*4*iblock+2]
            	    	+ 16777216 * pData[SizeOfBlock*4*iblock+3];
                    jblock := jblock + 1;
                end;
	        end;
    	9: { DET 1 }
    		for iblock:=0 to NumberOfScans-1 do
	        begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	    	    	if( (pData[SizeOfBlock*4*iblock+10] and 2) <> 0)then
    	    	    	Cscan[jblock]:=1
        	    	else
	        	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
    	    end;
	    10:	{ Alarm mini. 1 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		if( (pData[SizeOfBlock*4*iblock+10] and 4) <> 0)then
		            	Cscan[jblock]:=1
    		        else
        		    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
	        end;
    	11:	{ Alarm maxi. 1 }
    		for iblock:=0 to NumberOfScans-1 do
	        begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	    	    	if( (pData[SizeOfBlock*4*iblock+10] and 8) <> 0)then
    	    	    	Cscan[jblock]:=1
        	    	else
	        	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
    	    end;
	    12:	{ Coupling alarm 1 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		if( (pData[SizeOfBlock*4*iblock+10] and 1) <> 0)then
    	        		Cscan[jblock]:=1
	    	        else
    	    	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
        	end;
	    13: { DET 2 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		if( (pData[SizeOfBlock*4*iblock+18] and 2) <> 0)then
    	        		Cscan[jblock]:=1
	    	        else
    	    	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
        	end;
	    14:	{ Alarm mini. 2 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		if( (pData[SizeOfBlock*4*iblock+18] and 4) <> 0)then
    	        		Cscan[jblock]:=1
	    	        else
    	    	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
        	end;
	    15:	{ Alarm maxi. 2 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
		        	if( (pData[SizeOfBlock*4*iblock+18] and 8) <> 0)then
    		        	Cscan[jblock]:=1
        		    else
	        	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
    	    end;
	    16:	{ Coupling alarm 1 }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		if( (pData[SizeOfBlock*4*iblock+18] and 1) <> 0)then
    	        		Cscan[jblock]:=1
	    	        else
    	    	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
        	end;
	    17: { DET IF }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		if( (pData[SizeOfBlock*4*iblock+26] and 2) <> 0)then
    	        		Cscan[jblock]:=1
	    	        else
    	    	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
        	end;
	    18: { ENABLE (IN1) }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		if( (pData[SizeOfBlock*4*iblock+26] and 4) <> 0)then
    	        		Cscan[jblock]:=1
	    	        else
    	    	    	Cscan[jblock]:=0;
                    jblock := jblock + 1;
                end;
        	end;
	    19: { Specific byte }
    		for iblock:=0 to NumberOfScans-1 do
        	begin
            	if(pData[SizeOfBlock*4*iblock+25] = Channel)then
                begin
	        		Cscan[jblock]:=pData[SizeOfBlock*4*iblock+ByteNumber] and ByteMask;
                    jblock := jblock + 1;
                end;
	        end;
    	else
    		ShowMessage('Error in "acq_sort_data". Data type: ' + IntToStr(DataToExtract) +' unknown');
	 	end;
	Result := jblock;
end;

end.
