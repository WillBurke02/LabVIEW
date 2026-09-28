// ActiveX DemoDlg.h : header file
//
//{{AFX_INCLUDES()
#include "_xuspc1.h"
//}}AFX_INCLUDES

#if !defined(AFX_ACTIVEXDEMODLG_H__0A139D86_06A0_11D6_AA64_0004768C0C8B__INCLUDED_)
#define AFX_ACTIVEXDEMODLG_H__0A139D86_06A0_11D6_AA64_0004768C0C8B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CActiveXDemoDlg dialog

class CActiveXDemoDlg : public CDialog
{
// Construction
public:
	CActiveXDemoDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CActiveXDemoDlg)
	enum { IDD = IDD_ACTIVEXDEMO_DIALOG };
	CListBox	m_Unit;
	CButton	m_Open;
	CButton	m_Load;
	CButton	m_Close;
	CButton	m_DACVisible;
	CButton	m_AutoRedraw;
	double	m_Gain;
	C_Xuspc1	m_Xuspc;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CActiveXDemoDlg)
	public:
	virtual BOOL DestroyWindow();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CActiveXDemoDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnOpen();
	afx_msg void OnClose();
	afx_msg void OnLoad();
	afx_msg void OnAutoredraw();
	afx_msg void OnDacvisible();
	afx_msg void OnSelchangeUnit();
	afx_msg void OnButton1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ACTIVEXDEMODLG_H__0A139D86_06A0_11D6_AA64_0004768C0C8B__INCLUDED_)
