//---------------------------------------------------------------------------

#ifndef DLL_Demo_unitH
#define DLL_Demo_unitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TDLL_Demo_Frorm : public TForm
{
__published:	// Composants gérés par l'EDI
        TButton *Open;
        TButton *Close;
        TButton *Load;
        TButton *Save;
        TStatusBar *StatusBar;
        TOpenDialog *OpenDialog;
        TSaveDialog *SaveDialog;
        TTrackBar *GainBar;
        TLabel *Label1;
        void __fastcall OpenClick(TObject *Sender);
        void __fastcall CloseClick(TObject *Sender);
        void __fastcall OnClose(TObject *Sender, TCloseAction &Action);
        void __fastcall LoadClick(TObject *Sender);
        void __fastcall SaveClick(TObject *Sender);
        void __fastcall OnChange(TObject *Sender);
private:	// Déclarations de l'utilisateur
public:		// Déclarations de l'utilisateur
        __fastcall TDLL_Demo_Frorm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDLL_Demo_Frorm *DLL_Demo_Frorm;
//---------------------------------------------------------------------------
#endif
