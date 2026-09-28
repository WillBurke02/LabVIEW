// ActiveX DemoDlg.cpp : implementation file
//

#include "stdafx.h"
#include "ActiveX Demo.h"
#include "ActiveX DemoDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActiveXDemoDlg dialog

CActiveXDemoDlg::CActiveXDemoDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CActiveXDemoDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CActiveXDemoDlg)
	m_Gain = 0.0;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CActiveXDemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CActiveXDemoDlg)
	DDX_Control(pDX, IDC_UNIT, m_Unit);
	DDX_Control(pDX, IDC_OPEN, m_Open);
	DDX_Control(pDX, IDC_LOAD, m_Load);
	DDX_Control(pDX, IDC_CLOSE, m_Close);
	DDX_Control(pDX, IDC_DACVISIBLE, m_DACVisible);
	DDX_Control(pDX, IDC_AUTOREDRAW, m_AutoRedraw);
	DDX_Text(pDX, IDC_GAIN, m_Gain);
	DDV_MinMaxDouble(pDX, m_Gain, 0., 70.);
	DDX_Control(pDX, IDC_XUSPC1, m_Xuspc);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CActiveXDemoDlg, CDialog)
	//{{AFX_MSG_MAP(CActiveXDemoDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_OPEN, OnOpen)
	ON_BN_CLICKED(IDC_CLOSE, OnClose)
	ON_BN_CLICKED(IDC_LOAD, OnLoad)
	ON_BN_CLICKED(IDC_AUTOREDRAW, OnAutoredraw)
	ON_BN_CLICKED(IDC_DACVISIBLE, OnDacvisible)
	ON_LBN_SELCHANGE(IDC_UNIT, OnSelchangeUnit)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CActiveXDemoDlg message handlers

BOOL CActiveXDemoDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_Unit.AddString("µs");	
	m_Unit.AddString("mm");	
	m_Unit.AddString("inch");
	m_Unit.SelectString(0,"µs");
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CActiveXDemoDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CActiveXDemoDlg::OnPaint() 
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
HCURSOR CActiveXDemoDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


void CActiveXDemoDlg::OnOpen() 
{
	// TODO: Add your control notification handler code here
	ULONG	Error;
	char	Message[100];

	//Display Hourglass cursor
	SetCursor(LoadCursor(NULL,IDC_WAIT));

	UpdateData(true);


	//Call Open method (with boot type = 2 => Do not reboot if another application has booted yet)
	Error = m_Xuspc.USPC_Open("", 2);
	if(Error != 0)
	{
		sprintf(Message,"Open error - %d",Error);
		MessageBox(Message,"Error");
	}
	else
	{
		//Enable Load, Close and AutoRedraw buttons
		m_Load.EnableWindow(true);
		m_Close.EnableWindow(true);
		m_AutoRedraw.EnableWindow(true);

		//Set Ascan n°1 with Board 1 and Channel 1 (Ascan index, borad and channel are zero based)
		m_Xuspc.AscanSource( 0, 0, 0, "");
	}

	UpdateData(false);

	//Display normal cursor
	SetCursor(LoadCursor(NULL,IDC_ARROW));
}

void CActiveXDemoDlg::OnClose() 
{
	// TODO: Add your control notification handler code here
	UpdateData(true);
	
	//Stop Ascan
	m_Xuspc.SetAutoRedraw(false);
	m_AutoRedraw.SetWindowText("Auto Redraw OFF");

	//Call Close method
	m_Xuspc.USPC_Close("");

	//Update buttons stats
	m_Open.EnableWindow(true);
	m_Load.EnableWindow(false);
	m_Close.EnableWindow(false);
	m_AutoRedraw.EnableWindow(false);

	UpdateData(false);
}

void CActiveXDemoDlg::OnLoad() 
{
	// TODO: Add your control notification handler code here
	TCHAR	szFilters[]=_T("UT files (*.us) | *.us ||");
	
	//Display the fiel dialog. When the user clicks OK, fileDlg.DoModal() return IDOK.
	CFileDialog fileDlg(TRUE, _T("us"), _T("c:\\uspc\\ut_files\\*.us"), OFN_HIDEREADONLY | OFN_FILEMUSTEXIST, szFilters, NULL);
	if(fileDlg.DoModal()==IDOK)
	{
		CString pathName = fileDlg.GetPathName();
		ULONG	Error;
		char	Message[100];

		UpdateData(true);

		//Display Hourglass cursor
		SetCursor(LoadCursor(NULL,IDC_WAIT));

		Error = m_Xuspc.USPC_Load("", -1, -1, pathName);
		if(Error != 0)
		{
			sprintf(Message,"Load error - %d",Error);
			MessageBox(Message,"Error");
		}

		//Display normal cursor
		SetCursor(LoadCursor(NULL,IDC_ARROW));

		UpdateData(false);
	}

}

void CActiveXDemoDlg::OnAutoredraw() 
{
	// TODO: Add your control notification handler code here

	//Change AutoRedraw property
	m_Xuspc.SetAutoRedraw(!m_Xuspc.GetAutoRedraw());

	//Change caption of button
	if(m_Xuspc.GetAutoRedraw())
	{
		m_AutoRedraw.SetWindowText("Auto Redraw ON");
	}
	else
	{
		m_AutoRedraw.SetWindowText("Auto Redraw OFF");
	}
}

void CActiveXDemoDlg::OnDacvisible() 
{
	// TODO: Add your control notification handler code here
	
	//Change DACVisible property
	m_Xuspc.SetDACVisible(!m_Xuspc.GetDACVisible());

	//Change caption of button
	if(m_Xuspc.GetDACVisible())
	{
		m_DACVisible.SetWindowText("DAC visible ON");
	}
	else
	{
		m_DACVisible.SetWindowText("DAC visible OFF");
	}
}

BOOL CActiveXDemoDlg::DestroyWindow() 
{
	// TODO: Add your specialized code here and/or call the base class
	
	//Close USPC if USPC is opened
	if(m_Close.IsWindowEnabled())
	{
		OnClose();
	}

	return CDialog::DestroyWindow();
}

void CActiveXDemoDlg::OnSelchangeUnit() 
{
	// TODO: Add your control notification handler code here

	//Change Unit property
	if(m_Unit.GetSel(0)) m_Xuspc.SetUnit(0);
	if(m_Unit.GetSel(1)) m_Xuspc.SetUnit(1);
	if(m_Unit.GetSel(2)) m_Xuspc.SetUnit(2);
}

// This subroutine copies an array into a variant
VARIANT CopyArrayToVariant(VARIANT varData, double T[], int n)
{
	LONG lIndex = 0;
	HRESULT hr = 0;

	VARIANT vardbl;
	
	vardbl.vt=VT_R8;

	SAFEARRAY FAR* psa;
	SAFEARRAYBOUND rgsabound[1];
	rgsabound[0].lLbound = 0;
	rgsabound[0].cElements = n;
	psa = SafeArrayCreate(VT_VARIANT, 1, rgsabound);

	for(lIndex=0;lIndex<n;lIndex++)
	{
		vardbl.dblVal =  T[lIndex];
		hr = SafeArrayPutElement(psa, &lIndex, &vardbl);
	}

	varData.vt = VT_R8 | VT_ARRAY;
	V_ARRAY(&varData) = psa;

	return varData;
}

void CActiveXDemoDlg::OnButton1() 
{
	// TODO: Add your control notification handler code here
	// TODO: Add your control notification handler code here
	UpdateData(true);
	
	//Call Write method to change Gain
	VARIANT	v_tbl1, v_tbl2, v_string;
	double	T[100];
	LONG	Clip;
	double  Gain=m_Gain;

	// Init variants
	VariantInit(&v_tbl1);
	VariantInit(&v_tbl2);
	VariantInit(&v_string);
    
	v_string.vt = VT_BSTR;
    v_string.bstrVal = SysAllocString(L"");
	
	v_tbl1 = CopyArrayToVariant(v_tbl1,T,100);
	v_tbl2 = CopyArrayToVariant(v_tbl2,T,100);

	m_Xuspc.USPC_Write("", 0L, 0L, 0L, "receiver_gain", &Gain, &v_tbl1, &v_tbl2, &v_string, &Clip);
	if(Clip != 0)MessageBox("Gain out of range !", "Error");
	
	SysFreeString(v_string.bstrVal);
	
	VariantClear(&v_tbl1);
	VariantClear(&v_tbl2);
	VariantClear(&v_string);

	UpdateData(false);	
}

