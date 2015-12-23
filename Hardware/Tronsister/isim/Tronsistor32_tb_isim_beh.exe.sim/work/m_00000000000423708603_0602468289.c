/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/PPU/SYSTEM_PALETTE.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {85U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {170U, 0U};
static unsigned int ng6[] = {255U, 0U};



static void Cont_31_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 4);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 4);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 3U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 3U);
    t12 = (t0 + 5312);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 3U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 1);
    t25 = (t0 + 5136);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_32_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 3576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 2);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 2);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 3U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 3U);
    t12 = (t0 + 5376);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 3U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 1);
    t25 = (t0 + 5152);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_33_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 3824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 3U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 3U);
    t12 = (t0 + 5440);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 3U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 1);
    t25 = (t0 + 5168);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_39_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t38[8];
    char t39[8];
    char t42[8];
    char t74[8];
    char t75[8];
    char t78[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t76;
    char *t77;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;

LAB0:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t111 = (t0 + 5504);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    t114 = (t113 + 56U);
    t115 = *((char **)t114);
    memset(t115, 0, 8);
    t116 = 255U;
    t117 = t116;
    t118 = (t3 + 4);
    t119 = *((unsigned int *)t3);
    t116 = (t116 & t119);
    t120 = *((unsigned int *)t118);
    t117 = (t117 & t120);
    t121 = (t115 + 4);
    t122 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t122 | t116);
    t123 = *((unsigned int *)t121);
    *((unsigned int *)t121) = (t123 | t117);
    xsi_driver_vfirst_trans(t111, 0, 7);
    t124 = (t0 + 5184);
    *((int *)t124) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = (t0 + 1368U);
    t41 = *((char **)t40);
    t40 = ((char*)((ng2)));
    memset(t42, 0, 8);
    t43 = (t41 + 4);
    t44 = (t40 + 4);
    t45 = *((unsigned int *)t41);
    t46 = *((unsigned int *)t40);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB24;

LAB21:    if (t54 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t42) = 1;

LAB24:    memset(t39, 0, 8);
    t58 = (t42 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t42);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t58) != 0)
        goto LAB27;

LAB28:    t65 = (t39 + 4);
    t66 = *((unsigned int *)t39);
    t67 = *((unsigned int *)t65);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB29;

LAB30:    t70 = *((unsigned int *)t39);
    t71 = (~(t70));
    t72 = *((unsigned int *)t65);
    t73 = (t71 || t72);
    if (t73 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t65) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t39) > 0)
        goto LAB35;

LAB36:    memcpy(t38, t74, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 8, t33, 8, t38, 8);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB23:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t39) = 1;
    goto LAB28;

LAB27:    t64 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB28;

LAB29:    t69 = ((char*)((ng3)));
    goto LAB30;

LAB31:    t76 = (t0 + 1368U);
    t77 = *((char **)t76);
    t76 = ((char*)((ng4)));
    memset(t78, 0, 8);
    t79 = (t77 + 4);
    t80 = (t76 + 4);
    t81 = *((unsigned int *)t77);
    t82 = *((unsigned int *)t76);
    t83 = (t81 ^ t82);
    t84 = *((unsigned int *)t79);
    t85 = *((unsigned int *)t80);
    t86 = (t84 ^ t85);
    t87 = (t83 | t86);
    t88 = *((unsigned int *)t79);
    t89 = *((unsigned int *)t80);
    t90 = (t88 | t89);
    t91 = (~(t90));
    t92 = (t87 & t91);
    if (t92 != 0)
        goto LAB41;

LAB38:    if (t90 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t78) = 1;

LAB41:    memset(t75, 0, 8);
    t94 = (t78 + 4);
    t95 = *((unsigned int *)t94);
    t96 = (~(t95));
    t97 = *((unsigned int *)t78);
    t98 = (t97 & t96);
    t99 = (t98 & 1U);
    if (t99 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t94) != 0)
        goto LAB44;

LAB45:    t101 = (t75 + 4);
    t102 = *((unsigned int *)t75);
    t103 = *((unsigned int *)t101);
    t104 = (t102 || t103);
    if (t104 > 0)
        goto LAB46;

LAB47:    t106 = *((unsigned int *)t75);
    t107 = (~(t106));
    t108 = *((unsigned int *)t101);
    t109 = (t107 || t108);
    if (t109 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t101) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t75) > 0)
        goto LAB52;

LAB53:    memcpy(t74, t110, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t38, 8, t69, 8, t74, 8);
    goto LAB37;

LAB35:    memcpy(t38, t69, 8);
    goto LAB37;

LAB40:    t93 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t93) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t75) = 1;
    goto LAB45;

LAB44:    t100 = (t75 + 4);
    *((unsigned int *)t75) = 1;
    *((unsigned int *)t100) = 1;
    goto LAB45;

LAB46:    t105 = ((char*)((ng5)));
    goto LAB47;

LAB48:    t110 = ((char*)((ng6)));
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t74, 8, t105, 8, t110, 8);
    goto LAB54;

LAB52:    memcpy(t74, t105, 8);
    goto LAB54;

}

static void Cont_43_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t38[8];
    char t39[8];
    char t42[8];
    char t74[8];
    char t75[8];
    char t78[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t76;
    char *t77;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;

LAB0:    t1 = (t0 + 4320U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1528U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t111 = (t0 + 5568);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    t114 = (t113 + 56U);
    t115 = *((char **)t114);
    memset(t115, 0, 8);
    t116 = 255U;
    t117 = t116;
    t118 = (t3 + 4);
    t119 = *((unsigned int *)t3);
    t116 = (t116 & t119);
    t120 = *((unsigned int *)t118);
    t117 = (t117 & t120);
    t121 = (t115 + 4);
    t122 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t122 | t116);
    t123 = *((unsigned int *)t121);
    *((unsigned int *)t121) = (t123 | t117);
    xsi_driver_vfirst_trans(t111, 0, 7);
    t124 = (t0 + 5200);
    *((int *)t124) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = (t0 + 1528U);
    t41 = *((char **)t40);
    t40 = ((char*)((ng2)));
    memset(t42, 0, 8);
    t43 = (t41 + 4);
    t44 = (t40 + 4);
    t45 = *((unsigned int *)t41);
    t46 = *((unsigned int *)t40);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB24;

LAB21:    if (t54 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t42) = 1;

LAB24:    memset(t39, 0, 8);
    t58 = (t42 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t42);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t58) != 0)
        goto LAB27;

LAB28:    t65 = (t39 + 4);
    t66 = *((unsigned int *)t39);
    t67 = *((unsigned int *)t65);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB29;

LAB30:    t70 = *((unsigned int *)t39);
    t71 = (~(t70));
    t72 = *((unsigned int *)t65);
    t73 = (t71 || t72);
    if (t73 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t65) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t39) > 0)
        goto LAB35;

LAB36:    memcpy(t38, t74, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 8, t33, 8, t38, 8);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB23:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t39) = 1;
    goto LAB28;

LAB27:    t64 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB28;

LAB29:    t69 = ((char*)((ng3)));
    goto LAB30;

LAB31:    t76 = (t0 + 1528U);
    t77 = *((char **)t76);
    t76 = ((char*)((ng4)));
    memset(t78, 0, 8);
    t79 = (t77 + 4);
    t80 = (t76 + 4);
    t81 = *((unsigned int *)t77);
    t82 = *((unsigned int *)t76);
    t83 = (t81 ^ t82);
    t84 = *((unsigned int *)t79);
    t85 = *((unsigned int *)t80);
    t86 = (t84 ^ t85);
    t87 = (t83 | t86);
    t88 = *((unsigned int *)t79);
    t89 = *((unsigned int *)t80);
    t90 = (t88 | t89);
    t91 = (~(t90));
    t92 = (t87 & t91);
    if (t92 != 0)
        goto LAB41;

LAB38:    if (t90 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t78) = 1;

LAB41:    memset(t75, 0, 8);
    t94 = (t78 + 4);
    t95 = *((unsigned int *)t94);
    t96 = (~(t95));
    t97 = *((unsigned int *)t78);
    t98 = (t97 & t96);
    t99 = (t98 & 1U);
    if (t99 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t94) != 0)
        goto LAB44;

LAB45:    t101 = (t75 + 4);
    t102 = *((unsigned int *)t75);
    t103 = *((unsigned int *)t101);
    t104 = (t102 || t103);
    if (t104 > 0)
        goto LAB46;

LAB47:    t106 = *((unsigned int *)t75);
    t107 = (~(t106));
    t108 = *((unsigned int *)t101);
    t109 = (t107 || t108);
    if (t109 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t101) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t75) > 0)
        goto LAB52;

LAB53:    memcpy(t74, t110, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t38, 8, t69, 8, t74, 8);
    goto LAB37;

LAB35:    memcpy(t38, t69, 8);
    goto LAB37;

LAB40:    t93 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t93) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t75) = 1;
    goto LAB45;

LAB44:    t100 = (t75 + 4);
    *((unsigned int *)t75) = 1;
    *((unsigned int *)t100) = 1;
    goto LAB45;

LAB46:    t105 = ((char*)((ng5)));
    goto LAB47;

LAB48:    t110 = ((char*)((ng6)));
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t74, 8, t105, 8, t110, 8);
    goto LAB54;

LAB52:    memcpy(t74, t105, 8);
    goto LAB54;

}

static void Cont_47_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t38[8];
    char t39[8];
    char t42[8];
    char t74[8];
    char t75[8];
    char t78[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t76;
    char *t77;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;

LAB0:    t1 = (t0 + 4568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1688U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t111 = (t0 + 5632);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    t114 = (t113 + 56U);
    t115 = *((char **)t114);
    memset(t115, 0, 8);
    t116 = 255U;
    t117 = t116;
    t118 = (t3 + 4);
    t119 = *((unsigned int *)t3);
    t116 = (t116 & t119);
    t120 = *((unsigned int *)t118);
    t117 = (t117 & t120);
    t121 = (t115 + 4);
    t122 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t122 | t116);
    t123 = *((unsigned int *)t121);
    *((unsigned int *)t121) = (t123 | t117);
    xsi_driver_vfirst_trans(t111, 0, 7);
    t124 = (t0 + 5216);
    *((int *)t124) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = (t0 + 1688U);
    t41 = *((char **)t40);
    t40 = ((char*)((ng2)));
    memset(t42, 0, 8);
    t43 = (t41 + 4);
    t44 = (t40 + 4);
    t45 = *((unsigned int *)t41);
    t46 = *((unsigned int *)t40);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB24;

LAB21:    if (t54 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t42) = 1;

LAB24:    memset(t39, 0, 8);
    t58 = (t42 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t42);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t58) != 0)
        goto LAB27;

LAB28:    t65 = (t39 + 4);
    t66 = *((unsigned int *)t39);
    t67 = *((unsigned int *)t65);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB29;

LAB30:    t70 = *((unsigned int *)t39);
    t71 = (~(t70));
    t72 = *((unsigned int *)t65);
    t73 = (t71 || t72);
    if (t73 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t65) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t39) > 0)
        goto LAB35;

LAB36:    memcpy(t38, t74, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 8, t33, 8, t38, 8);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB23:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t39) = 1;
    goto LAB28;

LAB27:    t64 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB28;

LAB29:    t69 = ((char*)((ng3)));
    goto LAB30;

LAB31:    t76 = (t0 + 1688U);
    t77 = *((char **)t76);
    t76 = ((char*)((ng4)));
    memset(t78, 0, 8);
    t79 = (t77 + 4);
    t80 = (t76 + 4);
    t81 = *((unsigned int *)t77);
    t82 = *((unsigned int *)t76);
    t83 = (t81 ^ t82);
    t84 = *((unsigned int *)t79);
    t85 = *((unsigned int *)t80);
    t86 = (t84 ^ t85);
    t87 = (t83 | t86);
    t88 = *((unsigned int *)t79);
    t89 = *((unsigned int *)t80);
    t90 = (t88 | t89);
    t91 = (~(t90));
    t92 = (t87 & t91);
    if (t92 != 0)
        goto LAB41;

LAB38:    if (t90 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t78) = 1;

LAB41:    memset(t75, 0, 8);
    t94 = (t78 + 4);
    t95 = *((unsigned int *)t94);
    t96 = (~(t95));
    t97 = *((unsigned int *)t78);
    t98 = (t97 & t96);
    t99 = (t98 & 1U);
    if (t99 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t94) != 0)
        goto LAB44;

LAB45:    t101 = (t75 + 4);
    t102 = *((unsigned int *)t75);
    t103 = *((unsigned int *)t101);
    t104 = (t102 || t103);
    if (t104 > 0)
        goto LAB46;

LAB47:    t106 = *((unsigned int *)t75);
    t107 = (~(t106));
    t108 = *((unsigned int *)t101);
    t109 = (t107 || t108);
    if (t109 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t101) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t75) > 0)
        goto LAB52;

LAB53:    memcpy(t74, t110, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t38, 8, t69, 8, t74, 8);
    goto LAB37;

LAB35:    memcpy(t38, t69, 8);
    goto LAB37;

LAB40:    t93 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t93) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t75) = 1;
    goto LAB45;

LAB44:    t100 = (t75 + 4);
    *((unsigned int *)t75) = 1;
    *((unsigned int *)t100) = 1;
    goto LAB45;

LAB46:    t105 = ((char*)((ng5)));
    goto LAB47;

LAB48:    t110 = ((char*)((ng6)));
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t74, 8, t105, 8, t110, 8);
    goto LAB54;

LAB52:    memcpy(t74, t105, 8);
    goto LAB54;

}

static void Cont_52_6(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;

LAB0:    t1 = (t0 + 4816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2008U);
    t4 = *((char **)t2);
    t2 = (t0 + 2168U);
    t5 = *((char **)t2);
    t2 = (t0 + 1848U);
    t6 = *((char **)t2);
    xsi_vlogtype_concat(t3, 24, 24, 3U, t6, 8, t5, 8, t4, 8);
    t2 = (t0 + 5696);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memset(t10, 0, 8);
    t11 = 16777215U;
    t12 = t11;
    t13 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t11 = (t11 & t14);
    t15 = *((unsigned int *)t13);
    t12 = (t12 & t15);
    t16 = (t10 + 4);
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t17 | t11);
    t18 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t18 | t12);
    xsi_driver_vfirst_trans(t2, 0, 23);
    t19 = (t0 + 5232);
    *((int *)t19) = 1;

LAB1:    return;
}


extern void work_m_00000000000423708603_0602468289_init()
{
	static char *pe[] = {(void *)Cont_31_0,(void *)Cont_32_1,(void *)Cont_33_2,(void *)Cont_39_3,(void *)Cont_43_4,(void *)Cont_47_5,(void *)Cont_52_6};
	xsi_register_didat("work_m_00000000000423708603_0602468289", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000000423708603_0602468289.didat");
	xsi_register_executes(pe);
}
