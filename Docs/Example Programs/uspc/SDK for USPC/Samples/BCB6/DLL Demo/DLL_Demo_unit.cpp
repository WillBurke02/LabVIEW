//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DLL_Demo_unit.h"
#include "..\DLL_pcxus_exports.h"
ULONG   hPCXUS;
bool    USPC_opened=false;
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDLL_Demo_Frorm *DLL_Demo_Frorm;
//---------------------------------------------------------------------------
__fastcall TDLL_Demo_Frorm::TDLL_Demo_Frorm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDLL_Demo_Frorm::OpenClick(TObject *Sender)
{
  ULONG error;

  if(!USPC_opened)
  {
    error = PCXUS_Open(&hPCXUS, 2);
    if(error != 0)
    {
      StatusBar->Panels->Items[0]->Text = "USPC not open";
      StatusBar->Panels->Items[1]->Text = "Error = 0x" + IntToHex((int)error,8);
    }
    else
    {
      StatusBar->Panels->Items[0]->Text = "USPC opened";
      StatusBar->Panels->Items[1]->Text = "Error = no error";
      StatusBar->Panels->Items[2]->Text ="";
      USPC_opened = true;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TDLL_Demo_Frorm::CloseClick(TObject *Sender)
{
  ULONG error;

  if(USPC_opened)
  {
    error = PCXUS_Close(hPCXUS);
    if(error != 0)
    {
      StatusBar->Panels->Items[0]->Text = "USPC closed";
      StatusBar->Panels->Items[1]->Text = "Error = 0x" + IntToHex((int)error,8);
    }
    else
    {
      StatusBar->Panels->Items[0]->Text = "USPC closed";
      StatusBar->Panels->Items[1]->Text = "Error = no error";
      StatusBar->Panels->Items[2]->Text ="";
      USPC_opened=false;
      hPCXUS=NULL;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TDLL_Demo_Frorm::OnClose(TObject *Sender,
      TCloseAction &Action)
{
  CloseClick(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TDLL_Demo_Frorm::LoadClick(TObject *Sender)
{
  ULONG error;
  AnsiString filename;

  if(OpenDialog->Execute())
  {
    filename = OpenDialog->FileName;
    error = PCXUS_Load(-1,-1,(LPCSTR) filename.data());
    if(error != 0)
    {
      StatusBar->Panels->Items[1]->Text = "Error = 0x" + IntToHex((int)error,8);
      StatusBar->Panels->Items[2]->Text ="";
    }
    else
    {
      StatusBar->Panels->Items[1]->Text = "Error = no error";
      StatusBar->Panels->Items[2]->Text =filename;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TDLL_Demo_Frorm::SaveClick(TObject *Sender)
{
  ULONG error;
  AnsiString filename;

  if(SaveDialog->Execute())
  {
    filename = SaveDialog->FileName;
    error = PCXUS_Save(-1,-1,(LPCSTR) filename.data());
    if(error != 0)
    {
      StatusBar->Panels->Items[1]->Text = "Error = 0x" + IntToHex((int)error,8);
    }
    else
    {
      StatusBar->Panels->Items[1]->Text = "Error = no error";
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TDLL_Demo_Frorm::OnChange(TObject *Sender)
{
  ULONG error;
  double Gain;
  int Clip;
  if(USPC_opened)
  {
    Gain = (double) GainBar->Position;
    error = PCXUS_WRITE(hPCXUS, 0, 0, 0, "receiver_gain", &Gain, NULL,NULL,NULL, &Clip);
    if(error != 0)
    {
      StatusBar->Panels->Items[1]->Text = "Error = 0x" + IntToHex((int)error,8);
    }
    else
    {
      StatusBar->Panels->Items[1]->Text = "Error = no error";
    }
  }
  else StatusBar->Panels->Items[1]->Text = "Error = USPC not opened";
}
//---------------------------------------------------------------------------
