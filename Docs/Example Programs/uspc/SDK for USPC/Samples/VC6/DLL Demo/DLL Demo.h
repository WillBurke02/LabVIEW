// DLL Demo.h : main header file for the DLL DEMO application
//

#if !defined(AFX_DLLDEMO_H__E4D232C5_5F78_4FB7_9A46_ADB533560EBA__INCLUDED_)
#define AFX_DLLDEMO_H__E4D232C5_5F78_4FB7_9A46_ADB533560EBA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CDLLDemoApp:
// See DLL Demo.cpp for the implementation of this class
//

class CDLLDemoApp : public CWinApp
{
public:
	CDLLDemoApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDLLDemoApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CDLLDemoApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLLDEMO_H__E4D232C5_5F78_4FB7_9A46_ADB533560EBA__INCLUDED_)
