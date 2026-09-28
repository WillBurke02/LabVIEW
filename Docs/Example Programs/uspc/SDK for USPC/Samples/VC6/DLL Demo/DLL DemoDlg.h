// DLL DemoDlg.h : header file
//

#if !defined(AFX_DLLDEMODLG_H__D05B7AE9_A22F_4934_B903_2975007C9B2A__INCLUDED_)
#define AFX_DLLDEMODLG_H__D05B7AE9_A22F_4934_B903_2975007C9B2A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CDLLDemoDlg dialog

class CDLLDemoDlg : public CDialog
{
// Construction
public:
	CDLLDemoDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDLLDemoDlg)
	enum { IDD = IDD_DLLDEMO_DIALOG };
	CSliderCtrl	m_Gain;
	int		m_Gain2;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDLLDemoDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDLLDemoDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnLoad();
	afx_msg void OnOpen();
	afx_msg void OnSave();
	afx_msg void OnReleasedcaptureGain(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnCloseUSPC();
	afx_msg void OnClose();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLLDEMODLG_H__D05B7AE9_A22F_4934_B903_2975007C9B2A__INCLUDED_)
