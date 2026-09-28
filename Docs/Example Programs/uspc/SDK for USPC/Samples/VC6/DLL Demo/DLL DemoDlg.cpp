// DLL DemoDlg.cpp : implementation file
//

#include "stdafx.h"
#include "DLL Demo.h"
#include "DLL DemoDlg.h"
#include "..\DLL_pcxus_exports.h"

ULONG	hPCXUS;
bool	USPC_opened=false;

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDLLDemoDlg dialog

CDLLDemoDlg::CDLLDemoDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDLLDemoDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDLLDemoDlg)
	m_Gain2 = 0;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDLLDemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDLLDemoDlg)
	DDX_Control(pDX, IDC_GAIN, m_Gain);
	DDX_Slider(pDX, IDC_GAIN, m_Gain2);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDLLDemoDlg, CDialog)
	//{{AFX_MSG_MAP(CDLLDemoDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_LOAD, OnLoad)
	ON_BN_CLICKED(IDC_OPEN, OnOpen)
	ON_BN_CLICKED(IDC_SAVE, OnSave)
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_GAIN, OnReleasedcaptureGain)
	ON_BN_CLICKED(IDC_CLOSE, OnCloseUSPC)
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDLLDemoDlg message handlers

BOOL CDLLDemoDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_Gain.SetRange(0, 70, TRUE);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CDLLDemoDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CDLLDemoDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDLLDemoDlg::OnOpen() 
{
	// TODO: Add your control notification handler code here
	ULONG	error;
	char	MSG[100];

	if(!USPC_opened)
	{
		error = PCXUS_Open(&hPCXUS, 2);
		if(error != 0)
		{
			sprintf(MSG,"Open error 0x%08x",error);
			MessageBox(MSG,"Error");
		}
		else USPC_opened=true;
	}
	else MessageBox("USPC was opened yet","Error");
}

void CDLLDemoDlg::OnLoad() 
{
	// TODO: Add your control notification handler code here
	TCHAR	szFilters[]=_T("UT files (*.us) | *.us ||");
	
	//Display the fiel dialog. When the user clicks OK, fileDlg.DoModal() return IDOK.
	CFileDialog fileDlg(TRUE, _T("us"), _T("c:\\uspc\\ut_files\\*.us"), OFN_HIDEREADONLY | OFN_FILEMUSTEXIST, szFilters, NULL);
	if(fileDlg.DoModal()==IDOK)
	{
		CString pathName = fileDlg.GetPathName();
		ULONG	error;
		char	MSG[100];

		UpdateData(true);

		//Display Hourglass cursor
		SetCursor(LoadCursor(NULL,IDC_WAIT));

		error = PCXUS_Load (-1, -1,  (LPCSTR) pathName.GetBuffer(0));
		if(error != 0)
		{
			sprintf(MSG,"Load error 0x%08d",error);
			MessageBox(MSG,"Error");
		}

		//Display normal cursor
		SetCursor(LoadCursor(NULL,IDC_ARROW));

		UpdateData(false);
	}
}

void CDLLDemoDlg::OnSave() 
{
	// TODO: Add your control notification handler code here
	TCHAR	szFilters[]=_T("UT files (*.us) | *.us ||");
	
	//Display the fiel dialog. When the user clicks OK, fileDlg.DoModal() return IDOK.
	CFileDialog fileDlg(FALSE, _T("us"), _T("c:\\uspc\\ut_files\\*.us"), OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, szFilters, NULL);
	if(fileDlg.DoModal()==IDOK)
	{
		CString pathName = fileDlg.GetPathName();
		ULONG	error;
		char	MSG[100];

		UpdateData(true);

		//Display Hourglass cursor
		SetCursor(LoadCursor(NULL,IDC_WAIT));

		error = PCXUS_Save(-1, -1,  (LPCSTR) pathName.GetBuffer(0));
		if(error != 0)
		{
			sprintf(MSG,"Save error 0x%08d",error);
			MessageBox(MSG,"Error");
		}

		//Display normal cursor
		SetCursor(LoadCursor(NULL,IDC_ARROW));

		UpdateData(false);
	}
}

void CDLLDemoDlg::OnReleasedcaptureGain(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	ULONG	error;
	char	MSG[100];

	UpdateData(true);

	int		Clip;
	double  Gain=m_Gain2;

	error = PCXUS_WRITE(hPCXUS,0,0,0, "receiver_gain", &Gain, NULL, NULL, NULL, &Clip);
	if(error != 0)
	{
		sprintf(MSG,"Write error 0x%08d",error);
		MessageBox(MSG,"Error");
	}
	else
	{
		if(Clip != 0)MessageBox("Gain out of range !", "Error");
	}

	UpdateData(false);
	*pResult = 0;
}

void CDLLDemoDlg::OnCloseUSPC() 
{
	// TODO: Add your control notification handler code here
	ULONG	error;
	char	MSG[100];
	if(USPC_opened)
	{
		error = PCXUS_Close(hPCXUS);
		if(error != 0)
		{
			sprintf(MSG,"Close error 0x%08x",error);
			MessageBox(MSG,"Error");
		}
		else USPC_opened=false;
	}
	else MessageBox("USPC doesn't open","Error");	
}

void CDLLDemoDlg::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	if(USPC_opened) OnCloseUSPC();

	CDialog::OnClose();
}
