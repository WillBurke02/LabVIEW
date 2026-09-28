//---------------------------------------------------------------------------

#ifndef Acquisition_Demo_UnitH
#define Acquisition_Demo_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "CSPIN.h"
#include <ExtCtrls.hpp>
#include <Chart.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Series.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
ULONG	hPCXUS;		// handle to USPC
int		Board=0;
int		Channel=0;
ULONG	BufferSize=1000;
ULONG	BlockSize;
int     NumberOfScansToAcquire=100;
ULONG	TimeOut=5000;
int		Fluidity=50;
BYTE   	*pData;
double	*pCscan;
ULONG 	iPoints=0;
char	ErrorMessage[255];
//---------------------------------------------------------------------------
class TAcquisition_Demo : public TForm
{
__published:	// Composants gérés par l'EDI
	TEdit *EditBoard;
	TEdit *EditChannel;
	TLabel *Label1;
	TLabel *Label2;
	TEdit *EditBufferSize;
	TEdit *EditNbScans;
	TLabel *Label3;
	TLabel *Label4;
	TEdit *EditTimeOut;
	TLabel *Label5;
	TChart *Cscan;
	TFastLineSeries *Series1;
	TButton *BtStartN;
	TButton *BtStop;
	TButton *BtStartContinously;
	TComboBox *cbShow;
	TLabel *Label6;
	TEdit *EditFluidity;
	TLabel *Label7;
	TLabel *lbHelp;
	TTimer *ReadTimer;
    void __fastcall OnCreate(TObject *Sender);
    void __fastcall OnClose(TObject *Sender, TCloseAction &Action);
	void __fastcall BoardOnChange(TObject *Sender);
	void __fastcall ChannelOnChange(TObject *Sender);
	void __fastcall BufferSizeOnChange(TObject *Sender);
	void __fastcall NbScansOnChange(TObject *Sender);
	void __fastcall TimeOutOnChange(TObject *Sender);
	void __fastcall FluidityOnChange(TObject *Sender);
	void __fastcall BtStartNClick(TObject *Sender);
	void __fastcall BtStopClick(TObject *Sender);
	void __fastcall BtStartContinouslyClick(TObject *Sender);
	void __fastcall lbHelpClick(TObject *Sender);
	void __fastcall ReadTimerTimer(TObject *Sender);
private:	// Déclarations de l'utilisateur
	void __fastcall StopAndClear(void);
public:		// Déclarations de l'utilisateur
    __fastcall TAcquisition_Demo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAcquisition_Demo *Acquisition_Demo;
//---------------------------------------------------------------------------
#endif


