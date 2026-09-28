// Acquisition DemoDlg.h : header file
//
//{{AFX_INCLUDES()
#include "NiNumEdit.h"
#include "NiGraph.h"
//}}AFX_INCLUDES

#if !defined(AFX_ACQUISITIONDEMODLG_H__B3490555_657F_433A_BC7B_4EDE376622AB__INCLUDED_)
#define AFX_ACQUISITIONDEMODLG_H__B3490555_657F_433A_BC7B_4EDE376622AB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CAcquisitionDemoDlg dialog

class CAcquisitionDemoDlg : public CDialog
{
// Construction
public:
	CAcquisitionDemoDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CAcquisitionDemoDlg)
	enum { IDD = IDD_ACQUISITIONDEMO_DIALOG };
	CButton	m_StartContinously;
	CButton	m_StartN;
	CButton	m_StopAndClear;
	CComboBox	m_show;
	CNiNumEdit	m_Board;
	CNiNumEdit	m_Channel;
	CNiNumEdit	m_Fluidity;
	CNiNumEdit	m_BufferSize;
	CNiNumEdit	m_NumberOfScansToAcquire;
	CNiNumEdit	m_TimeOut;
	CNiGraph	m_Graph;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAcquisitionDemoDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CAcquisitionDemoDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnClose();
	afx_msg void OnbtHelp();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnbtStartN();
	afx_msg void OnbtStartContinously();
	afx_msg void OnValueChangedCwboard(VARIANT FAR* Value, VARIANT FAR* PreviousValue, BOOL OutOfRange);
	afx_msg void OnStopAndClear();
	virtual void OnOK();
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACQUISITIONDEMODLG_H__B3490555_657F_433A_BC7B_4EDE376622AB__INCLUDED_)
