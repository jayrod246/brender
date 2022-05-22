.386p
                NAME    zbsetup
                EXTERNDEF   _memset :BYTE
                EXTERNDEF   _BrResFree :BYTE
                EXTERNDEF   _BrModelUpdate :BYTE
                EXTERNDEF   _BrMaterialUpdate :BYTE
                EXTERNDEF   _fw :BYTE
                EXTERNDEF   ZbMaterialUpdate_ :BYTE
                EXTERNDEF   _BrResAllocate :BYTE
                EXTERNDEF   _BrFailure :BYTE
                EXTERNDEF   _TriangleRenderPIZ2_RGB_888 :BYTE
                EXTERNDEF   _PointRenderPIZ2_RGB_888 :BYTE
                EXTERNDEF   _LineRenderPIZ2I_RGB_888 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2I_RGB_888 :BYTE
                EXTERNDEF   _PointRenderPIZ2T_RGB_888 :BYTE
                EXTERNDEF   _LineRenderPIZ2T_RGB_888 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TA24 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2_RGB_555 :BYTE
                EXTERNDEF   _ZbRenderFaceGroup_FaceRGB :BYTE
                EXTERNDEF   _PointRenderPIZ2_RGB_555 :BYTE
                EXTERNDEF   _LineRenderPIZ2I_RGB_555 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2I_RGB_555 :BYTE
                EXTERNDEF   _PointRenderPIZ2T_RGB_555 :BYTE
                EXTERNDEF   _LineRenderPIZ2T_RGB_555 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TA15 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2 :BYTE
                EXTERNDEF   _ZbRenderFaceGroup_FaceI :BYTE
                EXTERNDEF   _TriangleRenderPIZ2I :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TIAD :BYTE
                EXTERNDEF   _PointRenderPIZ2 :BYTE
                EXTERNDEF   _LineRenderPIZ2I :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TAD :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TIA :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TA :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TI :BYTE
                EXTERNDEF   _ZbRenderFaceGroup_FaceIV :BYTE
                EXTERNDEF   _TriangleRenderPIZ2T :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TID :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TD :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TIP64 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TIP256 :BYTE
                EXTERNDEF   _PointRenderPIZ2TI :BYTE
                EXTERNDEF   _LineRenderPIZ2TI :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TIP1024 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TP64 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TP256 :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TP1024 :BYTE
                EXTERNDEF   _PointRenderPIZ2T :BYTE
                EXTERNDEF   _LineRenderPIZ2T :BYTE
                EXTERNDEF   _TriangleRenderPIZ2TPD1024 :BYTE
                EXTERNDEF   _ZbRenderFaceGroup :BYTE
DGROUP          GROUP   CONST,CONST2,_DATA,_BSS
_TEXT           SEGMENT PARA PUBLIC USE32 'CODE'
                ASSUME  CS:_TEXT ,DS:DGROUP,SS:DGROUP
                PUBLIC  _BrZbBegin 
                PUBLIC  _BrZbEnd 
_BrZbBegin:     push    ebx
                push    esi
                mov     dh,byte ptr (+0cH)[esp]
                mov     dl,byte ptr (+10H)[esp]
                xor     ebx,ebx
                xor     eax,eax
L1:             cmp     dh,byte ptr _rtype_table(+4H)[eax]
                jne     short L2
                cmp     dl,byte ptr _rtype_table(+5H)[eax]
                je      short L3
L2:             add     eax,00000014H
                inc     ebx
                cmp     eax,0000003cH
                jl      short L1
L3:             cmp     ebx,00000003H
                jb      short L4
                push    offset DGROUP:L6
                call    near ptr _BrFailure
                add     esp,00000004H
L4:             lea     eax,(+0H)[ebx*4]
                push    00000016H
                add     eax,ebx
                mov     ebx,offset DGROUP:_rtype_table
                shl     eax,02H
                push    00000000H
                add     ebx,eax
                push    00000000H
                mov     dword ptr _zb(+28cH),ebx
                call    near ptr _BrResAllocate
                add     esp,0000000cH
                mov     ebx,offset ZbMaterialUpdate_
                mov     ecx,dword ptr _fw(+1498H)
                push    00007fffH
                mov     dword ptr _zb(+290H),eax
                xor     edx,edx
                push    ecx
                mov     dword ptr _zb(+84H),edx
                mov     dword ptr _fw(+1474H),ebx
                call    near ptr _BrMaterialUpdate
                add     esp,00000008H
                push    00007fffH
                mov     esi,dword ptr _fw(+1494H)
                push    esi
                call    near ptr _BrModelUpdate
                add     esp,00000008H
                pop     esi
                pop     ebx
                ret     
                nop     
_BrZbEnd:       mov     edx,dword ptr _zb(+290H)
                test    edx,edx
                je      short L5
                push    edx
                call    near ptr _BrResFree
                add     esp,00000004H
L5:             push    00000294H
                push    00000000H
                push    offset DGROUP:_zb
                call    near ptr _memset
                add     esp,0000000cH
                ret     
_TEXT           ENDS

CONST           SEGMENT DWORD PUBLIC USE32 'DATA'
L6              DB      42H,72H,5aH,62H,42H,65H,67H,69H
                DB      6eH,3aH,20H,69H,6eH,76H,61H,6cH
                DB      69H,64H,20H,74H,79H,70H,65H,73H
                DB      20H,66H,6fH,72H,20H,72H,65H,6eH
                DB      64H,65H,72H,69H,6eH,67H,00H
CONST           ENDS

CONST2          SEGMENT DWORD PUBLIC USE32 'DATA'
CONST2          ENDS

_DATA           SEGMENT DWORD PUBLIC USE32 'DATA'
_rscid          DB      24H,49H,64H,3aH,20H,7aH,62H,73H
                DB      65H,74H,75H,70H,2eH,63H,20H,31H
                DB      2eH,31H,38H,20H,31H,39H,39H,35H
                DB      2fH,30H,38H,2fH,33H,31H,20H,31H
                DB      36H,3aH,34H,38H,3aH,30H,33H,20H
                DB      73H,61H,6dH,20H,45H,78H,70H,20H
                DB      24H,00H,00H,00H
_mat_types_index_8 LABEL BYTE
                DB      00H,00H,00H,00H,67H,40H,00H,0c8H
                DB      20H,40H,00H,88H,03H,00H,00H,04H
                DB      00H,04H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TPD1024
                DD      _LineRenderPIZ2T
                DD      _PointRenderPIZ2T
                DB      3fH,00H,00H,00H,38H,00H,00H,00H
                DB      00H,00H,00H,00H,67H,00H,00H,0c8H
                DB      20H,00H,00H,88H,03H,00H,00H,04H
                DB      00H,04H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TP1024
                DD      _LineRenderPIZ2T
                DD      _PointRenderPIZ2T
                DB      3fH,00H,00H,00H,38H,00H,00H,00H
                DB      00H,00H,00H,00H,67H,00H,00H,0c8H
                DB      20H,00H,00H,88H,03H,00H,00H,01H
                DB      00H,01H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TP256
                DD      _LineRenderPIZ2T
                DD      _PointRenderPIZ2T
                DB      3fH,00H,00H,00H,38H,00H,00H,00H
                DB      00H,00H,00H,00H,67H,00H,00H,0c8H
                DB      20H,00H,00H,88H,03H,00H,40H,00H
                DB      40H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TP64
                DD      _LineRenderPIZ2T
                DD      _PointRenderPIZ2T
                DB      3fH,00H,00H,00H,38H,00H,00H,00H
                DB      00H,00H,00H,00H,65H,00H,00H,0c8H
                DB      25H,00H,00H,88H,03H,00H,00H,04H
                DB      00H,04H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TIP1024
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,78H,00H,00H,00H
                DB      00H,00H,00H,00H,65H,00H,00H,0c8H
                DB      25H,00H,00H,88H,03H,00H,00H,01H
                DB      00H,01H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TIP256
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,78H,00H,00H,00H
                DB      00H,00H,00H,00H,65H,00H,00H,0c8H
                DB      25H,00H,00H,88H,03H,00H,40H,00H
                DB      40H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TIP64
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,78H,00H,00H,00H
                DB      00H,00H,00H,00H,67H,40H,00H,0c8H
                DB      00H,40H,00H,88H,03H,00H,00H,01H
                DB      00H,01H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TD
                DD      _LineRenderPIZ2T
                DD      _PointRenderPIZ2T
                DB      3fH,00H,00H,00H,38H,00H,00H,00H
                DB      00H,00H,00H,00H,65H,40H,00H,0c8H
                DB      05H,40H,00H,88H,03H,00H,00H,01H
                DB      00H,01H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TID
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,78H,00H,00H,00H
                DB      00H,00H,00H,00H,47H,00H,00H,0c8H
                DB      00H,00H,00H,88H,03H,00H,00H,01H
                DB      00H,01H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2T
                DD      _LineRenderPIZ2T
                DD      _PointRenderPIZ2T
                DB      3fH,00H,00H,00H,30H,00H,00H,00H
                DB      00H,00H,00H,00H,45H,00H,00H,0c8H
                DB      01H,00H,00H,88H,03H,00H,00H,01H
                DB      00H,01H,00H,00H
                DD      _ZbRenderFaceGroup_FaceIV
                DD      _TriangleRenderPIZ2TI
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,70H,00H,00H,00H
                DB      00H,00H,00H,00H,45H,00H,00H,0c8H
                DB      05H,00H,00H,88H,03H,00H,00H,01H
                DB      00H,01H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TI
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,70H,00H,00H,00H
                DB      00H,00H,00H,00H,47H,00H,00H,0c0H
                DB      00H,00H,00H,80H,03H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TA
                DD      _LineRenderPIZ2T
                DD      _PointRenderPIZ2T
                DB      3fH,00H,00H,00H,30H,00H,00H,00H
                DB      00H,00H,00H,00H,45H,00H,00H,0c0H
                DB      01H,00H,00H,80H,03H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup_FaceIV
                DD      _TriangleRenderPIZ2TIA
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,70H,00H,00H,00H
                DB      00H,00H,00H,00H,45H,00H,00H,0c0H
                DB      05H,00H,00H,80H,03H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TIA
                DD      _LineRenderPIZ2TI
                DD      _PointRenderPIZ2TI
                DB      7fH,00H,00H,00H,70H,00H,00H,00H
                DB      00H,00H,00H,00H,47H,00H,00H,0c0H
                DB      40H,00H,00H,80H,03H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TAD
                DD      _LineRenderPIZ2I
                DD      _PointRenderPIZ2
                DB      3fH,00H,00H,00H,30H,00H,00H,00H
                DB      00H,00H,00H,00H,45H,00H,00H,0c0H
                DB      41H,00H,00H,80H,03H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup_FaceIV
                DD      _TriangleRenderPIZ2TIAD
                DD      _LineRenderPIZ2I
                DD      _PointRenderPIZ2
                DB      7fH,00H,00H,00H,70H,00H,00H,00H
                DB      00H,00H,00H,00H,45H,00H,00H,0c0H
                DB      45H,00H,00H,80H,03H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TIAD
                DD      _LineRenderPIZ2I
                DD      _PointRenderPIZ2
                DB      7fH,00H,00H,00H,70H,00H,00H,00H
                DB      00H,00H,00H,00H,04H,00H,00H,00H
                DB      04H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2I
                DD      _LineRenderPIZ2I
                DD      _PointRenderPIZ2
                DB      4fH,00H,00H,00H,40H,00H,00H,00H
                DB      00H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup_FaceI
                DD      _TriangleRenderPIZ2
                DD      _LineRenderPIZ2I
                DD      _PointRenderPIZ2
                DB      0fH,00H,00H,00H,00H,00H,00H,00H
_mat_types_rgb_555 LABEL BYTE
                DB      00H,00H,00H,00H,47H,00H,00H,0c0H
                DB      00H,00H,00H,80H,04H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TA15
                DD      _LineRenderPIZ2T_RGB_555
                DD      _PointRenderPIZ2T_RGB_555
                DB      3fH,00H,00H,00H,30H,00H,00H,00H
                DB      00H,00H,00H,00H,04H,00H,00H,0c0H
                DB      04H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2I_RGB_555
                DD      _LineRenderPIZ2I_RGB_555
                DD      _PointRenderPIZ2_RGB_555
                DB      8fH,03H,00H,00H,80H,03H,00H,00H
                DB      00H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup_FaceRGB
                DD      _TriangleRenderPIZ2_RGB_555
                DD      _LineRenderPIZ2I_RGB_555
                DD      _PointRenderPIZ2_RGB_555
                DB      0fH,00H,00H,00H,80H,03H,00H,00H
_mat_types_rgb_888 LABEL BYTE
                DB      00H,00H,00H,00H,47H,00H,00H,0c0H
                DB      00H,00H,00H,80H,06H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2TA24
                DD      _LineRenderPIZ2T_RGB_888
                DD      _PointRenderPIZ2T_RGB_888
                DB      3fH,00H,00H,00H,30H,00H,00H,00H
                DB      00H,00H,00H,00H,04H,00H,00H,00H
                DB      04H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup
                DD      _TriangleRenderPIZ2I_RGB_888
                DD      _LineRenderPIZ2I_RGB_888
                DD      _PointRenderPIZ2_RGB_888
                DB      8fH,03H,00H,00H,80H,03H,00H,00H
                DB      00H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H,00H,00H,00H,00H
                DB      00H,00H,00H,00H
                DD      _ZbRenderFaceGroup_FaceRGB
                DD      _TriangleRenderPIZ2_RGB_888
                DD      _LineRenderPIZ2I_RGB_888
                DD      _PointRenderPIZ2_RGB_888
                DB      0fH,00H,00H,00H,80H,03H,00H,00H
_rtype_table    DB      00H,00H,00H,00H,03H,0bH,00H,00H
                DB      01H,02H,00H,00H
                DD      DGROUP:_mat_types_index_8
                DB      14H,00H,00H,00H,00H,00H,00H,00H
                DB      04H,0bH,00H,00H,02H,02H,01H,00H
                DD      DGROUP:_mat_types_rgb_555
                DB      03H,00H,00H,00H,00H,00H,00H,00H
                DB      06H,0bH,00H,00H,03H,02H,01H,00H
                DD      DGROUP:_mat_types_rgb_888
                DB      03H,00H,00H,00H
_DATA           ENDS

_BSS            SEGMENT DWORD PUBLIC USE32 'BSS'
                PUBLIC  _zb 
                ORG     00000000H
_zb             LABEL   BYTE
                ORG     00000294H
_BSS            ENDS

                END