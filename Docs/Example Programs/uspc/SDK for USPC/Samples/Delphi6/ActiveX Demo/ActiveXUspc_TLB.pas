unit ActiveXUspc_TLB;

// ************************************************************************ //
// AVERTISSEMENT                                                                 
// -------                                                                    
// Les types déclarés dans ce fichier ont été générés à partir de données lues 
// depuis la bibliothèque de types. Si cette dernière (via une autre bibliothèque de types 
// s'y référant) est explicitement ou indirectement ré-importée, ou la commande "Rafraîchir"  
// de l'éditeur de bibliothèque de types est activée lors de la modification de la bibliothèque 
// de types, le contenu de ce fichier sera régénéré et toutes les modifications      
// manuellement apportées seront perdues.                                     
// ************************************************************************ //

// PASTLWTR : $Revision:   1.130  $
// Fichier généré le 27/11/2002 15:51:23 depuis la bibliothèque de types ci-dessous.

// ************************************************************************  //
// Type Lib: C:\WINNT\system32\ActiveXUspc.ocx (1)
// LIBID: {2BEA765B-8C94-4D2C-BCAB-EC7B45BFB11D}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
// Erreurs :
//   Conseil : Membre 'µs' de 'XuspcUnit' modifié en '_s'
//   Conseil : Membre 'unit' de '_Xuspc' modifié en 'unit_'
//   Remarque : paramètre 'file' dans _Xuspc.USPC_Load changé en 'file_'
//   Remarque : paramètre 'file' dans _Xuspc.USPC_Save changé en 'file_'
//   Remarque : paramètre 'unit' dans _Xuspc.USPC_Read changé en 'unit_'
//   Remarque : paramètre 'unit' dans _Xuspc.USPC_Write changé en 'unit_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // L'unité doit être compilée sans pointeur à type contrôlé. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants, 
Windows;
  

// *********************************************************************//
// GUIDS déclarés dans la bibliothèque de types. Préfixes utilisés :    
//   Bibliothèques de types : LIBID_xxxx                                      
//   CoClasses              : CLASS_xxxx                                      
//   DISPInterfaces         : DIID_xxxx                                       
//   Non-DISP interfaces    : IID_xxxx                                        
// *********************************************************************//
const
  // Versions majeure et mineure de la bibliothèque de types
  ActiveXUspcMajorVersion = 1;
  ActiveXUspcMinorVersion = 0;

  LIBID_ActiveXUspc: TGUID = '{2BEA765B-8C94-4D2C-BCAB-EC7B45BFB11D}';

  IID__Xuspc: TGUID = '{E5A801ED-923A-4463-B0CB-7F226C26494A}';
  DIID___Xuspc: TGUID = '{BCAECE39-0530-42DD-BC92-9FB7B1D2C00D}';
  CLASS_Xuspc: TGUID = '{A52F4F97-CB79-443C-A416-4289AB0690AB}';

// *********************************************************************//
// Déclaration d'énumérations définies dans la bibliothèque de types    
// *********************************************************************//
// Constantes pour enum XuspcError
type
  XuspcError = TOleEnum;
const
  XUSPC_SUCCESS = $00000000;
  XUSPC_ERROR = $00000001;

// Constantes pour enum XuspcBorderStyle
type
  XuspcBorderStyle = TOleEnum;
const
  Border_None = $00000000;
  Border_Single = $00000001;

// Constantes pour enum XuspcBackStyle
type
  XuspcBackStyle = TOleEnum;
const
  Transparent = $00000000;
  Opaque = $00000001;

// Constantes pour enum XuspcAscanStyle
type
  XuspcAscanStyle = TOleEnum;
const
  FrameClassic = $00000000;
  Frame3D = $00000001;

// Constantes pour enum XuspcUnit
type
  XuspcUnit = TOleEnum;
const
  _s = $00000000;
  mm = $00000001;
  inch = $00000002;

type

// *********************************************************************//
// Déclaration Forward des types définis dans la bibliothèque de types    
// *********************************************************************//
  _Xuspc = interface;
  _XuspcDisp = dispinterface;
  __Xuspc = dispinterface;

// *********************************************************************//
// Déclaration de CoClasses définies dans la bibliothèque de types 
// (REMARQUE: On affecte chaque CoClasse à son Interface par défaut)              
// *********************************************************************//
  Xuspc = _Xuspc;


// *********************************************************************//
// Déclaration de structures, d'unions et d'alias.                        
// *********************************************************************//
  XuspcAscanSource = packed record
    Server: WideString;
    Board: Integer;
    Channel: Integer;
  end;

  XuspcAscanPosition = packed record
    Top: Integer;
    Left: Integer;
  end;

  XuspcAscanSize = packed record
    Width: Integer;
    Height: Integer;
  end;

  XuspcString = packed record
    chaine: array[0..10] of WideString;
  end;


// *********************************************************************//
// Interface   : _Xuspc
// Indicateurs : (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID        : {E5A801ED-923A-4463-B0CB-7F226C26494A}
// *********************************************************************//
  _Xuspc = interface(IDispatch)
    ['{E5A801ED-923A-4463-B0CB-7F226C26494A}']
    procedure GhostMethod__Xuspc_28_0; safecall;
    procedure GhostMethod__Xuspc_32_1; safecall;
    procedure GhostMethod__Xuspc_36_2; safecall;
    procedure GhostMethod__Xuspc_40_3; safecall;
    procedure GhostMethod__Xuspc_44_4; safecall;
    procedure GhostMethod__Xuspc_48_5; safecall;
    procedure GhostMethod__Xuspc_52_6; safecall;
    procedure GhostMethod__Xuspc_56_7; safecall;
    procedure GhostMethod__Xuspc_60_8; safecall;
    procedure GhostMethod__Xuspc_64_9; safecall;
    procedure GhostMethod__Xuspc_68_10; safecall;
    procedure GhostMethod__Xuspc_72_11; safecall;
    procedure GhostMethod__Xuspc_76_12; safecall;
    procedure GhostMethod__Xuspc_80_13; safecall;
    procedure GhostMethod__Xuspc_84_14; safecall;
    procedure GhostMethod__Xuspc_88_15; safecall;
    procedure GhostMethod__Xuspc_92_16; safecall;
    procedure GhostMethod__Xuspc_96_17; safecall;
    procedure GhostMethod__Xuspc_100_18; safecall;
    procedure GhostMethod__Xuspc_104_19; safecall;
    procedure GhostMethod__Xuspc_108_20; safecall;
    procedure GhostMethod__Xuspc_112_21; safecall;
    procedure GhostMethod__Xuspc_116_22; safecall;
    procedure GhostMethod__Xuspc_120_23; safecall;
    procedure GhostMethod__Xuspc_124_24; safecall;
    procedure GhostMethod__Xuspc_128_25; safecall;
    procedure GhostMethod__Xuspc_132_26; safecall;
    procedure GhostMethod__Xuspc_136_27; safecall;
    procedure GhostMethod__Xuspc_140_28; safecall;
    procedure GhostMethod__Xuspc_144_29; safecall;
    procedure GhostMethod__Xuspc_148_30; safecall;
    procedure GhostMethod__Xuspc_152_31; safecall;
    procedure GhostMethod__Xuspc_156_32; safecall;
    procedure GhostMethod__Xuspc_160_33; safecall;
    procedure GhostMethod__Xuspc_164_34; safecall;
    procedure GhostMethod__Xuspc_168_35; safecall;
    procedure GhostMethod__Xuspc_172_36; safecall;
    procedure GhostMethod__Xuspc_176_37; safecall;
    procedure GhostMethod__Xuspc_180_38; safecall;
    procedure GhostMethod__Xuspc_184_39; safecall;
    procedure GhostMethod__Xuspc_188_40; safecall;
    procedure GhostMethod__Xuspc_192_41; safecall;
    procedure GhostMethod__Xuspc_196_42; safecall;
    procedure GhostMethod__Xuspc_200_43; safecall;
    procedure GhostMethod__Xuspc_204_44; safecall;
    procedure GhostMethod__Xuspc_208_45; safecall;
    procedure GhostMethod__Xuspc_212_46; safecall;
    procedure GhostMethod__Xuspc_216_47; safecall;
    procedure GhostMethod__Xuspc_220_48; safecall;
    procedure GhostMethod__Xuspc_224_49; safecall;
    procedure GhostMethod__Xuspc_228_50; safecall;
    procedure GhostMethod__Xuspc_232_51; safecall;
    procedure GhostMethod__Xuspc_236_52; safecall;
    procedure GhostMethod__Xuspc_240_53; safecall;
    procedure GhostMethod__Xuspc_244_54; safecall;
    procedure GhostMethod__Xuspc_248_55; safecall;
    procedure GhostMethod__Xuspc_252_56; safecall;
    procedure GhostMethod__Xuspc_256_57; safecall;
    procedure GhostMethod__Xuspc_260_58; safecall;
    procedure GhostMethod__Xuspc_264_59; safecall;
    procedure GhostMethod__Xuspc_268_60; safecall;
    procedure GhostMethod__Xuspc_272_61; safecall;
    procedure GhostMethod__Xuspc_276_62; safecall;
    procedure GhostMethod__Xuspc_280_63; safecall;
    procedure GhostMethod__Xuspc_284_64; safecall;
    procedure GhostMethod__Xuspc_288_65; safecall;
    procedure GhostMethod__Xuspc_292_66; safecall;
    procedure GhostMethod__Xuspc_296_67; safecall;
    procedure GhostMethod__Xuspc_300_68; safecall;
    procedure GhostMethod__Xuspc_304_69; safecall;
    procedure GhostMethod__Xuspc_308_70; safecall;
    procedure GhostMethod__Xuspc_312_71; safecall;
    procedure GhostMethod__Xuspc_316_72; safecall;
    procedure GhostMethod__Xuspc_320_73; safecall;
    procedure GhostMethod__Xuspc_324_74; safecall;
    procedure GhostMethod__Xuspc_328_75; safecall;
    procedure GhostMethod__Xuspc_332_76; safecall;
    procedure GhostMethod__Xuspc_336_77; safecall;
    procedure GhostMethod__Xuspc_340_78; safecall;
    procedure GhostMethod__Xuspc_344_79; safecall;
    procedure GhostMethod__Xuspc_348_80; safecall;
    procedure GhostMethod__Xuspc_352_81; safecall;
    procedure GhostMethod__Xuspc_356_82; safecall;
    procedure GhostMethod__Xuspc_360_83; safecall;
    procedure GhostMethod__Xuspc_364_84; safecall;
    procedure GhostMethod__Xuspc_368_85; safecall;
    procedure GhostMethod__Xuspc_372_86; safecall;
    procedure GhostMethod__Xuspc_376_87; safecall;
    procedure GhostMethod__Xuspc_380_88; safecall;
    procedure GhostMethod__Xuspc_384_89; safecall;
    procedure GhostMethod__Xuspc_388_90; safecall;
    procedure GhostMethod__Xuspc_392_91; safecall;
    procedure GhostMethod__Xuspc_396_92; safecall;
    procedure GhostMethod__Xuspc_400_93; safecall;
    procedure GhostMethod__Xuspc_404_94; safecall;
    procedure GhostMethod__Xuspc_408_95; safecall;
    procedure GhostMethod__Xuspc_412_96; safecall;
    procedure GhostMethod__Xuspc_416_97; safecall;
    procedure GhostMethod__Xuspc_420_98; safecall;
    procedure GhostMethod__Xuspc_424_99; safecall;
    procedure GhostMethod__Xuspc_428_100; safecall;
    procedure GhostMethod__Xuspc_432_101; safecall;
    procedure GhostMethod__Xuspc_436_102; safecall;
    procedure GhostMethod__Xuspc_440_103; safecall;
    procedure GhostMethod__Xuspc_444_104; safecall;
    procedure GhostMethod__Xuspc_448_105; safecall;
    procedure GhostMethod__Xuspc_452_106; safecall;
    procedure GhostMethod__Xuspc_456_107; safecall;
    procedure GhostMethod__Xuspc_460_108; safecall;
    procedure GhostMethod__Xuspc_464_109; safecall;
    procedure GhostMethod__Xuspc_468_110; safecall;
    procedure GhostMethod__Xuspc_472_111; safecall;
    procedure GhostMethod__Xuspc_476_112; safecall;
    procedure GhostMethod__Xuspc_480_113; safecall;
    procedure GhostMethod__Xuspc_484_114; safecall;
    procedure GhostMethod__Xuspc_488_115; safecall;
    procedure GhostMethod__Xuspc_492_116; safecall;
    procedure GhostMethod__Xuspc_496_117; safecall;
    procedure GhostMethod__Xuspc_500_118; safecall;
    procedure GhostMethod__Xuspc_504_119; safecall;
    procedure GhostMethod__Xuspc_508_120; safecall;
    procedure GhostMethod__Xuspc_512_121; safecall;
    procedure GhostMethod__Xuspc_516_122; safecall;
    procedure GhostMethod__Xuspc_520_123; safecall;
    procedure GhostMethod__Xuspc_524_124; safecall;
    procedure GhostMethod__Xuspc_528_125; safecall;
    procedure GhostMethod__Xuspc_532_126; safecall;
    procedure GhostMethod__Xuspc_536_127; safecall;
    procedure GhostMethod__Xuspc_540_128; safecall;
    procedure GhostMethod__Xuspc_544_129; safecall;
    procedure GhostMethod__Xuspc_548_130; safecall;
    procedure GhostMethod__Xuspc_552_131; safecall;
    procedure GhostMethod__Xuspc_556_132; safecall;
    procedure GhostMethod__Xuspc_560_133; safecall;
    procedure GhostMethod__Xuspc_564_134; safecall;
    procedure GhostMethod__Xuspc_568_135; safecall;
    procedure GhostMethod__Xuspc_572_136; safecall;
    procedure GhostMethod__Xuspc_576_137; safecall;
    procedure GhostMethod__Xuspc_580_138; safecall;
    procedure GhostMethod__Xuspc_584_139; safecall;
    procedure GhostMethod__Xuspc_588_140; safecall;
    procedure GhostMethod__Xuspc_592_141; safecall;
    procedure GhostMethod__Xuspc_596_142; safecall;
    procedure GhostMethod__Xuspc_600_143; safecall;
    procedure GhostMethod__Xuspc_604_144; safecall;
    procedure GhostMethod__Xuspc_608_145; safecall;
    procedure GhostMethod__Xuspc_612_146; safecall;
    procedure GhostMethod__Xuspc_616_147; safecall;
    procedure GhostMethod__Xuspc_620_148; safecall;
    procedure GhostMethod__Xuspc_624_149; safecall;
    procedure GhostMethod__Xuspc_628_150; safecall;
    procedure GhostMethod__Xuspc_632_151; safecall;
    procedure GhostMethod__Xuspc_636_152; safecall;
    procedure GhostMethod__Xuspc_640_153; safecall;
    procedure GhostMethod__Xuspc_644_154; safecall;
    procedure GhostMethod__Xuspc_648_155; safecall;
    procedure GhostMethod__Xuspc_652_156; safecall;
    procedure GhostMethod__Xuspc_656_157; safecall;
    procedure GhostMethod__Xuspc_660_158; safecall;
    procedure GhostMethod__Xuspc_664_159; safecall;
    procedure GhostMethod__Xuspc_668_160; safecall;
    procedure GhostMethod__Xuspc_672_161; safecall;
    procedure GhostMethod__Xuspc_676_162; safecall;
    procedure GhostMethod__Xuspc_680_163; safecall;
    procedure GhostMethod__Xuspc_684_164; safecall;
    procedure GhostMethod__Xuspc_688_165; safecall;
    procedure GhostMethod__Xuspc_692_166; safecall;
    procedure GhostMethod__Xuspc_696_167; safecall;
    procedure GhostMethod__Xuspc_700_168; safecall;
    procedure GhostMethod__Xuspc_704_169; safecall;
    procedure GhostMethod__Xuspc_708_170; safecall;
    procedure GhostMethod__Xuspc_712_171; safecall;
    procedure GhostMethod__Xuspc_716_172; safecall;
    procedure GhostMethod__Xuspc_720_173; safecall;
    procedure GhostMethod__Xuspc_724_174; safecall;
    procedure GhostMethod__Xuspc_728_175; safecall;
    procedure GhostMethod__Xuspc_732_176; safecall;
    procedure GhostMethod__Xuspc_736_177; safecall;
    procedure GhostMethod__Xuspc_740_178; safecall;
    procedure GhostMethod__Xuspc_744_179; safecall;
    procedure GhostMethod__Xuspc_748_180; safecall;
    procedure GhostMethod__Xuspc_752_181; safecall;
    procedure GhostMethod__Xuspc_756_182; safecall;
    procedure GhostMethod__Xuspc_760_183; safecall;
    procedure GhostMethod__Xuspc_764_184; safecall;
    procedure GhostMethod__Xuspc_768_185; safecall;
    procedure GhostMethod__Xuspc_772_186; safecall;
    procedure GhostMethod__Xuspc_776_187; safecall;
    procedure GhostMethod__Xuspc_780_188; safecall;
    procedure GhostMethod__Xuspc_784_189; safecall;
    procedure GhostMethod__Xuspc_788_190; safecall;
    procedure GhostMethod__Xuspc_792_191; safecall;
    procedure GhostMethod__Xuspc_796_192; safecall;
    procedure GhostMethod__Xuspc_800_193; safecall;
    procedure GhostMethod__Xuspc_804_194; safecall;
    procedure GhostMethod__Xuspc_808_195; safecall;
    procedure GhostMethod__Xuspc_812_196; safecall;
    procedure GhostMethod__Xuspc_816_197; safecall;
    procedure GhostMethod__Xuspc_820_198; safecall;
    procedure GhostMethod__Xuspc_824_199; safecall;
    procedure GhostMethod__Xuspc_828_200; safecall;
    procedure GhostMethod__Xuspc_832_201; safecall;
    procedure GhostMethod__Xuspc_836_202; safecall;
    procedure GhostMethod__Xuspc_840_203; safecall;
    procedure GhostMethod__Xuspc_844_204; safecall;
    procedure GhostMethod__Xuspc_848_205; safecall;
    procedure GhostMethod__Xuspc_852_206; safecall;
    procedure GhostMethod__Xuspc_856_207; safecall;
    procedure GhostMethod__Xuspc_860_208; safecall;
    procedure GhostMethod__Xuspc_864_209; safecall;
    procedure GhostMethod__Xuspc_868_210; safecall;
    procedure GhostMethod__Xuspc_872_211; safecall;
    procedure GhostMethod__Xuspc_876_212; safecall;
    procedure GhostMethod__Xuspc_880_213; safecall;
    procedure GhostMethod__Xuspc_884_214; safecall;
    procedure GhostMethod__Xuspc_888_215; safecall;
    procedure GhostMethod__Xuspc_892_216; safecall;
    procedure GhostMethod__Xuspc_896_217; safecall;
    procedure GhostMethod__Xuspc_900_218; safecall;
    procedure GhostMethod__Xuspc_904_219; safecall;
    procedure GhostMethod__Xuspc_908_220; safecall;
    procedure GhostMethod__Xuspc_912_221; safecall;
    procedure GhostMethod__Xuspc_916_222; safecall;
    procedure GhostMethod__Xuspc_920_223; safecall;
    procedure GhostMethod__Xuspc_924_224; safecall;
    procedure GhostMethod__Xuspc_928_225; safecall;
    procedure GhostMethod__Xuspc_932_226; safecall;
    procedure GhostMethod__Xuspc_936_227; safecall;
    procedure GhostMethod__Xuspc_940_228; safecall;
    procedure GhostMethod__Xuspc_944_229; safecall;
    procedure GhostMethod__Xuspc_948_230; safecall;
    procedure GhostMethod__Xuspc_952_231; safecall;
    procedure GhostMethod__Xuspc_956_232; safecall;
    procedure GhostMethod__Xuspc_960_233; safecall;
    procedure GhostMethod__Xuspc_964_234; safecall;
    procedure GhostMethod__Xuspc_968_235; safecall;
    procedure GhostMethod__Xuspc_972_236; safecall;
    procedure GhostMethod__Xuspc_976_237; safecall;
    procedure GhostMethod__Xuspc_980_238; safecall;
    procedure GhostMethod__Xuspc_984_239; safecall;
    procedure GhostMethod__Xuspc_988_240; safecall;
    procedure GhostMethod__Xuspc_992_241; safecall;
    procedure GhostMethod__Xuspc_996_242; safecall;
    procedure GhostMethod__Xuspc_1000_243; safecall;
    procedure GhostMethod__Xuspc_1004_244; safecall;
    procedure GhostMethod__Xuspc_1008_245; safecall;
    procedure GhostMethod__Xuspc_1012_246; safecall;
    procedure GhostMethod__Xuspc_1016_247; safecall;
    procedure GhostMethod__Xuspc_1020_248; safecall;
    procedure GhostMethod__Xuspc_1024_249; safecall;
    procedure GhostMethod__Xuspc_1028_250; safecall;
    procedure GhostMethod__Xuspc_1032_251; safecall;
    procedure GhostMethod__Xuspc_1036_252; safecall;
    procedure GhostMethod__Xuspc_1040_253; safecall;
    procedure GhostMethod__Xuspc_1044_254; safecall;
    procedure GhostMethod__Xuspc_1048_255; safecall;
    procedure GhostMethod__Xuspc_1052_256; safecall;
    procedure GhostMethod__Xuspc_1056_257; safecall;
    procedure GhostMethod__Xuspc_1060_258; safecall;
    procedure GhostMethod__Xuspc_1064_259; safecall;
    procedure GhostMethod__Xuspc_1068_260; safecall;
    procedure GhostMethod__Xuspc_1072_261; safecall;
    procedure GhostMethod__Xuspc_1076_262; safecall;
    procedure GhostMethod__Xuspc_1080_263; safecall;
    procedure GhostMethod__Xuspc_1084_264; safecall;
    procedure GhostMethod__Xuspc_1088_265; safecall;
    procedure GhostMethod__Xuspc_1092_266; safecall;
    procedure GhostMethod__Xuspc_1096_267; safecall;
    procedure GhostMethod__Xuspc_1100_268; safecall;
    procedure GhostMethod__Xuspc_1104_269; safecall;
    procedure GhostMethod__Xuspc_1108_270; safecall;
    procedure GhostMethod__Xuspc_1112_271; safecall;
    procedure GhostMethod__Xuspc_1116_272; safecall;
    procedure GhostMethod__Xuspc_1120_273; safecall;
    procedure GhostMethod__Xuspc_1124_274; safecall;
    procedure GhostMethod__Xuspc_1128_275; safecall;
    procedure GhostMethod__Xuspc_1132_276; safecall;
    procedure GhostMethod__Xuspc_1136_277; safecall;
    procedure GhostMethod__Xuspc_1140_278; safecall;
    procedure GhostMethod__Xuspc_1144_279; safecall;
    procedure GhostMethod__Xuspc_1148_280; safecall;
    procedure GhostMethod__Xuspc_1152_281; safecall;
    procedure GhostMethod__Xuspc_1156_282; safecall;
    procedure GhostMethod__Xuspc_1160_283; safecall;
    procedure GhostMethod__Xuspc_1164_284; safecall;
    procedure GhostMethod__Xuspc_1168_285; safecall;
    procedure GhostMethod__Xuspc_1172_286; safecall;
    procedure GhostMethod__Xuspc_1176_287; safecall;
    procedure GhostMethod__Xuspc_1180_288; safecall;
    procedure GhostMethod__Xuspc_1184_289; safecall;
    procedure GhostMethod__Xuspc_1188_290; safecall;
    procedure GhostMethod__Xuspc_1192_291; safecall;
    procedure GhostMethod__Xuspc_1196_292; safecall;
    procedure GhostMethod__Xuspc_1200_293; safecall;
    procedure GhostMethod__Xuspc_1204_294; safecall;
    procedure GhostMethod__Xuspc_1208_295; safecall;
    procedure GhostMethod__Xuspc_1212_296; safecall;
    procedure GhostMethod__Xuspc_1216_297; safecall;
    procedure GhostMethod__Xuspc_1220_298; safecall;
    procedure GhostMethod__Xuspc_1224_299; safecall;
    procedure GhostMethod__Xuspc_1228_300; safecall;
    procedure GhostMethod__Xuspc_1232_301; safecall;
    procedure GhostMethod__Xuspc_1236_302; safecall;
    procedure GhostMethod__Xuspc_1240_303; safecall;
    procedure GhostMethod__Xuspc_1244_304; safecall;
    procedure GhostMethod__Xuspc_1248_305; safecall;
    procedure GhostMethod__Xuspc_1252_306; safecall;
    procedure GhostMethod__Xuspc_1256_307; safecall;
    procedure GhostMethod__Xuspc_1260_308; safecall;
    procedure GhostMethod__Xuspc_1264_309; safecall;
    procedure GhostMethod__Xuspc_1268_310; safecall;
    procedure GhostMethod__Xuspc_1272_311; safecall;
    procedure GhostMethod__Xuspc_1276_312; safecall;
    procedure GhostMethod__Xuspc_1280_313; safecall;
    procedure GhostMethod__Xuspc_1284_314; safecall;
    procedure GhostMethod__Xuspc_1288_315; safecall;
    procedure GhostMethod__Xuspc_1292_316; safecall;
    procedure GhostMethod__Xuspc_1296_317; safecall;
    procedure GhostMethod__Xuspc_1300_318; safecall;
    procedure GhostMethod__Xuspc_1304_319; safecall;
    procedure GhostMethod__Xuspc_1308_320; safecall;
    procedure GhostMethod__Xuspc_1312_321; safecall;
    procedure GhostMethod__Xuspc_1316_322; safecall;
    procedure GhostMethod__Xuspc_1320_323; safecall;
    procedure GhostMethod__Xuspc_1324_324; safecall;
    procedure GhostMethod__Xuspc_1328_325; safecall;
    procedure GhostMethod__Xuspc_1332_326; safecall;
    procedure GhostMethod__Xuspc_1336_327; safecall;
    procedure GhostMethod__Xuspc_1340_328; safecall;
    procedure GhostMethod__Xuspc_1344_329; safecall;
    procedure GhostMethod__Xuspc_1348_330; safecall;
    procedure GhostMethod__Xuspc_1352_331; safecall;
    procedure GhostMethod__Xuspc_1356_332; safecall;
    procedure GhostMethod__Xuspc_1360_333; safecall;
    procedure GhostMethod__Xuspc_1364_334; safecall;
    procedure GhostMethod__Xuspc_1368_335; safecall;
    procedure GhostMethod__Xuspc_1372_336; safecall;
    procedure GhostMethod__Xuspc_1376_337; safecall;
    procedure GhostMethod__Xuspc_1380_338; safecall;
    procedure GhostMethod__Xuspc_1384_339; safecall;
    procedure GhostMethod__Xuspc_1388_340; safecall;
    procedure GhostMethod__Xuspc_1392_341; safecall;
    procedure GhostMethod__Xuspc_1396_342; safecall;
    procedure GhostMethod__Xuspc_1400_343; safecall;
    procedure GhostMethod__Xuspc_1404_344; safecall;
    procedure GhostMethod__Xuspc_1408_345; safecall;
    procedure GhostMethod__Xuspc_1412_346; safecall;
    procedure GhostMethod__Xuspc_1416_347; safecall;
    procedure GhostMethod__Xuspc_1420_348; safecall;
    procedure GhostMethod__Xuspc_1424_349; safecall;
    procedure GhostMethod__Xuspc_1428_350; safecall;
    procedure GhostMethod__Xuspc_1432_351; safecall;
    procedure GhostMethod__Xuspc_1436_352; safecall;
    procedure GhostMethod__Xuspc_1440_353; safecall;
    procedure GhostMethod__Xuspc_1444_354; safecall;
    procedure GhostMethod__Xuspc_1448_355; safecall;
    procedure GhostMethod__Xuspc_1452_356; safecall;
    procedure GhostMethod__Xuspc_1456_357; safecall;
    procedure GhostMethod__Xuspc_1460_358; safecall;
    procedure GhostMethod__Xuspc_1464_359; safecall;
    procedure GhostMethod__Xuspc_1468_360; safecall;
    procedure GhostMethod__Xuspc_1472_361; safecall;
    procedure GhostMethod__Xuspc_1476_362; safecall;
    procedure GhostMethod__Xuspc_1480_363; safecall;
    procedure GhostMethod__Xuspc_1484_364; safecall;
    procedure GhostMethod__Xuspc_1488_365; safecall;
    procedure GhostMethod__Xuspc_1492_366; safecall;
    procedure GhostMethod__Xuspc_1496_367; safecall;
    procedure GhostMethod__Xuspc_1500_368; safecall;
    procedure GhostMethod__Xuspc_1504_369; safecall;
    procedure GhostMethod__Xuspc_1508_370; safecall;
    procedure GhostMethod__Xuspc_1512_371; safecall;
    procedure GhostMethod__Xuspc_1516_372; safecall;
    procedure GhostMethod__Xuspc_1520_373; safecall;
    procedure GhostMethod__Xuspc_1524_374; safecall;
    procedure GhostMethod__Xuspc_1528_375; safecall;
    procedure GhostMethod__Xuspc_1532_376; safecall;
    procedure GhostMethod__Xuspc_1536_377; safecall;
    procedure GhostMethod__Xuspc_1540_378; safecall;
    procedure GhostMethod__Xuspc_1544_379; safecall;
    procedure GhostMethod__Xuspc_1548_380; safecall;
    procedure GhostMethod__Xuspc_1552_381; safecall;
    procedure GhostMethod__Xuspc_1556_382; safecall;
    procedure GhostMethod__Xuspc_1560_383; safecall;
    procedure GhostMethod__Xuspc_1564_384; safecall;
    procedure GhostMethod__Xuspc_1568_385; safecall;
    procedure GhostMethod__Xuspc_1572_386; safecall;
    procedure GhostMethod__Xuspc_1576_387; safecall;
    procedure GhostMethod__Xuspc_1580_388; safecall;
    procedure GhostMethod__Xuspc_1584_389; safecall;
    procedure GhostMethod__Xuspc_1588_390; safecall;
    procedure GhostMethod__Xuspc_1592_391; safecall;
    procedure GhostMethod__Xuspc_1596_392; safecall;
    procedure GhostMethod__Xuspc_1600_393; safecall;
    procedure GhostMethod__Xuspc_1604_394; safecall;
    procedure GhostMethod__Xuspc_1608_395; safecall;
    procedure GhostMethod__Xuspc_1612_396; safecall;
    procedure GhostMethod__Xuspc_1616_397; safecall;
    procedure GhostMethod__Xuspc_1620_398; safecall;
    procedure GhostMethod__Xuspc_1624_399; safecall;
    procedure GhostMethod__Xuspc_1628_400; safecall;
    procedure GhostMethod__Xuspc_1632_401; safecall;
    procedure GhostMethod__Xuspc_1636_402; safecall;
    procedure GhostMethod__Xuspc_1640_403; safecall;
    procedure GhostMethod__Xuspc_1644_404; safecall;
    procedure GhostMethod__Xuspc_1648_405; safecall;
    procedure GhostMethod__Xuspc_1652_406; safecall;
    procedure GhostMethod__Xuspc_1656_407; safecall;
    procedure GhostMethod__Xuspc_1660_408; safecall;
    procedure GhostMethod__Xuspc_1664_409; safecall;
    procedure GhostMethod__Xuspc_1668_410; safecall;
    procedure GhostMethod__Xuspc_1672_411; safecall;
    procedure GhostMethod__Xuspc_1676_412; safecall;
    procedure GhostMethod__Xuspc_1680_413; safecall;
    procedure GhostMethod__Xuspc_1684_414; safecall;
    procedure GhostMethod__Xuspc_1688_415; safecall;
    procedure GhostMethod__Xuspc_1692_416; safecall;
    procedure GhostMethod__Xuspc_1696_417; safecall;
    procedure GhostMethod__Xuspc_1700_418; safecall;
    procedure GhostMethod__Xuspc_1704_419; safecall;
    procedure GhostMethod__Xuspc_1708_420; safecall;
    procedure GhostMethod__Xuspc_1712_421; safecall;
    procedure GhostMethod__Xuspc_1716_422; safecall;
    procedure GhostMethod__Xuspc_1720_423; safecall;
    procedure GhostMethod__Xuspc_1724_424; safecall;
    procedure GhostMethod__Xuspc_1728_425; safecall;
    procedure GhostMethod__Xuspc_1732_426; safecall;
    procedure GhostMethod__Xuspc_1736_427; safecall;
    procedure GhostMethod__Xuspc_1740_428; safecall;
    procedure GhostMethod__Xuspc_1744_429; safecall;
    procedure GhostMethod__Xuspc_1748_430; safecall;
    procedure GhostMethod__Xuspc_1752_431; safecall;
    procedure GhostMethod__Xuspc_1756_432; safecall;
    procedure GhostMethod__Xuspc_1760_433; safecall;
    procedure GhostMethod__Xuspc_1764_434; safecall;
    procedure GhostMethod__Xuspc_1768_435; safecall;
    procedure GhostMethod__Xuspc_1772_436; safecall;
    procedure GhostMethod__Xuspc_1776_437; safecall;
    procedure GhostMethod__Xuspc_1780_438; safecall;
    procedure GhostMethod__Xuspc_1784_439; safecall;
    procedure GhostMethod__Xuspc_1788_440; safecall;
    procedure GhostMethod__Xuspc_1792_441; safecall;
    procedure GhostMethod__Xuspc_1796_442; safecall;
    procedure GhostMethod__Xuspc_1800_443; safecall;
    procedure GhostMethod__Xuspc_1804_444; safecall;
    procedure GhostMethod__Xuspc_1808_445; safecall;
    procedure GhostMethod__Xuspc_1812_446; safecall;
    procedure GhostMethod__Xuspc_1816_447; safecall;
    procedure GhostMethod__Xuspc_1820_448; safecall;
    procedure GhostMethod__Xuspc_1824_449; safecall;
    procedure GhostMethod__Xuspc_1828_450; safecall;
    procedure GhostMethod__Xuspc_1832_451; safecall;
    procedure GhostMethod__Xuspc_1836_452; safecall;
    procedure GhostMethod__Xuspc_1840_453; safecall;
    procedure GhostMethod__Xuspc_1844_454; safecall;
    procedure GhostMethod__Xuspc_1848_455; safecall;
    procedure GhostMethod__Xuspc_1852_456; safecall;
    procedure GhostMethod__Xuspc_1856_457; safecall;
    procedure GhostMethod__Xuspc_1860_458; safecall;
    procedure GhostMethod__Xuspc_1864_459; safecall;
    procedure GhostMethod__Xuspc_1868_460; safecall;
    procedure GhostMethod__Xuspc_1872_461; safecall;
    procedure GhostMethod__Xuspc_1876_462; safecall;
    procedure GhostMethod__Xuspc_1880_463; safecall;
    procedure GhostMethod__Xuspc_1884_464; safecall;
    procedure GhostMethod__Xuspc_1888_465; safecall;
    procedure GhostMethod__Xuspc_1892_466; safecall;
    procedure GhostMethod__Xuspc_1896_467; safecall;
    procedure GhostMethod__Xuspc_1900_468; safecall;
    procedure GhostMethod__Xuspc_1904_469; safecall;
    procedure GhostMethod__Xuspc_1908_470; safecall;
    procedure GhostMethod__Xuspc_1912_471; safecall;
    procedure GhostMethod__Xuspc_1916_472; safecall;
    procedure GhostMethod__Xuspc_1920_473; safecall;
    procedure GhostMethod__Xuspc_1924_474; safecall;
    procedure GhostMethod__Xuspc_1928_475; safecall;
    procedure GhostMethod__Xuspc_1932_476; safecall;
    procedure GhostMethod__Xuspc_1936_477; safecall;
    procedure GhostMethod__Xuspc_1940_478; safecall;
    procedure GhostMethod__Xuspc_1944_479; safecall;
    procedure GhostMethod__Xuspc_1948_480; safecall;
    procedure GhostMethod__Xuspc_1952_481; safecall;
    function  Get_TimeOutServer: Integer; safecall;
    procedure Set_TimeOutServer(TimeOutServer: Integer); safecall;
    function  Get_AscanNumber: OleVariant; safecall;
    procedure Set_AscanNumber(Param1: OleVariant); safecall;
    function  Get_Rows: OleVariant; safecall;
    procedure Set_Rows(Param1: OleVariant); safecall;
    function  Get_Cols: OleVariant; safecall;
    procedure Set_Cols(Param1: OleVariant); safecall;
    function  Get_BorderStyle: XuspcBorderStyle; safecall;
    procedure Set_BorderStyle(Param1: XuspcBorderStyle); safecall;
    function  Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(Param1: OLE_COLOR); safecall;
    function  Get_BackStyle: XuspcBackStyle; safecall;
    procedure Set_BackStyle(Param1: XuspcBackStyle); safecall;
    function  Get_AscanFrameVisible: WordBool; safecall;
    procedure Set_AscanFrameVisible(Param1: WordBool); safecall;
    function  Get_AscanFrameStyle: XuspcAscanStyle; safecall;
    procedure Set_AscanFrameStyle(Param1: XuspcAscanStyle); safecall;
    function  Get_AscanFrameColor: OLE_COLOR; safecall;
    procedure Set_AscanFrameColor(Param1: OLE_COLOR); safecall;
    function  Get_AscanAutoSize: WordBool; safecall;
    procedure Set_AscanAutoSize(Param1: WordBool); safecall;
    function  Get_AscanBackColor: OLE_COLOR; safecall;
    procedure Set_AscanBackColor(Param1: OLE_COLOR); safecall;
    function  Get_AscanGridVisible: WordBool; safecall;
    procedure Set_AscanGridVisible(Param1: WordBool); safecall;
    function  Get_AscanGridColor: OLE_COLOR; safecall;
    procedure Set_AscanGridColor(Param1: OLE_COLOR); safecall;
    function  Get_AscanTicksLabelsColor: OLE_COLOR; safecall;
    procedure Set_AscanTicksLabelsColor(Param1: OLE_COLOR); safecall;
    function  Get_AscanCaptionVisible: WordBool; safecall;
    procedure Set_AscanCaptionVisible(Param1: WordBool); safecall;
    function  Get_AscanCaptionColor: OLE_COLOR; safecall;
    procedure Set_AscanCaptionColor(Param1: OLE_COLOR); safecall;
    function  Get_AscanColor: OLE_COLOR; safecall;
    procedure Set_AscanColor(Param1: OLE_COLOR); safecall;
    function  Get_GateIFColor: OLE_COLOR; safecall;
    procedure Set_GateIFColor(Param1: OLE_COLOR); safecall;
    function  Get_Gate1Color: OLE_COLOR; safecall;
    procedure Set_Gate1Color(Param1: OLE_COLOR); safecall;
    function  Get_Gate2Color: OLE_COLOR; safecall;
    procedure Set_Gate2Color(Param1: OLE_COLOR); safecall;
    function  Get_DACVisible: WordBool; safecall;
    procedure Set_DACVisible(Param1: WordBool); safecall;
    function  Get_RejectVisible: WordBool; safecall;
    procedure Set_RejectVisible(Param1: WordBool); safecall;
    function  Get_unit_: XuspcUnit; safecall;
    procedure Set_unit_(Param1: XuspcUnit); safecall;
    function  Get_DACCursorsVisible: WordBool; safecall;
    procedure Set_DACCursorsVisible(Param1: WordBool); safecall;
    function  AscanPositionSize(iAscan: Smallint; Top: Smallint; Left: Smallint; Width: Smallint; 
                                Height: Smallint): Smallint; safecall;
    function  AscanSource(iAscan: Smallint; Board: Smallint; Channel: Smallint; 
                          const Server: WideString): Smallint; safecall;
    function  AscanCaption(iAscan: Smallint; const Caption: WideString): Smallint; safecall;
    procedure GetDACPoint(var Position: Double; var Amplitude: Double); safecall;
    procedure GetDACLevel(var Level: Double); safecall;
    function  Get_AutoRedraw: WordBool; safecall;
    procedure Set_AutoRedraw(Param1: WordBool); safecall;
    procedure USPC_Display; safecall;
    function  USPC_Open(const Server: WideString; OpenType: Integer): Integer; safecall;
    function  USPC_Close(const Server: WideString): Integer; safecall;
    function  USPC_Load(const Server: WideString; Board: Integer; Channel: Integer; 
                        const file_: WideString): Integer; safecall;
    function  USPC_Save(const Server: WideString; Board: Integer; Channel: Integer; 
                        const file_: WideString): Integer; safecall;
    function  USPC_Read(const Server: WideString; Board: Integer; Channel: Integer; unit_: Integer; 
                        const strParam: WideString; var dblValue: Double; var dblT1: OleVariant; 
                        var dblT2: OleVariant; var strValue: OleVariant): Integer; safecall;
    function  USPC_Write(const Server: WideString; Board: Integer; Channel: Integer; 
                         unit_: Integer; const strParam: WideString; var dblValue: Double; 
                         var dblT1: OleVariant; var dblT2: OleVariant; var strValue: OleVariant; 
                         var clip: Integer): Integer; safecall;
    function  Get_VersionMajor: Smallint; safecall;
    function  Get_VersionMinor: Smallint; safecall;
    property TimeOutServer: Integer read Get_TimeOutServer write Set_TimeOutServer;
    property AscanNumber: OleVariant read Get_AscanNumber write Set_AscanNumber;
    property Rows: OleVariant read Get_Rows write Set_Rows;
    property Cols: OleVariant read Get_Cols write Set_Cols;
    property BorderStyle: XuspcBorderStyle read Get_BorderStyle write Set_BorderStyle;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BackStyle: XuspcBackStyle read Get_BackStyle write Set_BackStyle;
    property AscanFrameVisible: WordBool read Get_AscanFrameVisible write Set_AscanFrameVisible;
    property AscanFrameStyle: XuspcAscanStyle read Get_AscanFrameStyle write Set_AscanFrameStyle;
    property AscanFrameColor: OLE_COLOR read Get_AscanFrameColor write Set_AscanFrameColor;
    property AscanAutoSize: WordBool read Get_AscanAutoSize write Set_AscanAutoSize;
    property AscanBackColor: OLE_COLOR read Get_AscanBackColor write Set_AscanBackColor;
    property AscanGridVisible: WordBool read Get_AscanGridVisible write Set_AscanGridVisible;
    property AscanGridColor: OLE_COLOR read Get_AscanGridColor write Set_AscanGridColor;
    property AscanTicksLabelsColor: OLE_COLOR read Get_AscanTicksLabelsColor write Set_AscanTicksLabelsColor;
    property AscanCaptionVisible: WordBool read Get_AscanCaptionVisible write Set_AscanCaptionVisible;
    property AscanCaptionColor: OLE_COLOR read Get_AscanCaptionColor write Set_AscanCaptionColor;
    property AscanColor: OLE_COLOR read Get_AscanColor write Set_AscanColor;
    property GateIFColor: OLE_COLOR read Get_GateIFColor write Set_GateIFColor;
    property Gate1Color: OLE_COLOR read Get_Gate1Color write Set_Gate1Color;
    property Gate2Color: OLE_COLOR read Get_Gate2Color write Set_Gate2Color;
    property DACVisible: WordBool read Get_DACVisible write Set_DACVisible;
    property RejectVisible: WordBool read Get_RejectVisible write Set_RejectVisible;
    property unit_: XuspcUnit read Get_unit_ write Set_unit_;
    property DACCursorsVisible: WordBool read Get_DACCursorsVisible write Set_DACCursorsVisible;
    property AutoRedraw: WordBool read Get_AutoRedraw write Set_AutoRedraw;
    property VersionMajor: Smallint read Get_VersionMajor;
    property VersionMinor: Smallint read Get_VersionMinor;
  end;

// *********************************************************************//
// DispIntf :  _XuspcDisp
// Flags :     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID :      {E5A801ED-923A-4463-B0CB-7F226C26494A}
// *********************************************************************//
  _XuspcDisp = dispinterface
    ['{E5A801ED-923A-4463-B0CB-7F226C26494A}']
    procedure GhostMethod__Xuspc_28_0; dispid 1610743808;
    procedure GhostMethod__Xuspc_32_1; dispid 1610743809;
    procedure GhostMethod__Xuspc_36_2; dispid 1610743810;
    procedure GhostMethod__Xuspc_40_3; dispid 1610743811;
    procedure GhostMethod__Xuspc_44_4; dispid 1610743812;
    procedure GhostMethod__Xuspc_48_5; dispid 1610743813;
    procedure GhostMethod__Xuspc_52_6; dispid 1610743814;
    procedure GhostMethod__Xuspc_56_7; dispid 1610743815;
    procedure GhostMethod__Xuspc_60_8; dispid 1610743816;
    procedure GhostMethod__Xuspc_64_9; dispid 1610743817;
    procedure GhostMethod__Xuspc_68_10; dispid 1610743818;
    procedure GhostMethod__Xuspc_72_11; dispid 1610743819;
    procedure GhostMethod__Xuspc_76_12; dispid 1610743820;
    procedure GhostMethod__Xuspc_80_13; dispid 1610743821;
    procedure GhostMethod__Xuspc_84_14; dispid 1610743822;
    procedure GhostMethod__Xuspc_88_15; dispid 1610743823;
    procedure GhostMethod__Xuspc_92_16; dispid 1610743824;
    procedure GhostMethod__Xuspc_96_17; dispid 1610743825;
    procedure GhostMethod__Xuspc_100_18; dispid 1610743826;
    procedure GhostMethod__Xuspc_104_19; dispid 1610743827;
    procedure GhostMethod__Xuspc_108_20; dispid 1610743828;
    procedure GhostMethod__Xuspc_112_21; dispid 1610743829;
    procedure GhostMethod__Xuspc_116_22; dispid 1610743830;
    procedure GhostMethod__Xuspc_120_23; dispid 1610743831;
    procedure GhostMethod__Xuspc_124_24; dispid 1610743832;
    procedure GhostMethod__Xuspc_128_25; dispid 1610743833;
    procedure GhostMethod__Xuspc_132_26; dispid 1610743834;
    procedure GhostMethod__Xuspc_136_27; dispid 1610743835;
    procedure GhostMethod__Xuspc_140_28; dispid 1610743836;
    procedure GhostMethod__Xuspc_144_29; dispid 1610743837;
    procedure GhostMethod__Xuspc_148_30; dispid 1610743838;
    procedure GhostMethod__Xuspc_152_31; dispid 1610743839;
    procedure GhostMethod__Xuspc_156_32; dispid 1610743840;
    procedure GhostMethod__Xuspc_160_33; dispid 1610743841;
    procedure GhostMethod__Xuspc_164_34; dispid 1610743842;
    procedure GhostMethod__Xuspc_168_35; dispid 1610743843;
    procedure GhostMethod__Xuspc_172_36; dispid 1610743844;
    procedure GhostMethod__Xuspc_176_37; dispid 1610743845;
    procedure GhostMethod__Xuspc_180_38; dispid 1610743846;
    procedure GhostMethod__Xuspc_184_39; dispid 1610743847;
    procedure GhostMethod__Xuspc_188_40; dispid 1610743848;
    procedure GhostMethod__Xuspc_192_41; dispid 1610743849;
    procedure GhostMethod__Xuspc_196_42; dispid 1610743850;
    procedure GhostMethod__Xuspc_200_43; dispid 1610743851;
    procedure GhostMethod__Xuspc_204_44; dispid 1610743852;
    procedure GhostMethod__Xuspc_208_45; dispid 1610743853;
    procedure GhostMethod__Xuspc_212_46; dispid 1610743854;
    procedure GhostMethod__Xuspc_216_47; dispid 1610743855;
    procedure GhostMethod__Xuspc_220_48; dispid 1610743856;
    procedure GhostMethod__Xuspc_224_49; dispid 1610743857;
    procedure GhostMethod__Xuspc_228_50; dispid 1610743858;
    procedure GhostMethod__Xuspc_232_51; dispid 1610743859;
    procedure GhostMethod__Xuspc_236_52; dispid 1610743860;
    procedure GhostMethod__Xuspc_240_53; dispid 1610743861;
    procedure GhostMethod__Xuspc_244_54; dispid 1610743862;
    procedure GhostMethod__Xuspc_248_55; dispid 1610743863;
    procedure GhostMethod__Xuspc_252_56; dispid 1610743864;
    procedure GhostMethod__Xuspc_256_57; dispid 1610743865;
    procedure GhostMethod__Xuspc_260_58; dispid 1610743866;
    procedure GhostMethod__Xuspc_264_59; dispid 1610743867;
    procedure GhostMethod__Xuspc_268_60; dispid 1610743868;
    procedure GhostMethod__Xuspc_272_61; dispid 1610743869;
    procedure GhostMethod__Xuspc_276_62; dispid 1610743870;
    procedure GhostMethod__Xuspc_280_63; dispid 1610743871;
    procedure GhostMethod__Xuspc_284_64; dispid 1610743872;
    procedure GhostMethod__Xuspc_288_65; dispid 1610743873;
    procedure GhostMethod__Xuspc_292_66; dispid 1610743874;
    procedure GhostMethod__Xuspc_296_67; dispid 1610743875;
    procedure GhostMethod__Xuspc_300_68; dispid 1610743876;
    procedure GhostMethod__Xuspc_304_69; dispid 1610743877;
    procedure GhostMethod__Xuspc_308_70; dispid 1610743878;
    procedure GhostMethod__Xuspc_312_71; dispid 1610743879;
    procedure GhostMethod__Xuspc_316_72; dispid 1610743880;
    procedure GhostMethod__Xuspc_320_73; dispid 1610743881;
    procedure GhostMethod__Xuspc_324_74; dispid 1610743882;
    procedure GhostMethod__Xuspc_328_75; dispid 1610743883;
    procedure GhostMethod__Xuspc_332_76; dispid 1610743884;
    procedure GhostMethod__Xuspc_336_77; dispid 1610743885;
    procedure GhostMethod__Xuspc_340_78; dispid 1610743886;
    procedure GhostMethod__Xuspc_344_79; dispid 1610743887;
    procedure GhostMethod__Xuspc_348_80; dispid 1610743888;
    procedure GhostMethod__Xuspc_352_81; dispid 1610743889;
    procedure GhostMethod__Xuspc_356_82; dispid 1610743890;
    procedure GhostMethod__Xuspc_360_83; dispid 1610743891;
    procedure GhostMethod__Xuspc_364_84; dispid 1610743892;
    procedure GhostMethod__Xuspc_368_85; dispid 1610743893;
    procedure GhostMethod__Xuspc_372_86; dispid 1610743894;
    procedure GhostMethod__Xuspc_376_87; dispid 1610743895;
    procedure GhostMethod__Xuspc_380_88; dispid 1610743896;
    procedure GhostMethod__Xuspc_384_89; dispid 1610743897;
    procedure GhostMethod__Xuspc_388_90; dispid 1610743898;
    procedure GhostMethod__Xuspc_392_91; dispid 1610743899;
    procedure GhostMethod__Xuspc_396_92; dispid 1610743900;
    procedure GhostMethod__Xuspc_400_93; dispid 1610743901;
    procedure GhostMethod__Xuspc_404_94; dispid 1610743902;
    procedure GhostMethod__Xuspc_408_95; dispid 1610743903;
    procedure GhostMethod__Xuspc_412_96; dispid 1610743904;
    procedure GhostMethod__Xuspc_416_97; dispid 1610743905;
    procedure GhostMethod__Xuspc_420_98; dispid 1610743906;
    procedure GhostMethod__Xuspc_424_99; dispid 1610743907;
    procedure GhostMethod__Xuspc_428_100; dispid 1610743908;
    procedure GhostMethod__Xuspc_432_101; dispid 1610743909;
    procedure GhostMethod__Xuspc_436_102; dispid 1610743910;
    procedure GhostMethod__Xuspc_440_103; dispid 1610743911;
    procedure GhostMethod__Xuspc_444_104; dispid 1610743912;
    procedure GhostMethod__Xuspc_448_105; dispid 1610743913;
    procedure GhostMethod__Xuspc_452_106; dispid 1610743914;
    procedure GhostMethod__Xuspc_456_107; dispid 1610743915;
    procedure GhostMethod__Xuspc_460_108; dispid 1610743916;
    procedure GhostMethod__Xuspc_464_109; dispid 1610743917;
    procedure GhostMethod__Xuspc_468_110; dispid 1610743918;
    procedure GhostMethod__Xuspc_472_111; dispid 1610743919;
    procedure GhostMethod__Xuspc_476_112; dispid 1610743920;
    procedure GhostMethod__Xuspc_480_113; dispid 1610743921;
    procedure GhostMethod__Xuspc_484_114; dispid 1610743922;
    procedure GhostMethod__Xuspc_488_115; dispid 1610743923;
    procedure GhostMethod__Xuspc_492_116; dispid 1610743924;
    procedure GhostMethod__Xuspc_496_117; dispid 1610743925;
    procedure GhostMethod__Xuspc_500_118; dispid 1610743926;
    procedure GhostMethod__Xuspc_504_119; dispid 1610743927;
    procedure GhostMethod__Xuspc_508_120; dispid 1610743928;
    procedure GhostMethod__Xuspc_512_121; dispid 1610743929;
    procedure GhostMethod__Xuspc_516_122; dispid 1610743930;
    procedure GhostMethod__Xuspc_520_123; dispid 1610743931;
    procedure GhostMethod__Xuspc_524_124; dispid 1610743932;
    procedure GhostMethod__Xuspc_528_125; dispid 1610743933;
    procedure GhostMethod__Xuspc_532_126; dispid 1610743934;
    procedure GhostMethod__Xuspc_536_127; dispid 1610743935;
    procedure GhostMethod__Xuspc_540_128; dispid 1610743936;
    procedure GhostMethod__Xuspc_544_129; dispid 1610743937;
    procedure GhostMethod__Xuspc_548_130; dispid 1610743938;
    procedure GhostMethod__Xuspc_552_131; dispid 1610743939;
    procedure GhostMethod__Xuspc_556_132; dispid 1610743940;
    procedure GhostMethod__Xuspc_560_133; dispid 1610743941;
    procedure GhostMethod__Xuspc_564_134; dispid 1610743942;
    procedure GhostMethod__Xuspc_568_135; dispid 1610743943;
    procedure GhostMethod__Xuspc_572_136; dispid 1610743944;
    procedure GhostMethod__Xuspc_576_137; dispid 1610743945;
    procedure GhostMethod__Xuspc_580_138; dispid 1610743946;
    procedure GhostMethod__Xuspc_584_139; dispid 1610743947;
    procedure GhostMethod__Xuspc_588_140; dispid 1610743948;
    procedure GhostMethod__Xuspc_592_141; dispid 1610743949;
    procedure GhostMethod__Xuspc_596_142; dispid 1610743950;
    procedure GhostMethod__Xuspc_600_143; dispid 1610743951;
    procedure GhostMethod__Xuspc_604_144; dispid 1610743952;
    procedure GhostMethod__Xuspc_608_145; dispid 1610743953;
    procedure GhostMethod__Xuspc_612_146; dispid 1610743954;
    procedure GhostMethod__Xuspc_616_147; dispid 1610743955;
    procedure GhostMethod__Xuspc_620_148; dispid 1610743956;
    procedure GhostMethod__Xuspc_624_149; dispid 1610743957;
    procedure GhostMethod__Xuspc_628_150; dispid 1610743958;
    procedure GhostMethod__Xuspc_632_151; dispid 1610743959;
    procedure GhostMethod__Xuspc_636_152; dispid 1610743960;
    procedure GhostMethod__Xuspc_640_153; dispid 1610743961;
    procedure GhostMethod__Xuspc_644_154; dispid 1610743962;
    procedure GhostMethod__Xuspc_648_155; dispid 1610743963;
    procedure GhostMethod__Xuspc_652_156; dispid 1610743964;
    procedure GhostMethod__Xuspc_656_157; dispid 1610743965;
    procedure GhostMethod__Xuspc_660_158; dispid 1610743966;
    procedure GhostMethod__Xuspc_664_159; dispid 1610743967;
    procedure GhostMethod__Xuspc_668_160; dispid 1610743968;
    procedure GhostMethod__Xuspc_672_161; dispid 1610743969;
    procedure GhostMethod__Xuspc_676_162; dispid 1610743970;
    procedure GhostMethod__Xuspc_680_163; dispid 1610743971;
    procedure GhostMethod__Xuspc_684_164; dispid 1610743972;
    procedure GhostMethod__Xuspc_688_165; dispid 1610743973;
    procedure GhostMethod__Xuspc_692_166; dispid 1610743974;
    procedure GhostMethod__Xuspc_696_167; dispid 1610743975;
    procedure GhostMethod__Xuspc_700_168; dispid 1610743976;
    procedure GhostMethod__Xuspc_704_169; dispid 1610743977;
    procedure GhostMethod__Xuspc_708_170; dispid 1610743978;
    procedure GhostMethod__Xuspc_712_171; dispid 1610743979;
    procedure GhostMethod__Xuspc_716_172; dispid 1610743980;
    procedure GhostMethod__Xuspc_720_173; dispid 1610743981;
    procedure GhostMethod__Xuspc_724_174; dispid 1610743982;
    procedure GhostMethod__Xuspc_728_175; dispid 1610743983;
    procedure GhostMethod__Xuspc_732_176; dispid 1610743984;
    procedure GhostMethod__Xuspc_736_177; dispid 1610743985;
    procedure GhostMethod__Xuspc_740_178; dispid 1610743986;
    procedure GhostMethod__Xuspc_744_179; dispid 1610743987;
    procedure GhostMethod__Xuspc_748_180; dispid 1610743988;
    procedure GhostMethod__Xuspc_752_181; dispid 1610743989;
    procedure GhostMethod__Xuspc_756_182; dispid 1610743990;
    procedure GhostMethod__Xuspc_760_183; dispid 1610743991;
    procedure GhostMethod__Xuspc_764_184; dispid 1610743992;
    procedure GhostMethod__Xuspc_768_185; dispid 1610743993;
    procedure GhostMethod__Xuspc_772_186; dispid 1610743994;
    procedure GhostMethod__Xuspc_776_187; dispid 1610743995;
    procedure GhostMethod__Xuspc_780_188; dispid 1610743996;
    procedure GhostMethod__Xuspc_784_189; dispid 1610743997;
    procedure GhostMethod__Xuspc_788_190; dispid 1610743998;
    procedure GhostMethod__Xuspc_792_191; dispid 1610743999;
    procedure GhostMethod__Xuspc_796_192; dispid 1610744000;
    procedure GhostMethod__Xuspc_800_193; dispid 1610744001;
    procedure GhostMethod__Xuspc_804_194; dispid 1610744002;
    procedure GhostMethod__Xuspc_808_195; dispid 1610744003;
    procedure GhostMethod__Xuspc_812_196; dispid 1610744004;
    procedure GhostMethod__Xuspc_816_197; dispid 1610744005;
    procedure GhostMethod__Xuspc_820_198; dispid 1610744006;
    procedure GhostMethod__Xuspc_824_199; dispid 1610744007;
    procedure GhostMethod__Xuspc_828_200; dispid 1610744008;
    procedure GhostMethod__Xuspc_832_201; dispid 1610744009;
    procedure GhostMethod__Xuspc_836_202; dispid 1610744010;
    procedure GhostMethod__Xuspc_840_203; dispid 1610744011;
    procedure GhostMethod__Xuspc_844_204; dispid 1610744012;
    procedure GhostMethod__Xuspc_848_205; dispid 1610744013;
    procedure GhostMethod__Xuspc_852_206; dispid 1610744014;
    procedure GhostMethod__Xuspc_856_207; dispid 1610744015;
    procedure GhostMethod__Xuspc_860_208; dispid 1610744016;
    procedure GhostMethod__Xuspc_864_209; dispid 1610744017;
    procedure GhostMethod__Xuspc_868_210; dispid 1610744018;
    procedure GhostMethod__Xuspc_872_211; dispid 1610744019;
    procedure GhostMethod__Xuspc_876_212; dispid 1610744020;
    procedure GhostMethod__Xuspc_880_213; dispid 1610744021;
    procedure GhostMethod__Xuspc_884_214; dispid 1610744022;
    procedure GhostMethod__Xuspc_888_215; dispid 1610744023;
    procedure GhostMethod__Xuspc_892_216; dispid 1610744024;
    procedure GhostMethod__Xuspc_896_217; dispid 1610744025;
    procedure GhostMethod__Xuspc_900_218; dispid 1610744026;
    procedure GhostMethod__Xuspc_904_219; dispid 1610744027;
    procedure GhostMethod__Xuspc_908_220; dispid 1610744028;
    procedure GhostMethod__Xuspc_912_221; dispid 1610744029;
    procedure GhostMethod__Xuspc_916_222; dispid 1610744030;
    procedure GhostMethod__Xuspc_920_223; dispid 1610744031;
    procedure GhostMethod__Xuspc_924_224; dispid 1610744032;
    procedure GhostMethod__Xuspc_928_225; dispid 1610744033;
    procedure GhostMethod__Xuspc_932_226; dispid 1610744034;
    procedure GhostMethod__Xuspc_936_227; dispid 1610744035;
    procedure GhostMethod__Xuspc_940_228; dispid 1610744036;
    procedure GhostMethod__Xuspc_944_229; dispid 1610744037;
    procedure GhostMethod__Xuspc_948_230; dispid 1610744038;
    procedure GhostMethod__Xuspc_952_231; dispid 1610744039;
    procedure GhostMethod__Xuspc_956_232; dispid 1610744040;
    procedure GhostMethod__Xuspc_960_233; dispid 1610744041;
    procedure GhostMethod__Xuspc_964_234; dispid 1610744042;
    procedure GhostMethod__Xuspc_968_235; dispid 1610744043;
    procedure GhostMethod__Xuspc_972_236; dispid 1610744044;
    procedure GhostMethod__Xuspc_976_237; dispid 1610744045;
    procedure GhostMethod__Xuspc_980_238; dispid 1610744046;
    procedure GhostMethod__Xuspc_984_239; dispid 1610744047;
    procedure GhostMethod__Xuspc_988_240; dispid 1610744048;
    procedure GhostMethod__Xuspc_992_241; dispid 1610744049;
    procedure GhostMethod__Xuspc_996_242; dispid 1610744050;
    procedure GhostMethod__Xuspc_1000_243; dispid 1610744051;
    procedure GhostMethod__Xuspc_1004_244; dispid 1610744052;
    procedure GhostMethod__Xuspc_1008_245; dispid 1610744053;
    procedure GhostMethod__Xuspc_1012_246; dispid 1610744054;
    procedure GhostMethod__Xuspc_1016_247; dispid 1610744055;
    procedure GhostMethod__Xuspc_1020_248; dispid 1610744056;
    procedure GhostMethod__Xuspc_1024_249; dispid 1610744057;
    procedure GhostMethod__Xuspc_1028_250; dispid 1610744058;
    procedure GhostMethod__Xuspc_1032_251; dispid 1610744059;
    procedure GhostMethod__Xuspc_1036_252; dispid 1610744060;
    procedure GhostMethod__Xuspc_1040_253; dispid 1610744061;
    procedure GhostMethod__Xuspc_1044_254; dispid 1610744062;
    procedure GhostMethod__Xuspc_1048_255; dispid 1610744063;
    procedure GhostMethod__Xuspc_1052_256; dispid 1610744064;
    procedure GhostMethod__Xuspc_1056_257; dispid 1610744065;
    procedure GhostMethod__Xuspc_1060_258; dispid 1610744066;
    procedure GhostMethod__Xuspc_1064_259; dispid 1610744067;
    procedure GhostMethod__Xuspc_1068_260; dispid 1610744068;
    procedure GhostMethod__Xuspc_1072_261; dispid 1610744069;
    procedure GhostMethod__Xuspc_1076_262; dispid 1610744070;
    procedure GhostMethod__Xuspc_1080_263; dispid 1610744071;
    procedure GhostMethod__Xuspc_1084_264; dispid 1610744072;
    procedure GhostMethod__Xuspc_1088_265; dispid 1610744073;
    procedure GhostMethod__Xuspc_1092_266; dispid 1610744074;
    procedure GhostMethod__Xuspc_1096_267; dispid 1610744075;
    procedure GhostMethod__Xuspc_1100_268; dispid 1610744076;
    procedure GhostMethod__Xuspc_1104_269; dispid 1610744077;
    procedure GhostMethod__Xuspc_1108_270; dispid 1610744078;
    procedure GhostMethod__Xuspc_1112_271; dispid 1610744079;
    procedure GhostMethod__Xuspc_1116_272; dispid 1610744080;
    procedure GhostMethod__Xuspc_1120_273; dispid 1610744081;
    procedure GhostMethod__Xuspc_1124_274; dispid 1610744082;
    procedure GhostMethod__Xuspc_1128_275; dispid 1610744083;
    procedure GhostMethod__Xuspc_1132_276; dispid 1610744084;
    procedure GhostMethod__Xuspc_1136_277; dispid 1610744085;
    procedure GhostMethod__Xuspc_1140_278; dispid 1610744086;
    procedure GhostMethod__Xuspc_1144_279; dispid 1610744087;
    procedure GhostMethod__Xuspc_1148_280; dispid 1610744088;
    procedure GhostMethod__Xuspc_1152_281; dispid 1610744089;
    procedure GhostMethod__Xuspc_1156_282; dispid 1610744090;
    procedure GhostMethod__Xuspc_1160_283; dispid 1610744091;
    procedure GhostMethod__Xuspc_1164_284; dispid 1610744092;
    procedure GhostMethod__Xuspc_1168_285; dispid 1610744093;
    procedure GhostMethod__Xuspc_1172_286; dispid 1610744094;
    procedure GhostMethod__Xuspc_1176_287; dispid 1610744095;
    procedure GhostMethod__Xuspc_1180_288; dispid 1610744096;
    procedure GhostMethod__Xuspc_1184_289; dispid 1610744097;
    procedure GhostMethod__Xuspc_1188_290; dispid 1610744098;
    procedure GhostMethod__Xuspc_1192_291; dispid 1610744099;
    procedure GhostMethod__Xuspc_1196_292; dispid 1610744100;
    procedure GhostMethod__Xuspc_1200_293; dispid 1610744101;
    procedure GhostMethod__Xuspc_1204_294; dispid 1610744102;
    procedure GhostMethod__Xuspc_1208_295; dispid 1610744103;
    procedure GhostMethod__Xuspc_1212_296; dispid 1610744104;
    procedure GhostMethod__Xuspc_1216_297; dispid 1610744105;
    procedure GhostMethod__Xuspc_1220_298; dispid 1610744106;
    procedure GhostMethod__Xuspc_1224_299; dispid 1610744107;
    procedure GhostMethod__Xuspc_1228_300; dispid 1610744108;
    procedure GhostMethod__Xuspc_1232_301; dispid 1610744109;
    procedure GhostMethod__Xuspc_1236_302; dispid 1610744110;
    procedure GhostMethod__Xuspc_1240_303; dispid 1610744111;
    procedure GhostMethod__Xuspc_1244_304; dispid 1610744112;
    procedure GhostMethod__Xuspc_1248_305; dispid 1610744113;
    procedure GhostMethod__Xuspc_1252_306; dispid 1610744114;
    procedure GhostMethod__Xuspc_1256_307; dispid 1610744115;
    procedure GhostMethod__Xuspc_1260_308; dispid 1610744116;
    procedure GhostMethod__Xuspc_1264_309; dispid 1610744117;
    procedure GhostMethod__Xuspc_1268_310; dispid 1610744118;
    procedure GhostMethod__Xuspc_1272_311; dispid 1610744119;
    procedure GhostMethod__Xuspc_1276_312; dispid 1610744120;
    procedure GhostMethod__Xuspc_1280_313; dispid 1610744121;
    procedure GhostMethod__Xuspc_1284_314; dispid 1610744122;
    procedure GhostMethod__Xuspc_1288_315; dispid 1610744123;
    procedure GhostMethod__Xuspc_1292_316; dispid 1610744124;
    procedure GhostMethod__Xuspc_1296_317; dispid 1610744125;
    procedure GhostMethod__Xuspc_1300_318; dispid 1610744126;
    procedure GhostMethod__Xuspc_1304_319; dispid 1610744127;
    procedure GhostMethod__Xuspc_1308_320; dispid 1610744128;
    procedure GhostMethod__Xuspc_1312_321; dispid 1610744129;
    procedure GhostMethod__Xuspc_1316_322; dispid 1610744130;
    procedure GhostMethod__Xuspc_1320_323; dispid 1610744131;
    procedure GhostMethod__Xuspc_1324_324; dispid 1610744132;
    procedure GhostMethod__Xuspc_1328_325; dispid 1610744133;
    procedure GhostMethod__Xuspc_1332_326; dispid 1610744134;
    procedure GhostMethod__Xuspc_1336_327; dispid 1610744135;
    procedure GhostMethod__Xuspc_1340_328; dispid 1610744136;
    procedure GhostMethod__Xuspc_1344_329; dispid 1610744137;
    procedure GhostMethod__Xuspc_1348_330; dispid 1610744138;
    procedure GhostMethod__Xuspc_1352_331; dispid 1610744139;
    procedure GhostMethod__Xuspc_1356_332; dispid 1610744140;
    procedure GhostMethod__Xuspc_1360_333; dispid 1610744141;
    procedure GhostMethod__Xuspc_1364_334; dispid 1610744142;
    procedure GhostMethod__Xuspc_1368_335; dispid 1610744143;
    procedure GhostMethod__Xuspc_1372_336; dispid 1610744144;
    procedure GhostMethod__Xuspc_1376_337; dispid 1610744145;
    procedure GhostMethod__Xuspc_1380_338; dispid 1610744146;
    procedure GhostMethod__Xuspc_1384_339; dispid 1610744147;
    procedure GhostMethod__Xuspc_1388_340; dispid 1610744148;
    procedure GhostMethod__Xuspc_1392_341; dispid 1610744149;
    procedure GhostMethod__Xuspc_1396_342; dispid 1610744150;
    procedure GhostMethod__Xuspc_1400_343; dispid 1610744151;
    procedure GhostMethod__Xuspc_1404_344; dispid 1610744152;
    procedure GhostMethod__Xuspc_1408_345; dispid 1610744153;
    procedure GhostMethod__Xuspc_1412_346; dispid 1610744154;
    procedure GhostMethod__Xuspc_1416_347; dispid 1610744155;
    procedure GhostMethod__Xuspc_1420_348; dispid 1610744156;
    procedure GhostMethod__Xuspc_1424_349; dispid 1610744157;
    procedure GhostMethod__Xuspc_1428_350; dispid 1610744158;
    procedure GhostMethod__Xuspc_1432_351; dispid 1610744159;
    procedure GhostMethod__Xuspc_1436_352; dispid 1610744160;
    procedure GhostMethod__Xuspc_1440_353; dispid 1610744161;
    procedure GhostMethod__Xuspc_1444_354; dispid 1610744162;
    procedure GhostMethod__Xuspc_1448_355; dispid 1610744163;
    procedure GhostMethod__Xuspc_1452_356; dispid 1610744164;
    procedure GhostMethod__Xuspc_1456_357; dispid 1610744165;
    procedure GhostMethod__Xuspc_1460_358; dispid 1610744166;
    procedure GhostMethod__Xuspc_1464_359; dispid 1610744167;
    procedure GhostMethod__Xuspc_1468_360; dispid 1610744168;
    procedure GhostMethod__Xuspc_1472_361; dispid 1610744169;
    procedure GhostMethod__Xuspc_1476_362; dispid 1610744170;
    procedure GhostMethod__Xuspc_1480_363; dispid 1610744171;
    procedure GhostMethod__Xuspc_1484_364; dispid 1610744172;
    procedure GhostMethod__Xuspc_1488_365; dispid 1610744173;
    procedure GhostMethod__Xuspc_1492_366; dispid 1610744174;
    procedure GhostMethod__Xuspc_1496_367; dispid 1610744175;
    procedure GhostMethod__Xuspc_1500_368; dispid 1610744176;
    procedure GhostMethod__Xuspc_1504_369; dispid 1610744177;
    procedure GhostMethod__Xuspc_1508_370; dispid 1610744178;
    procedure GhostMethod__Xuspc_1512_371; dispid 1610744179;
    procedure GhostMethod__Xuspc_1516_372; dispid 1610744180;
    procedure GhostMethod__Xuspc_1520_373; dispid 1610744181;
    procedure GhostMethod__Xuspc_1524_374; dispid 1610744182;
    procedure GhostMethod__Xuspc_1528_375; dispid 1610744183;
    procedure GhostMethod__Xuspc_1532_376; dispid 1610744184;
    procedure GhostMethod__Xuspc_1536_377; dispid 1610744185;
    procedure GhostMethod__Xuspc_1540_378; dispid 1610744186;
    procedure GhostMethod__Xuspc_1544_379; dispid 1610744187;
    procedure GhostMethod__Xuspc_1548_380; dispid 1610744188;
    procedure GhostMethod__Xuspc_1552_381; dispid 1610744189;
    procedure GhostMethod__Xuspc_1556_382; dispid 1610744190;
    procedure GhostMethod__Xuspc_1560_383; dispid 1610744191;
    procedure GhostMethod__Xuspc_1564_384; dispid 1610744192;
    procedure GhostMethod__Xuspc_1568_385; dispid 1610744193;
    procedure GhostMethod__Xuspc_1572_386; dispid 1610744194;
    procedure GhostMethod__Xuspc_1576_387; dispid 1610744195;
    procedure GhostMethod__Xuspc_1580_388; dispid 1610744196;
    procedure GhostMethod__Xuspc_1584_389; dispid 1610744197;
    procedure GhostMethod__Xuspc_1588_390; dispid 1610744198;
    procedure GhostMethod__Xuspc_1592_391; dispid 1610744199;
    procedure GhostMethod__Xuspc_1596_392; dispid 1610744200;
    procedure GhostMethod__Xuspc_1600_393; dispid 1610744201;
    procedure GhostMethod__Xuspc_1604_394; dispid 1610744202;
    procedure GhostMethod__Xuspc_1608_395; dispid 1610744203;
    procedure GhostMethod__Xuspc_1612_396; dispid 1610744204;
    procedure GhostMethod__Xuspc_1616_397; dispid 1610744205;
    procedure GhostMethod__Xuspc_1620_398; dispid 1610744206;
    procedure GhostMethod__Xuspc_1624_399; dispid 1610744207;
    procedure GhostMethod__Xuspc_1628_400; dispid 1610744208;
    procedure GhostMethod__Xuspc_1632_401; dispid 1610744209;
    procedure GhostMethod__Xuspc_1636_402; dispid 1610744210;
    procedure GhostMethod__Xuspc_1640_403; dispid 1610744211;
    procedure GhostMethod__Xuspc_1644_404; dispid 1610744212;
    procedure GhostMethod__Xuspc_1648_405; dispid 1610744213;
    procedure GhostMethod__Xuspc_1652_406; dispid 1610744214;
    procedure GhostMethod__Xuspc_1656_407; dispid 1610744215;
    procedure GhostMethod__Xuspc_1660_408; dispid 1610744216;
    procedure GhostMethod__Xuspc_1664_409; dispid 1610744217;
    procedure GhostMethod__Xuspc_1668_410; dispid 1610744218;
    procedure GhostMethod__Xuspc_1672_411; dispid 1610744219;
    procedure GhostMethod__Xuspc_1676_412; dispid 1610744220;
    procedure GhostMethod__Xuspc_1680_413; dispid 1610744221;
    procedure GhostMethod__Xuspc_1684_414; dispid 1610744222;
    procedure GhostMethod__Xuspc_1688_415; dispid 1610744223;
    procedure GhostMethod__Xuspc_1692_416; dispid 1610744224;
    procedure GhostMethod__Xuspc_1696_417; dispid 1610744225;
    procedure GhostMethod__Xuspc_1700_418; dispid 1610744226;
    procedure GhostMethod__Xuspc_1704_419; dispid 1610744227;
    procedure GhostMethod__Xuspc_1708_420; dispid 1610744228;
    procedure GhostMethod__Xuspc_1712_421; dispid 1610744229;
    procedure GhostMethod__Xuspc_1716_422; dispid 1610744230;
    procedure GhostMethod__Xuspc_1720_423; dispid 1610744231;
    procedure GhostMethod__Xuspc_1724_424; dispid 1610744232;
    procedure GhostMethod__Xuspc_1728_425; dispid 1610744233;
    procedure GhostMethod__Xuspc_1732_426; dispid 1610744234;
    procedure GhostMethod__Xuspc_1736_427; dispid 1610744235;
    procedure GhostMethod__Xuspc_1740_428; dispid 1610744236;
    procedure GhostMethod__Xuspc_1744_429; dispid 1610744237;
    procedure GhostMethod__Xuspc_1748_430; dispid 1610744238;
    procedure GhostMethod__Xuspc_1752_431; dispid 1610744239;
    procedure GhostMethod__Xuspc_1756_432; dispid 1610744240;
    procedure GhostMethod__Xuspc_1760_433; dispid 1610744241;
    procedure GhostMethod__Xuspc_1764_434; dispid 1610744242;
    procedure GhostMethod__Xuspc_1768_435; dispid 1610744243;
    procedure GhostMethod__Xuspc_1772_436; dispid 1610744244;
    procedure GhostMethod__Xuspc_1776_437; dispid 1610744245;
    procedure GhostMethod__Xuspc_1780_438; dispid 1610744246;
    procedure GhostMethod__Xuspc_1784_439; dispid 1610744247;
    procedure GhostMethod__Xuspc_1788_440; dispid 1610744248;
    procedure GhostMethod__Xuspc_1792_441; dispid 1610744249;
    procedure GhostMethod__Xuspc_1796_442; dispid 1610744250;
    procedure GhostMethod__Xuspc_1800_443; dispid 1610744251;
    procedure GhostMethod__Xuspc_1804_444; dispid 1610744252;
    procedure GhostMethod__Xuspc_1808_445; dispid 1610744253;
    procedure GhostMethod__Xuspc_1812_446; dispid 1610744254;
    procedure GhostMethod__Xuspc_1816_447; dispid 1610744255;
    procedure GhostMethod__Xuspc_1820_448; dispid 1610744256;
    procedure GhostMethod__Xuspc_1824_449; dispid 1610744257;
    procedure GhostMethod__Xuspc_1828_450; dispid 1610744258;
    procedure GhostMethod__Xuspc_1832_451; dispid 1610744259;
    procedure GhostMethod__Xuspc_1836_452; dispid 1610744260;
    procedure GhostMethod__Xuspc_1840_453; dispid 1610744261;
    procedure GhostMethod__Xuspc_1844_454; dispid 1610744262;
    procedure GhostMethod__Xuspc_1848_455; dispid 1610744263;
    procedure GhostMethod__Xuspc_1852_456; dispid 1610744264;
    procedure GhostMethod__Xuspc_1856_457; dispid 1610744265;
    procedure GhostMethod__Xuspc_1860_458; dispid 1610744266;
    procedure GhostMethod__Xuspc_1864_459; dispid 1610744267;
    procedure GhostMethod__Xuspc_1868_460; dispid 1610744268;
    procedure GhostMethod__Xuspc_1872_461; dispid 1610744269;
    procedure GhostMethod__Xuspc_1876_462; dispid 1610744270;
    procedure GhostMethod__Xuspc_1880_463; dispid 1610744271;
    procedure GhostMethod__Xuspc_1884_464; dispid 1610744272;
    procedure GhostMethod__Xuspc_1888_465; dispid 1610744273;
    procedure GhostMethod__Xuspc_1892_466; dispid 1610744274;
    procedure GhostMethod__Xuspc_1896_467; dispid 1610744275;
    procedure GhostMethod__Xuspc_1900_468; dispid 1610744276;
    procedure GhostMethod__Xuspc_1904_469; dispid 1610744277;
    procedure GhostMethod__Xuspc_1908_470; dispid 1610744278;
    procedure GhostMethod__Xuspc_1912_471; dispid 1610744279;
    procedure GhostMethod__Xuspc_1916_472; dispid 1610744280;
    procedure GhostMethod__Xuspc_1920_473; dispid 1610744281;
    procedure GhostMethod__Xuspc_1924_474; dispid 1610744282;
    procedure GhostMethod__Xuspc_1928_475; dispid 1610744283;
    procedure GhostMethod__Xuspc_1932_476; dispid 1610744284;
    procedure GhostMethod__Xuspc_1936_477; dispid 1610744285;
    procedure GhostMethod__Xuspc_1940_478; dispid 1610744286;
    procedure GhostMethod__Xuspc_1944_479; dispid 1610744287;
    procedure GhostMethod__Xuspc_1948_480; dispid 1610744288;
    procedure GhostMethod__Xuspc_1952_481; dispid 1610744289;
    property TimeOutServer: Integer dispid 1073938461;
    property AscanNumber: OleVariant dispid 1745027098;
    property Rows: OleVariant dispid 1745027097;
    property Cols: OleVariant dispid 1745027096;
    property BorderStyle: XuspcBorderStyle dispid 1745027095;
    property BackColor: OLE_COLOR dispid 1745027094;
    property BackStyle: XuspcBackStyle dispid 1745027093;
    property AscanFrameVisible: WordBool dispid 1745027092;
    property AscanFrameStyle: XuspcAscanStyle dispid 1745027091;
    property AscanFrameColor: OLE_COLOR dispid 1745027090;
    property AscanAutoSize: WordBool dispid 1745027089;
    property AscanBackColor: OLE_COLOR dispid 1745027088;
    property AscanGridVisible: WordBool dispid 1745027087;
    property AscanGridColor: OLE_COLOR dispid 1745027086;
    property AscanTicksLabelsColor: OLE_COLOR dispid 1745027085;
    property AscanCaptionVisible: WordBool dispid 1745027084;
    property AscanCaptionColor: OLE_COLOR dispid 1745027083;
    property AscanColor: OLE_COLOR dispid 1745027082;
    property GateIFColor: OLE_COLOR dispid 1745027081;
    property Gate1Color: OLE_COLOR dispid 1745027080;
    property Gate2Color: OLE_COLOR dispid 1745027079;
    property DACVisible: WordBool dispid 1745027078;
    property RejectVisible: WordBool dispid 1745027077;
    property unit_: XuspcUnit dispid 1745027076;
    property DACCursorsVisible: WordBool dispid 1745027075;
    function  AscanPositionSize(iAscan: Smallint; Top: Smallint; Left: Smallint; Width: Smallint; 
                                Height: Smallint): Smallint; dispid 1610809378;
    function  AscanSource(iAscan: Smallint; Board: Smallint; Channel: Smallint; 
                          const Server: WideString): Smallint; dispid 1610809379;
    function  AscanCaption(iAscan: Smallint; const Caption: WideString): Smallint; dispid 1610809380;
    procedure GetDACPoint(var Position: Double; var Amplitude: Double); dispid 1610809381;
    procedure GetDACLevel(var Level: Double); dispid 1610809382;
    property AutoRedraw: WordBool dispid 1745027074;
    procedure USPC_Display; dispid 1610809384;
    function  USPC_Open(const Server: WideString; OpenType: Integer): Integer; dispid 1610809385;
    function  USPC_Close(const Server: WideString): Integer; dispid 1610809386;
    function  USPC_Load(const Server: WideString; Board: Integer; Channel: Integer; 
                        const file_: WideString): Integer; dispid 1610809387;
    function  USPC_Save(const Server: WideString; Board: Integer; Channel: Integer; 
                        const file_: WideString): Integer; dispid 1610809388;
    function  USPC_Read(const Server: WideString; Board: Integer; Channel: Integer; unit_: Integer; 
                        const strParam: WideString; var dblValue: Double; var dblT1: OleVariant; 
                        var dblT2: OleVariant; var strValue: OleVariant): Integer; dispid 1610809389;
    function  USPC_Write(const Server: WideString; Board: Integer; Channel: Integer; 
                         unit_: Integer; const strParam: WideString; var dblValue: Double; 
                         var dblT1: OleVariant; var dblT2: OleVariant; var strValue: OleVariant; 
                         var clip: Integer): Integer; dispid 1610809390;
    property VersionMajor: Smallint readonly dispid 1745027073;
    property VersionMinor: Smallint readonly dispid 1745027072;
  end;

// *********************************************************************//
// DispIntf :  __Xuspc
// Flags :     (4240) Hidden NonExtensible Dispatchable
// GUID :      {BCAECE39-0530-42DD-BC92-9FB7B1D2C00D}
// *********************************************************************//
  __Xuspc = dispinterface
    ['{BCAECE39-0530-42DD-BC92-9FB7B1D2C00D}']
    procedure Change; dispid 1;
  end;

(* *****************************************************************
 * AVERTISSEMENT : le wrapper de contrôle suivant a été généré pour une 
 * classe pour laquelle l'indicateur CAN_CREATE n'a pas été détecté. Cela 
 * peut signifier que le contrôle requiert une activation de contrôle non fenêtré. 
 * + Delphi ne prend pas en charge l'activation de contrôle non fenêtré pour le 
 * moment. Les versions à venir assureront peut-être cette prise en charge. En 
 * attendant, si la CoClasse utilisée par le wrapper suivant requiert une activation 
 * non fenêtrée, elle ne fonctionnera pas dans notre conteneur et vous aurez alors 
 * des problèmes d'exécution avec le composant. *)      

// *********************************************************************//
// Déclaration de classe proxy de contrôle OLE
// Nom du contrôle      : TXuspc
// Chaîne d'aide        : 
// Interface par défaut : _Xuspc
// DISP Int. Déf. ?     : No
// Interface événements : __Xuspc
// TypeFlags            : (36) Licensed Control
// *********************************************************************//
  TXuspc = class(TOleControl)
  private
    FOnChange: TNotifyEvent;
    FIntf: _Xuspc;
    function  GetControlInterface: _Xuspc;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function  Get_AscanNumber: OleVariant;
    procedure Set_AscanNumber(Param1: OleVariant);
    function  Get_Rows: OleVariant;
    procedure Set_Rows(Param1: OleVariant);
    function  Get_Cols: OleVariant;
    procedure Set_Cols(Param1: OleVariant);
  public
    function  AscanPositionSize(iAscan: Smallint; Top: Smallint; Left: Smallint; Width: Smallint; 
                                Height: Smallint): Smallint;
    function  AscanSource(iAscan: Smallint; Board: Smallint; Channel: Smallint; 
                          const Server: WideString): Smallint;
    function  AscanCaption(iAscan: Smallint; const Caption: WideString): Smallint;
    procedure GetDACPoint(var Position: Double; var Amplitude: Double);
    procedure GetDACLevel(var Level: Double);
    procedure USPC_Display;
    function  USPC_Open(const Server: WideString; OpenType: Integer): Integer;
    function  USPC_Close(const Server: WideString): Integer;
    function  USPC_Load(const Server: WideString; Board: Integer; Channel: Integer; 
                        const file_: WideString): Integer;
    function  USPC_Save(const Server: WideString; Board: Integer; Channel: Integer; 
                        const file_: WideString): Integer;
    function  USPC_Read(const Server: WideString; Board: Integer; Channel: Integer; unit_: Integer; 
                        const strParam: WideString; var dblValue: Double; var dblT1: OleVariant; 
                        var dblT2: OleVariant; var strValue: OleVariant): Integer;
    function  USPC_Write(const Server: WideString; Board: Integer; Channel: Integer; 
                         unit_: Integer; const strParam: WideString; var dblValue: Double; 
                         var dblT1: OleVariant; var dblT2: OleVariant; var strValue: OleVariant; 
                         var clip: Integer): Integer;
    property  ControlInterface: _Xuspc read GetControlInterface;
    property  DefaultInterface: _Xuspc read GetControlInterface;
    property AscanNumber: OleVariant index 1745027098 read GetOleVariantProp write SetOleVariantProp;
    property Rows: OleVariant index 1745027097 read GetOleVariantProp write SetOleVariantProp;
    property Cols: OleVariant index 1745027096 read GetOleVariantProp write SetOleVariantProp;
    property VersionMajor: Smallint index 1745027073 read GetSmallintProp;
    property VersionMinor: Smallint index 1745027072 read GetSmallintProp;
  published
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property TimeOutServer: Integer index 1073938461 read GetIntegerProp write SetIntegerProp stored False;
    property BorderStyle: TOleEnum index 1745027095 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property BackColor: TColor index 1745027094 read GetTColorProp write SetTColorProp stored False;
    property BackStyle: TOleEnum index 1745027093 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property AscanFrameVisible: WordBool index 1745027092 read GetWordBoolProp write SetWordBoolProp stored False;
    property AscanFrameStyle: TOleEnum index 1745027091 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property AscanFrameColor: TColor index 1745027090 read GetTColorProp write SetTColorProp stored False;
    property AscanAutoSize: WordBool index 1745027089 read GetWordBoolProp write SetWordBoolProp stored False;
    property AscanBackColor: TColor index 1745027088 read GetTColorProp write SetTColorProp stored False;
    property AscanGridVisible: WordBool index 1745027087 read GetWordBoolProp write SetWordBoolProp stored False;
    property AscanGridColor: TColor index 1745027086 read GetTColorProp write SetTColorProp stored False;
    property AscanTicksLabelsColor: TColor index 1745027085 read GetTColorProp write SetTColorProp stored False;
    property AscanCaptionVisible: WordBool index 1745027084 read GetWordBoolProp write SetWordBoolProp stored False;
    property AscanCaptionColor: TColor index 1745027083 read GetTColorProp write SetTColorProp stored False;
    property AscanColor: TColor index 1745027082 read GetTColorProp write SetTColorProp stored False;
    property GateIFColor: TColor index 1745027081 read GetTColorProp write SetTColorProp stored False;
    property Gate1Color: TColor index 1745027080 read GetTColorProp write SetTColorProp stored False;
    property Gate2Color: TColor index 1745027079 read GetTColorProp write SetTColorProp stored False;
    property DACVisible: WordBool index 1745027078 read GetWordBoolProp write SetWordBoolProp stored False;
    property RejectVisible: WordBool index 1745027077 read GetWordBoolProp write SetWordBoolProp stored False;
    property unit_: TOleEnum index 1745027076 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property DACCursorsVisible: WordBool index 1745027075 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoRedraw: WordBool index 1745027074 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TXuspc.InitControlData;
const
  CEventDispIDs: array [0..0] of DWORD = (
    $00000001);
  CLicenseKey: array[0..12] of Word = ( $0069, $006D, $006A, $006B, $006E, $006B, $006C, $006B, $0077, $006E, $006C
    , $006F, $0000);
  CControlData: TControlData2 = (
    ClassID: '{A52F4F97-CB79-443C-A416-4289AB0690AB}';
    EventIID: '{BCAECE39-0530-42DD-BC92-9FB7B1D2C00D}';
    EventCount: 1;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: @CLicenseKey;
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnChange) - Cardinal(Self);
end;

procedure TXuspc.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _Xuspc;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TXuspc.GetControlInterface: _Xuspc;
begin
  CreateControl;
  Result := FIntf;
end;

function  TXuspc.Get_AscanNumber: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.AscanNumber;
end;

procedure TXuspc.Set_AscanNumber(Param1: OleVariant);
begin
  DefaultInterface.AscanNumber := Param1;
end;

function  TXuspc.Get_Rows: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Rows;
end;

procedure TXuspc.Set_Rows(Param1: OleVariant);
begin
  DefaultInterface.Rows := Param1;
end;

function  TXuspc.Get_Cols: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Cols;
end;

procedure TXuspc.Set_Cols(Param1: OleVariant);
begin
  DefaultInterface.Cols := Param1;
end;

function  TXuspc.AscanPositionSize(iAscan: Smallint; Top: Smallint; Left: Smallint; 
                                   Width: Smallint; Height: Smallint): Smallint;
begin
  Result := DefaultInterface.AscanPositionSize(iAscan, Top, Left, Width, Height);
end;

function  TXuspc.AscanSource(iAscan: Smallint; Board: Smallint; Channel: Smallint; 
                             const Server: WideString): Smallint;
begin
  Result := DefaultInterface.AscanSource(iAscan, Board, Channel, Server);
end;

function  TXuspc.AscanCaption(iAscan: Smallint; const Caption: WideString): Smallint;
begin
  Result := DefaultInterface.AscanCaption(iAscan, Caption);
end;

procedure TXuspc.GetDACPoint(var Position: Double; var Amplitude: Double);
begin
  DefaultInterface.GetDACPoint(Position, Amplitude);
end;

procedure TXuspc.GetDACLevel(var Level: Double);
begin
  DefaultInterface.GetDACLevel(Level);
end;

procedure TXuspc.USPC_Display;
begin
  DefaultInterface.USPC_Display;
end;

function  TXuspc.USPC_Open(const Server: WideString; OpenType: Integer): Integer;
begin
  Result := DefaultInterface.USPC_Open(Server, OpenType);
end;

function  TXuspc.USPC_Close(const Server: WideString): Integer;
begin
  Result := DefaultInterface.USPC_Close(Server);
end;

function  TXuspc.USPC_Load(const Server: WideString; Board: Integer; Channel: Integer; 
                           const file_: WideString): Integer;
begin
  Result := DefaultInterface.USPC_Load(Server, Board, Channel, file_);
end;

function  TXuspc.USPC_Save(const Server: WideString; Board: Integer; Channel: Integer; 
                           const file_: WideString): Integer;
begin
  Result := DefaultInterface.USPC_Save(Server, Board, Channel, file_);
end;

function  TXuspc.USPC_Read(const Server: WideString; Board: Integer; Channel: Integer; 
                           unit_: Integer; const strParam: WideString; var dblValue: Double; 
                           var dblT1: OleVariant; var dblT2: OleVariant; var strValue: OleVariant): Integer;
begin
  Result := DefaultInterface.USPC_Read(Server, Board, Channel, unit_, strParam, dblValue, dblT1, 
                                       dblT2, strValue);
end;

function  TXuspc.USPC_Write(const Server: WideString; Board: Integer; Channel: Integer; 
                            unit_: Integer; const strParam: WideString; var dblValue: Double; 
                            var dblT1: OleVariant; var dblT2: OleVariant; var strValue: OleVariant; 
                            var clip: Integer): Integer;
begin
  Result := DefaultInterface.USPC_Write(Server, Board, Channel, unit_, strParam, dblValue, dblT1, 
                                        dblT2, strValue, clip);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TXuspc]);
end;

end.
