       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. UTIL2000.                                            00020000
      ***************************************************************** 00030000
      *  Programmer.: Ben Stearns                                       00040001
      *  Date.......: 2-10-26                                           00050001
      *  GitHub URL.: https://github.com/bstearns07/UTIL2000            00060000
      *  Description: Modifies UTIL1000 with 3 customers                00070001
      ***************************************************************** 00080000
       DATA DIVISION.                                                   00090000
       WORKING-STORAGE SECTION.                                         00100000
                                                                        00110000
      ***************************************************************** 00120000
      * CONSTANTS                                                       00130000
      ***************************************************************** 00140000
       01  WS-RATE-TIER1            PIC V99      VALUE .12.             00150000
       01  WS-RATE-TIER2            PIC V99      VALUE .15.             00160000
       01  WS-RATE-TIER3            PIC V99      VALUE .18.             00170000
       01  WS-TIER1-LIMIT           PIC 9(4)     VALUE 500.             00180000
       01  WS-TIER2-LIMIT           PIC 9(4)     VALUE 500.             00190000
                                                                        00200000
      ***************************************************************** 00210000
      *(new) 3 PREDEFINED CUSTOMERS (NO TABLES)                         00220000
      ***************************************************************** 00230000
       01  WS-CUST-ALPHA.                                               00240001
           05  WS-C1-NAME           PIC X(12)   VALUE 'CUST-ALPHA  '.   00250000
           05  WS-C1-KWH            PIC 9(5)    VALUE 350.              00260000
           05  WS-C1-FEE            PIC 9(3)V99 VALUE 14.95.            00270000
                                                                        00280000
       01  WS-CUST-BRAVO.                                               00281001
           05  WS-C2-NAME           PIC X(12)   VALUE 'CUST-BRAVO  '.   00282001
           05  WS-C2-KWH            PIC 9(5)    VALUE 925.              00283001
           05  WS-C2-FEE            PIC 9(3)V99 VALUE 14.95.            00284001
                                                                        00285001
       01  WS-CUST-CHARLIE.                                             00286001
           05  WS-C3-NAME           PIC X(12)   VALUE 'CUST-CHARLIE'.   00287001
           05  WS-C3-KWH            PIC 9(5)    VALUE 1350.             00288001
           05  WS-C3-FEE            PIC 9(3)V99 VALUE 14.95.            00289001
                                                                        00289101
      ***************************************************************** 00290000
      * CURRENT "INPUT" FIELDS (LOADED PER CUSTOMER)                    00300000
      ***************************************************************** 00310000
       01  WS-CUST-NAME             PIC X(12)   VALUE SPACES.           00320000
       01  WS-KWH-USED              PIC 9(5)    VALUE 0.                00330000
       01  WS-SERVICE-FEE           PIC 9(3)V99 VALUE 0.                00340000
                                                                        00350000
      ***************************************************************** 00360000
      * WORK AREAS                                                      00370000
      ***************************************************************** 00380000
       01  WS-TIER1-KWH             PIC 9(5)     VALUE 0.               00390000
       01  WS-TIER2-KWH             PIC 9(5)     VALUE 0.               00400000
       01  WS-TIER3-KWH             PIC 9(5)     VALUE 0.               00410000
                                                                        00420000
       01  WS-TIER1-CHARGE          PIC 9(5)V99  VALUE 0.               00430000
       01  WS-TIER2-CHARGE          PIC 9(5)V99  VALUE 0.               00440000
       01  WS-TIER3-CHARGE          PIC 9(5)V99  VALUE 0.               00450000
                                                                        00460000
       01  WS-SUBTOTAL              PIC 9(6)V99  VALUE 0.               00470000
       01  WS-TOTAL-BILL            PIC 9(6)V99  VALUE 0.               00480000
                                                                        00490000
      ***************************************************************** 00500000
      * EDITED FIELDS FOR DISPLAY                                       00510000
      ***************************************************************** 00520000
       01  WS-KWH-USED-ED           PIC Z,ZZZ,ZZZ,ZZ9.                  00530000
       01  WS-MONEY-ED              PIC $$,$$$,$$9.99.                  00540000
       01  WS-MONEY-ED2             PIC $$,$$$,$$9.99.                  00550000
                                                                        00560000
      ***************************************************************** 00570000
      * IT'S GO TIME!                                                   00580000
      ***************************************************************** 00590000
       PROCEDURE DIVISION.                                              00600000
                                                                        00610000
      ***************************************************************** 00620000
      * MAINLINE - DISPLAY HEADING, LOAD CUSTOMER, RUN BILL, STOP       00630000
      ***************************************************************** 00640000
       000-MAIN.                                                        00650000
           DISPLAY '*************************************'.             00660000
           DISPLAY '*** UTIL2000 - ALL CUSTOMER BILLS ***'.             00670000
           DISPLAY '*************************************'.             00680000
           DISPLAY ' '.                                                 00690000
                                                                        00700000
           PERFORM 500-LOAD-CUST.                                       00710000
                                                                        00720000
                                                                        00730000
           STOP RUN.                                                    00740000
                                                                        00750000
      ***************************************************************** 00760000
      * MOVE name/kwh/fee from CUST into current fields.                00770000
      ***************************************************************** 00780000
       500-LOAD-CUST.                                                   00790000
           MOVE    WS-C1-NAME TO WS-CUST-NAME.                          00800001
           MOVE    WS-C1-KWH  TO WS-KWH-USED.                           00810001
           MOVE    WS-C1-FEE  TO WS-SERVICE-FEE.                        00820001
           PERFORM 600-RUN-BILL.                                        00830001
           MOVE    WS-C2-NAME TO WS-CUST-NAME.                          00831001
           MOVE    WS-C2-KWH  TO WS-KWH-USED.                           00832001
           MOVE    WS-C2-FEE  TO WS-SERVICE-FEE.                        00833004
           PERFORM 600-RUN-BILL.                                        00833101
           MOVE    WS-C3-NAME TO WS-CUST-NAME.                          00833201
           MOVE    WS-C3-KWH  TO WS-KWH-USED.                           00833301
           MOVE    WS-C3-FEE  TO WS-SERVICE-FEE.                        00833404
           PERFORM 600-RUN-BILL.                                        00834001
                                                                        00835001
      ***************************************************************** 00840000
      * BILL ROUTINE                                                    00850000
      ***************************************************************** 00860000
       600-RUN-BILL.                                                    00870000
           PERFORM 100-INITIALIZE.                                      00880000
           PERFORM 200-CALC-TIERS.                                      00890000
           PERFORM 300-CALC-CHARGES.                                    00900000
           PERFORM 400-DISPLAY-RESULTS.                                 00910000
           DISPLAY ' '.                                                 00920000
                                                                        00930000
      ***************************************************************** 00940000
      * Zero tier kWh, charges, subtotal, total                         00950000
      ***************************************************************** 00960000
       100-INITIALIZE.                                                  00970000
           MOVE 0 TO WS-TIER1-KWH                                       00980000
                    WS-TIER2-KWH                                        00990000
                    WS-TIER3-KWH                                        01000000
                    WS-TIER1-CHARGE                                     01010000
                    WS-TIER2-CHARGE                                     01020000
                    WS-TIER3-CHARGE                                     01030000
                    WS-SUBTOTAL                                         01040000
                    WS-TOTAL-BILL.                                      01050000
                                                                        01060000
      ***************************************************************** 01070000
      * Determine WS-TIER1-KWH, WS-TIER2-KWH, WS-TIER3-KWH              01080000
      * based on WS-KWH-USED                                            01090000
      *                                                                 01100000
      * These are the per-kWh rates:                                    01110000
      * - Tier 1: first 500 kWh at $0.12/kWh                            01120000
      * - Tier 2: next 500 kWh (kWh 501-1000) at $0.15/kWh              01130000
      * - Tier 3: any kWh above 1000 at $0.18/kWh                       01140000
      ***************************************************************** 01150000
       200-CALC-TIERS.                                                  01160000
           *> If amount used is less than 500 kWh, all goes in tier 1   01170000
           IF WS-KWH-USED <= WS-TIER1-LIMIT                             01180000
               MOVE WS-KWH-USED TO WS-TIER1-KWH                         01190000
               MOVE 0 TO WS-TIER2-KWH WS-TIER3-KWH                      01200000
           ELSE                                                         01210000
               MOVE WS-TIER1-LIMIT TO WS-TIER1-KWH                      01220000
                                                                        01230000
               *> If amount used is between 501 and 1000 kWh,           01240000
               *> tier 1 is full, remainder goes in tier 2              01250000
               IF WS-KWH-USED <= (WS-TIER1-LIMIT + WS-TIER2-LIMIT)      01260000
                   COMPUTE WS-TIER2-KWH =                               01270000
                       WS-KWH-USED - WS-TIER1-LIMIT                     01280000
                   MOVE 0 TO WS-TIER3-KWH                               01290000
                                                                        01300000
               *> If amount used is between 1001 and above,             01310000
               *> tier 1 and tier 2 are full, remainder goes in tier 3  01320000
               ELSE                                                     01330000
                   MOVE WS-TIER2-LIMIT TO WS-TIER2-KWH                  01340000
                   COMPUTE WS-TIER3-KWH =                               01350000
                       WS-KWH-USED - WS-TIER1-LIMIT - WS-TIER2-LIMIT    01360000
               END-IF                                                   01370000
           END-IF.                                                      01380000
                                                                        01390000
      ***************************************************************** 01400000
      * COMPUTE charges using ROUNDED and compute totals.               01410000
      ***************************************************************** 01420000
       300-CALC-CHARGES.                                                01430000
           COMPUTE WS-TIER1-CHARGE ROUNDED =                            01440000
               WS-TIER1-KWH * WS-RATE-TIER1.                            01450000
           COMPUTE WS-TIER2-CHARGE ROUNDED =                            01460005
               WS-TIER2-KWH * WS-RATE-TIER2.                            01461005
           COMPUTE WS-TIER3-CHARGE ROUNDED =                            01462005
               WS-TIER3-KWH * WS-RATE-TIER3;                            01463005
                                                                        01464005
           COMPUTE WS-SUBTOTAL =                                        01470005
               WS-TIER1-CHARGE + WS-TIER2-CHARGE + WS-TIER3-CHARGE;     01480005
           COMPUTE WS-TOTAL-BILL =                                      01490000
               WS-SUBTOTAL + WS-SERVICE-FEE.                            01500000
                                                                        01510000
      ***************************************************************** 01520000
      * Display report including customer name.                         01530000
      ***************************************************************** 01540000
       400-DISPLAY-RESULTS.                                             01550000
           MOVE WS-KWH-USED TO WS-KWH-USED-ED.                          01560000
                                                                        01570000
           DISPLAY '--------------------------------'.                  01580000
           DISPLAY 'CUSTOMER: ' WS-CUST-NAME.                           01590000
           DISPLAY '--------------------------------'.                  01600000
           DISPLAY 'KWH USED       : ' WS-KWH-USED-ED.                  01610000
                                                                        01620000
           MOVE WS-SERVICE-FEE TO WS-MONEY-ED.                          01630000
           DISPLAY 'SERVICE FEE    : ' WS-MONEY-ED.                     01640000
                                                                        01650000
           MOVE WS-TIER1-CHARGE TO WS-MONEY-ED.                         01660000
           DISPLAY 'TIER 1 CHARGE  : ' WS-MONEY-ED.                     01670000
                                                                        01680000
           MOVE WS-TIER2-CHARGE TO WS-MONEY-ED.                         01690000
           DISPLAY 'TIER 2 CHARGE  : ' WS-MONEY-ED.                     01700000
                                                                        01710000
           MOVE WS-TIER3-CHARGE TO WS-MONEY-ED.                         01720000
           DISPLAY 'TIER 3 CHARGE  : ' WS-MONEY-ED.                     01730000
                                                                        01740000
           MOVE WS-TOTAL-BILL TO WS-MONEY-ED2.                          01750000
           DISPLAY '--------------------------------'.                  01760000
           DISPLAY 'TOTAL BILL     : ' WS-MONEY-ED2.                    01770000
           DISPLAY '--------------------------------'.                  01780000
