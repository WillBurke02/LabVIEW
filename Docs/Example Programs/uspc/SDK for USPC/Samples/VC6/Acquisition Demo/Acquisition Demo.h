// Acquisition Demo.h : main header file for the ACQUISITION DEMO application
//

#if !defined(AFX_ACQUISITIONDEMO_H__0254FBF9_81D6_49E4_B6DC_7BF5CFD74A8D__INCLUDED_)
#define AFX_ACQUISITIONDEMO_H__0254FBF9_81D6_49E4_B6DC_7BF5CFD74A8D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CAcquisitionDemoApp:
// See Acquisition Demo.cpp for the implementation of this class
//

class CAcquisitionDemoApp : public CWinApp
{
public:
	CAcquisitionDemoApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAcquisitionDemoApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CAcquisitionDemoApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACQUISITIONDEMO_H__0254FBF9_81D6_49E4_B6DC_7BF5CFD74A8D__INCLUDED_)
