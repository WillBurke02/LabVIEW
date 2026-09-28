//
// This function extracts a specific data into data stream.
//
// Update 1 October 2004
//        -Add check channel number for MUX.
//
#include <vcl.h>

int acq_sort_data(int DataToExtract, BYTE *pData, int Channel, int NumberOfScans , int SizeOfBlock, int ByteNumber, int ByteMask, double *Array1D, double *Array2D)
{
	int	iblock, jblock;
    ULONG *p;

    p = (ULONG *) pData;
    jblock = 0;

	switch(DataToExtract)
    {
    case 0:	// A-scan
    	break;
    case 1: // A-scan HR
    	break;
    case 2:	// Amplitude Gate 1
    	for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
				Array1D[jblock]= (BYTE) *(pData+SizeOfBlock*4*iblock+8);
            	jblock++;
            }
        }
    	break;
    case 3:	// Amplitude Gate 2
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
				Array1D[jblock]= (BYTE) *(pData+SizeOfBlock*4*iblock+16);
            	jblock++;
            }
        }
    	break;
    case 4:	// TOF Gate 1
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((ULONG)(*(p+SizeOfBlock*iblock+3) & 0xFFFFFF)) * 0.005;
            	jblock++;
            }
        }
    	break;
    case 5:	// TOF Gate 2
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
        	Array1D[jblock]= ((ULONG)(*(p+SizeOfBlock*iblock+5) & 0xFFFFFF)) * 0.005;
            	jblock++;
            }
        }
    	break;
    case 6:	// TOF Gate IF
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((ULONG)(*(p+SizeOfBlock*iblock+7) & 0xFFFFFF)) * 0.005;
            	jblock++;
            }
        }
    	break;
    case 7:	// Counter 2 - Pulse counter
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= (ULONG) *(p+SizeOfBlock*iblock+1);
            	jblock++;
            }
        }
    	break;
    case 8:	// Counter 1 - Scan counter
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= (ULONG) *(p+SizeOfBlock*iblock+0);
            	jblock++;
            }
        }
    	break;
    case 9:	// DET 1
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+10) & 0x2)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 10:	// Alarm mini. 1
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+10) & 0x4)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 11:	// Alarm maxi. 1
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+10) & 0x8)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 12:	// Coupling alarm 1
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+10) & 0x1)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 13:	// DET 2
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+18) & 0x2)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 14:	// Alarm mini. 2
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+18) & 0x4)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 15:	// Alarm maxi. 2
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+18) & 0x8)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 16:	// Coupling alarm 2
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+18) & 0x1)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 17:	// DET IF
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+26) & 0x2)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 18:	// ENABLE (INPUT 1)
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= ((BYTE) *(pData+SizeOfBlock*4*iblock+26) & 0x4)? 1 : 0;
            	jblock++;
            }
        }
    	break;
    case 19:	// Specific byte
		for(iblock=0; iblock<NumberOfScans; iblock++)
        {
            // Update array only if channel is OK
            if((BYTE) *(pData+SizeOfBlock*4*iblock+25) == Channel)
            {
	        	Array1D[jblock]= (BYTE) (*(pData+SizeOfBlock*4*iblock+ByteNumber) & ByteMask);
            	jblock++;
            }
        }
    	break;
    }
    return jblock;
}
