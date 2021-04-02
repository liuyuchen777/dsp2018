*************************************************
*
* Title:		LCD.asm
* Description:	Display LCD screen,read and write
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/11/25
*
* LAST UPDATE: 	04/12/30 15:50
*
*************************************************
        	.def  start
        	.def  OPERATION
    
       		.data
       		.global english_text
data1
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,07EH,07CH,012H,044H,012H,048H,012H,048H,07EH,050H,012H,048H,012H,048H
            .WORD  07EH,044H,012H,044H,012H,044H,022H,068H,022H,050H,04AH,040H,084H,040H,000H,040H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,01FH,0F0H,010H,010H,01FH,0F0H,000H,000H,0FFH,0FEH,022H,000H
            .WORD  03EH,0F8H,022H,088H,03EH,090H,022H,050H,02FH,020H,0F2H,050H,042H,088H,003H,006H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,000H,010H,0FCH,010H,004H,010H,008H,0FCH,010H,024H,020H,024H,020H,025H,0FEH
            .WORD  024H,020H,048H,020H,028H,020H,010H,020H,028H,020H,044H,020H,084H,0A0H,000H,040H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ʱ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,008H,000H,008H,07CH,008H,044H,008H,045H,0FEH,044H,008H,044H,008H,07CH,008H
            .WORD  044H,088H,044H,048H,044H,048H,044H,008H,07CH,008H,044H,008H,000H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  008H,090H,008H,088H,008H,088H,010H,080H,010H,0BEH,037H,0C0H,030H,080H,050H,040H
            .WORD  090H,040H,010H,040H,010H,020H,010H,022H,010H,012H,010H,00AH,010H,006H,010H,002H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
            .WORD  000H,000H,000H,000H,000H,000H,030H,000H,030H,000H,010H,000H,020H,000H,000H,000H
;--  Ҳ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  001H,000H,001H,000H,011H,000H,011H,030H,011H,0D0H,017H,010H,039H,010H,0D1H,010H
            .WORD  011H,010H,011H,050H,011H,020H,011H,002H,010H,002H,010H,002H,00FH,0FEH,000H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,01FH,0F0H,010H,010H,01FH,0F0H,000H,000H,0FFH,0FEH,022H,000H
            .WORD  03EH,0F8H,022H,088H,03EH,090H,022H,050H,02FH,020H,0F2H,050H,042H,088H,003H,006H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,000H,010H,000H,013H,0FEH,010H,010H,010H,010H,0FCH,020H,010H,020H,010H,068H
            .WORD  010H,064H,010H,0A4H,01DH,022H,0E2H,022H,044H,020H,000H,020H,000H,020H,000H,020H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ʱ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,008H,000H,008H,07CH,008H,044H,008H,045H,0FEH,044H,008H,044H,008H,07CH,008H
            .WORD  044H,088H,044H,048H,044H,048H,044H,008H,07CH,008H,044H,008H,000H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  008H,090H,008H,088H,008H,088H,010H,080H,010H,0BEH,037H,0C0H,030H,080H,050H,040H
            .WORD  090H,040H,010H,040H,010H,020H,010H,022H,010H,012H,010H,00AH,010H,006H,010H,002H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
            .WORD  030H,000H,030H,000H,000H,000H,030H,000H,030H,000H,010H,000H,020H,000H,000H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,07EH,07CH,012H,044H,012H,048H,012H,048H,07EH,050H,012H,048H,012H,048H
            .WORD  07EH,044H,012H,044H,012H,044H,022H,068H,022H,050H,04AH,040H,084H,040H,000H,040H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  020H,000H,03EH,07CH,048H,044H,008H,044H,0FFH,044H,014H,044H,022H,07CH,040H,000H
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,010H,0FEH,0FEH,010H,010H,07CH,07CH,010H,010H,0FEH,0FEH,010H,010H,03FH,0F8H
            .WORD  000H,008H,01FH,0F8H,000H,008H,03FH,0F8H,001H,000H,048H,084H,048H,012H,087H,0F2H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,000H,010H,000H,01FH,0FCH,020H,080H,020H,080H,040H,080H,01FH,0F8H,010H,080H
            .WORD  010H,080H,010H,080H,0FFH,0FEH,000H,080H,000H,080H,000H,080H,000H,080H,000H,080H
;--  ͷ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,080H,000H,080H,008H,080H,004H,080H,024H,080H,010H,080H,010H,080H,000H,080H
            .WORD  0FFH,0FEH,001H,000H,001H,040H,002H,020H,004H,010H,008H,008H,030H,004H,0C0H,004H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
            .WORD  000H,000H,000H,000H,000H,000H,030H,000H,030H,000H,010H,000H,020H,000H,000H,000H
;--  Ҳ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  001H,000H,001H,000H,011H,000H,011H,030H,011H,0D0H,017H,010H,039H,010H,0D1H,010H
            .WORD  011H,010H,011H,050H,011H,020H,011H,002H,010H,002H,010H,002H,00FH,0FEH,000H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,011H,010H,01FH,0F0H,011H,010H,01FH,0F0H,001H,000H,03FH,0F8H,021H,008H
            .WORD  021H,048H,02FH,0E8H,024H,028H,020H,010H,001H,000H,048H,084H,048H,012H,087H,0F2H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,020H,000H,020H,078H,020H,049H,0FCH,048H,020H,048H,020H,048H,020H,07BH,0FEH
            .WORD  048H,070H,048H,0A8H,048H,0A8H,049H,024H,079H,024H,04AH,022H,000H,020H,000H,020H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,000H,010H,000H,01FH,0FCH,020H,080H,020H,080H,040H,080H,01FH,0F8H,010H,080H
            .WORD  010H,080H,010H,080H,0FFH,0FEH,000H,080H,000H,080H,000H,080H,000H,080H,000H,080H
;--  ͷ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,080H,000H,080H,008H,080H,004H,080H,024H,080H,010H,080H,010H,080H,000H,080H
            .WORD  0FFH,0FEH,001H,000H,001H,040H,002H,020H,004H,010H,008H,008H,030H,004H,0C0H,004H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
            .WORD  030H,000H,030H,000H,000H,000H,030H,000H,030H,000H,010H,000H,020H,000H,000H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,07EH,07CH,012H,044H,012H,048H,012H,048H,07EH,050H,012H,048H,012H,048H
            .WORD  07EH,044H,012H,044H,012H,044H,022H,068H,022H,050H,04AH,040H,084H,040H,000H,040H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  008H,040H,008H,020H,00BH,0FEH,010H,000H,010H,000H,031H,0FCH,030H,000H,050H,000H
            .WORD  091H,0FCH,010H,000H,010H,000H,011H,0FCH,011H,004H,011H,004H,011H,0FCH,011H,004H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  008H,000H,008H,080H,00BH,03CH,012H,024H,012H,024H,032H,024H,032H,024H,052H,024H
            .WORD  092H,024H,012H,024H,012H,0B4H,013H,028H,012H,020H,010H,020H,010H,020H,010H,020H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ʱ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,008H,000H,008H,07CH,008H,044H,008H,045H,0FEH,044H,008H,044H,008H,07CH,008H
            .WORD  044H,088H,044H,048H,044H,048H,044H,008H,07CH,008H,044H,008H,000H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  022H,000H,022H,07CH,07FH,044H,022H,044H,022H,044H,03EH,07CH,022H,044H,022H,044H
            .WORD  03EH,044H,022H,07CH,022H,044H,0FFH,044H,004H,084H,022H,084H,041H,014H,082H,008H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
            .WORD  000H,000H,000H,000H,000H,000H,030H,000H,030H,000H,010H,000H,020H,000H,000H,000H
;--  Ҳ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  001H,000H,001H,000H,011H,000H,011H,030H,011H,0D0H,017H,010H,039H,010H,0D1H,010H
            .WORD  011H,010H,011H,050H,011H,020H,011H,002H,010H,002H,010H,002H,00FH,0FEH,000H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,000H,010H,000H,017H,0FEH,010H,020H,018H,020H,054H,040H,050H,040H,050H,0D0H
            .WORD  091H,048H,012H,044H,014H,042H,010H,040H,010H,040H,010H,040H,010H,040H,010H,040H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  040H,000H,04DH,0FCH,070H,008H,044H,050H,044H,020H,03DH,0FEH,040H,024H,07CH,028H
            .WORD  090H,0A0H,010H,0B8H,0FEH,0A0H,010H,0A0H,028H,0E0H,025H,020H,045H,01EH,082H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ʱ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,008H,000H,008H,07CH,008H,044H,008H,045H,0FEH,044H,008H,044H,008H,07CH,008H
            .WORD  044H,088H,044H,048H,044H,048H,044H,008H,07CH,008H,044H,008H,000H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  022H,000H,022H,07CH,07FH,044H,022H,044H,022H,044H,03EH,07CH,022H,044H,022H,044H
            .WORD  03EH,044H,022H,07CH,022H,044H,0FFH,044H,004H,084H,022H,084H,041H,014H,082H,008H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
            .WORD  030H,000H,030H,000H,000H,000H,030H,000H,030H,000H,010H,000H,020H,000H,000H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,07EH,07CH,012H,044H,012H,048H,012H,048H,07EH,050H,012H,048H,012H,048H
            .WORD  07EH,044H,012H,044H,012H,044H,022H,068H,022H,050H,04AH,040H,084H,040H,000H,040H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  001H,000H,021H,008H,011H,008H,009H,010H,009H,020H,001H,000H,0FFH,0FEH,004H,040H
            .WORD  004H,040H,004H,040H,004H,040H,008H,042H,008H,042H,010H,042H,020H,03EH,0C0H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,0FCH,07CH,084H,044H,084H,044H,084H,044H,0FCH,07CH,084H,044H,084H
            .WORD  044H,084H,044H,0FCH,07CH,084H,044H,084H,001H,004H,001H,004H,002H,014H,004H,008H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,070H,01FH,080H,001H,000H,001H,000H,07FH,0FCH,005H,040H,009H,020H,031H,018H
            .WORD  0CFH,0E6H,000H,040H,000H,080H,0FFH,0FEH,001H,000H,001H,000H,005H,000H,002H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  008H,020H,008H,020H,0FFH,0FEH,008H,020H,008H,020H,000H,000H,07FH,0F8H,002H,008H
            .WORD  002H,008H,002H,008H,002H,008H,002H,050H,002H,020H,002H,000H,002H,000H,002H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H,000H
            .WORD  000H,000H,000H,000H,000H,000H,030H,000H,030H,000H,010H,000H,020H,000H,000H,000H
;--  Ҳ  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  001H,000H,001H,000H,011H,000H,011H,030H,011H,0D0H,017H,010H,039H,010H,0D1H,010H
            .WORD  011H,010H,011H,050H,011H,020H,011H,002H,010H,002H,010H,002H,00FH,0FEH,000H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,010H,010H,010H,010H,01FH,0F0H,000H,000H
            .WORD  0FFH,0FEH,001H,000H,011H,000H,011H,0F8H,011H,000H,029H,000H,045H,000H,083H,0FEH
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,000H,03FH,0F8H,021H,008H,029H,028H,025H,048H,03FH,0F8H,001H,000H,001H,000H
            .WORD  03FH,0F8H,001H,000H,001H,000H,0FFH,0FEH,000H,000H,048H,088H,044H,044H,084H,044H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,080H,000H,040H,07BH,0FCH,048H,000H,049H,008H,048H,090H,04FH,0FEH,078H,000H
            .WORD  049H,0F8H,049H,008H,049H,008H,049H,0F8H,079H,008H,049H,008H,001H,0F8H,001H,008H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  010H,040H,010H,040H,020H,040H,07EH,07CH,042H,084H,042H,084H,043H,004H,042H,044H
            .WORD  07EH,024H,042H,024H,042H,004H,042H,004H,042H,004H,07EH,004H,042H,028H,000H,010H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  000H,070H,01FH,080H,001H,000H,001H,000H,07FH,0FCH,005H,040H,009H,020H,031H,018H
            .WORD  0CFH,0E6H,000H,040H,000H,080H,0FFH,0FEH,001H,000H,001H,000H,005H,000H,002H,000H
;--  ��  -- **  ����, 12  **
; ��ǰ��ѡ������һ�����ֶ�Ӧ�ĵ���Ϊ:  ���x�߶�=16x16,  ������Ϊ: 16x16
            .WORD  008H,020H,008H,020H,0FFH,0FEH,008H,020H,008H,020H,000H,000H,07FH,0F8H,002H,008H
            .WORD  002H,008H,002H,008H,002H,008H,002H,050H,002H,020H,002H,000H,002H,000H,002H,000H
	


ITERANCE 	.word 0x0000



TXHOME		.set  40h	;TEXT HOME ADDRESS
TXAREA		.set  41h	;TEXT AREA
GRHOME		.set  42h	;GRAPHIC HOME ADDRESS
GRAREA		.set  43h	;GRAPHIC AREA

OFFSET  	.set  22h	;OFFSET ADDRESS
ADPSET 		.set  24h	;ADDRESS POINTER
AWRON	    .set  0xB0	;SET AUTO WRITE MODE
AWROFF		.set  0xB2	;RESET AUTO WRITE MODE
MODE		.set  80h	;LCD MODE 
DISPMODE 	.set  9ch	;LCD DISPLAY MODE
CURSOR		.set  0xA3	;CURSOR PATTERN

        	.mmregs     ;define memory-mapped registers, 
        				;such as IFR, al, IMR, bl, PRD, PMST, TCR, st0
        	.text
        	.asg AR2,ORIGIN
			.asg AR3,XLABEL
			.asg AR4,YLABEL
			.asg AR5,TEMP
			.asg AR6,TEMP2
			.asg AR7,TIMES

start:

        LDM  PMST, A
        OR   #0x20, A    ;OLVY = 1: The on-chip RAM is mapped into program and data space. 
        								 ;And the Data Page0( 0h-7fh ) is not mapped into the space
        AND  #0x007F, A		
        OR   #0x1C00, A  ;Remount the interrupt table to 0x1C00
        STL  A, PMST     ;initial PMST PMST:Processor mode status register


OPERATION:


;SET TEXT HOME ADDRESS		
		;Send data 0000h
		STM 	#0300h, AR1
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond TXHOME(40h)
		STM     #TXHOME, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;SET GRAPHIC HOME ADDRESS

		;Send data 0200h
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY	
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond GRHOME(42h)
		STM     #GRHOME, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;SET TEXT AREA
		
		;Send data 0010h
		STM     #10h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond TXAREA(41h)
		STM     #TXAREA, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;SET GRAPHIC AREA
		
		;Send data 0010h
		STM     #10h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond GRAREA(43h)
		STM     #GRAREA, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;LCD MODE SET
		
		;Send commond 80h
		;OR MODE,Internal Character Generater MODE
		STM     #MODE, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
		
;LCD DISPLAY MODE SET
		
		;Send commond DISPMODE
		;text on,graphics off,cursor off
		STM     #DISPMODE, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;WRITE ZERO TO TEXT RAM 
	
	;SET ADDRESS POINTER 0000h
		;Send data 0000h
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
	;SET DATA AUTO WRITE 
		;Send commond AWRON(0B0h)
		STM     #AWRON,*AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		;Write data for 80H times
		LD 		#0080H,A
		LD		#0001H,B
TEXT_LOOP:
		STM		#00h,*AR1
		SUB		B,A
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		BC		TEXT_LOOP,ANEQ
		
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

;WRITE ZERO TO GRAPHIC RAM 
	
	;SET ADDRESS POINTER 0200h
		;Send data 0000h
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #02h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
	;SET DATA AUTO WRITE 
		;Send commond AWRON(0B0h)
		STM     #AWRON,*AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		;Write data for 4FFH times
		LD 		#04FFH,A
		LD		#0001H,B

GRAPH_LOOP:	
		STM		#00h,*AR1
		SUB		B,A
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		BC		GRAPH_LOOP,ANEQ
		
		
	;AUTO RESET 
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY


		
		
;WRITE GRAPHIC RAM AND DISPLAY
		
		;WRITE GRAPHIC RAM AND DISPLAY
		;��ʾ����4*7
		;XLABELȡֵ��Χ0-E
		;YLABELȡֵ��Χ1-4
		;TEMPȡֵ��Χ0-6
		;��ʾ����

		STM      #0000H,TEMP
		STM      #0004H,XLABEL
		STM      #0001H,YLABEL
		STM      #0020H,TIMES
		CALL     DISPLAYS


LOOP_END:
		NOP
		
		B  LOOP_END

DISPLAYS:
		LD		XLABEL,A
		SUB     #0010H,A
		BC      CHANGE,AEQ

		CALL	DISPLAY
		LD      TEMP,A
		ADD     #0001H,A
		STL     A,TEMP

		LD      XLABEL,A
		ADD     #0002H,A
		STL     A,XLABEL

		LD      TIMES,A
		SUB     #0001H,A
		STL     A,TIMES
		
		LD      TIMES,A
		BC		DISPLAYS,ANEQ
		RET

DISPLAY:
		LD      #data1,A
		LD      TEMP,T
		MAC     #0020H,A
		STL     A,ORIGIN

		LD      YLABEL,A
		ADD     #0002H,A
		STL     A,TEMP2
		
		LD 		#0010H,A
		LD      XLABEL,B
DISPLAY11:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		PORTW	TEMP2,#0CFFFh
		CALL 	DELAY
	;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
	
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		SUB		#0001,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		ADD 	#0010h,B
		BC		DISPLAY11,ANEQ
		RET

CHANGE:
		LD     YLABEL,A
		ADD    #0001H,A
		STL    A,YLABEL
		
		STM    #0000H,XLABEL
		
		LD      TIMES,A
		BC		DISPLAYS,ANEQ


DELAY:
 		RPT		#0FFFH
		NOP
		RET