//UTIL2000 JOB (KC03HE9),'DLJ WSC NEBR',REGION=0M,CLASS=A,MSGCLASS=H,   00010003
// NOTIFY=&SYSUID,MSGLEVEL=(1,1)                                        00020003
//*-----------------------------------------------------------*         00030003
//* BASIC COMPILE, LINK, AND GO JCL
//*-----------------------------------------------------------*
//STEP1 EXEC IGYWCLG,REGION=250M,
// PARM.COBOL='TEST,RENT,APOST,OBJECT,NODYNAM,LIB,'
//COBOL.STEPLIB DD DSN=IGY640.SIGYCOMP,
// DISP=SHR
//COBOL.SYSIN DD DISP=SHR,DSN=KC03HE9.CIS352.COBOL(UTIL2000)
