unit Acquisition_global;

interface

Type
Array1D = array of Double;
Array2D =  array of array of Double;

var
  	hPCXUS: LongWord;
  	Board : integer = 0;
  	Channel : integer = 0;
  	BufferSize : Longword = 1000;
  	BlockSize : Longword;
  	NumberOfScansToAcquire : integer = 100;
  	Timeout : Longword = 5000;
  	Fluidity : integer = 50;
  	NumberRead : Longword;
  	iPoints : integer = 0;
    iPointsSerie : integer = 0;
  	pData: array of Byte;
	pCscan: Array1D;
  	pAscan: Array2D;

implementation

end.
 