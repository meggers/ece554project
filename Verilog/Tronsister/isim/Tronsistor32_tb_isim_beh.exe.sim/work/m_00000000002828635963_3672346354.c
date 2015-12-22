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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/PPU/PPU_SPGEN.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {255U, 0U};
static int ng4[] = {1, 0};



static void Cont_52_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 5248U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 4328);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t3, 0, 8);
    t6 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t12 & 3U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 3U);
    t14 = (t0 + 6968);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 3U;
    t20 = t19;
    t21 = (t3 + 4);
    t22 = *((unsigned int *)t3);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 1);
    t27 = (t0 + 6808);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Cont_53_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 5496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 7);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 7);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 7032);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 6824);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Cont_54_2(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 5744U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 6);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 6);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 7096);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 6840);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Cont_57_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t5[8];
    char t39[8];
    char t40[8];
    char t45[8];
    char t72[8];
    char t76[8];
    char t88[8];
    char *t1;
    char *t2;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t73;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;
    char *t87;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;

LAB0:    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1528U);
    t6 = *((char **)t2);
    memset(t5, 0, 8);
    t2 = (t6 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t12 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t12) = 1;

LAB7:    t13 = (t5 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t5) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB9;

LAB8:    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    memset(t4, 0, 8);
    t23 = (t5 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t23) != 0)
        goto LAB12;

LAB13:    t30 = (t4 + 4);
    t31 = *((unsigned int *)t4);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB14;

LAB15:    t35 = *((unsigned int *)t4);
    t36 = (~(t35));
    t37 = *((unsigned int *)t30);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t30) > 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t4) > 0)
        goto LAB20;

LAB21:    memcpy(t3, t39, 8);

LAB22:    t102 = (t0 + 7160);
    t103 = (t102 + 56U);
    t104 = *((char **)t103);
    t105 = (t104 + 56U);
    t106 = *((char **)t105);
    memset(t106, 0, 8);
    t107 = 3U;
    t108 = t107;
    t109 = (t3 + 4);
    t110 = *((unsigned int *)t3);
    t107 = (t107 & t110);
    t111 = *((unsigned int *)t109);
    t108 = (t108 & t111);
    t112 = (t106 + 4);
    t113 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t113 | t107);
    t114 = *((unsigned int *)t112);
    *((unsigned int *)t112) = (t114 | t108);
    xsi_driver_vfirst_trans(t102, 0, 1);
    t115 = (t0 + 6856);
    *((int *)t115) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB9:    t17 = *((unsigned int *)t5);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t5) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB8;

LAB10:    *((unsigned int *)t4) = 1;
    goto LAB13;

LAB12:    t29 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB13;

LAB14:    t34 = ((char*)((ng1)));
    goto LAB15;

LAB16:    t41 = (t0 + 3688);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = ((char*)((ng2)));
    memset(t45, 0, 8);
    t46 = (t43 + 4);
    t47 = (t44 + 4);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = *((unsigned int *)t46);
    t52 = *((unsigned int *)t47);
    t53 = (t51 ^ t52);
    t54 = (t50 | t53);
    t55 = *((unsigned int *)t46);
    t56 = *((unsigned int *)t47);
    t57 = (t55 | t56);
    t58 = (~(t57));
    t59 = (t54 & t58);
    if (t59 != 0)
        goto LAB26;

LAB23:    if (t57 != 0)
        goto LAB25;

LAB24:    *((unsigned int *)t45) = 1;

LAB26:    memset(t40, 0, 8);
    t61 = (t45 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (~(t62));
    t64 = *((unsigned int *)t45);
    t65 = (t64 & t63);
    t66 = (t65 & 1U);
    if (t66 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t61) != 0)
        goto LAB29;

LAB30:    t68 = (t40 + 4);
    t69 = *((unsigned int *)t40);
    t70 = *((unsigned int *)t68);
    t71 = (t69 || t70);
    if (t71 > 0)
        goto LAB31;

LAB32:    t97 = *((unsigned int *)t40);
    t98 = (~(t97));
    t99 = *((unsigned int *)t68);
    t100 = (t98 || t99);
    if (t100 > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t68) > 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t40) > 0)
        goto LAB37;

LAB38:    memcpy(t39, t101, 8);

LAB39:    goto LAB17;

LAB18:    xsi_vlog_unsigned_bit_combine(t3, 2, t34, 2, t39, 2);
    goto LAB22;

LAB20:    memcpy(t3, t34, 8);
    goto LAB22;

LAB25:    t60 = (t45 + 4);
    *((unsigned int *)t45) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB26;

LAB27:    *((unsigned int *)t40) = 1;
    goto LAB30;

LAB29:    t67 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t67) = 1;
    goto LAB30;

LAB31:    t73 = (t0 + 4008);
    t74 = (t73 + 56U);
    t75 = *((char **)t74);
    memset(t76, 0, 8);
    t77 = (t76 + 4);
    t78 = (t75 + 4);
    t79 = *((unsigned int *)t75);
    t80 = (t79 >> 7);
    t81 = (t80 & 1);
    *((unsigned int *)t76) = t81;
    t82 = *((unsigned int *)t78);
    t83 = (t82 >> 7);
    t84 = (t83 & 1);
    *((unsigned int *)t77) = t84;
    t85 = (t0 + 4168);
    t86 = (t85 + 56U);
    t87 = *((char **)t86);
    memset(t88, 0, 8);
    t89 = (t88 + 4);
    t90 = (t87 + 4);
    t91 = *((unsigned int *)t87);
    t92 = (t91 >> 7);
    t93 = (t92 & 1);
    *((unsigned int *)t88) = t93;
    t94 = *((unsigned int *)t90);
    t95 = (t94 >> 7);
    t96 = (t95 & 1);
    *((unsigned int *)t89) = t96;
    xsi_vlogtype_concat(t72, 2, 2, 2U, t88, 1, t76, 1);
    goto LAB32;

LAB33:    t101 = ((char*)((ng1)));
    goto LAB34;

LAB35:    xsi_vlog_unsigned_bit_combine(t39, 2, t72, 2, t101, 2);
    goto LAB39;

LAB37:    memcpy(t39, t72, 8);
    goto LAB39;

}

static void Cont_59_4(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 6240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3288U);
    t4 = *((char **)t2);
    t2 = (t0 + 2808U);
    t5 = *((char **)t2);
    xsi_vlogtype_concat(t3, 4, 4, 2U, t5, 2, t4, 2);
    t2 = (t0 + 7224);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 15U;
    t11 = t10;
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t3);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t2, 0, 3);
    t18 = (t0 + 6872);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_64_5(char *t0)
{
    char t13[8];
    char t28[8];
    char t29[8];
    char t32[8];
    char t42[8];
    char t52[8];
    char t62[8];
    char t72[8];
    char t82[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t30;
    char *t31;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    char *t81;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    int t93;
    int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;

LAB0:    t1 = (t0 + 6488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 6888);
    *((int *)t2) = 1;
    t3 = (t0 + 6520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(64, ng0);

LAB5:    xsi_set_current_line(66, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(135, ng0);

LAB103:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 4008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);

LAB30:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(66, ng0);

LAB9:    xsi_set_current_line(67, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(73, ng0);

LAB13:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB17;

LAB14:    if (t18 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t13) = 1;

LAB17:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(81, ng0);

LAB22:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 3128U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB23;

LAB24:    xsi_set_current_line(88, ng0);

LAB27:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t2 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);

LAB25:
LAB20:    goto LAB12;

LAB16:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(77, ng0);

LAB21:    xsi_set_current_line(78, ng0);
    t26 = ((char*)((ng1)));
    t27 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t27, t26, 0, 0, 8, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB20;

LAB23:    xsi_set_current_line(85, ng0);

LAB26:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 2328U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t4 = (t28 + 4);
    t11 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (t14 >> 7);
    t16 = (t15 & 1);
    *((unsigned int *)t28) = t16;
    t17 = *((unsigned int *)t11);
    t18 = (t17 >> 7);
    t19 = (t18 & 1);
    *((unsigned int *)t4) = t19;
    t12 = (t0 + 2328U);
    t26 = *((char **)t12);
    memset(t29, 0, 8);
    t12 = (t29 + 4);
    t27 = (t26 + 4);
    t20 = *((unsigned int *)t26);
    t21 = (t20 >> 6);
    t22 = (t21 & 1);
    *((unsigned int *)t29) = t22;
    t23 = *((unsigned int *)t27);
    t24 = (t23 >> 6);
    t25 = (t24 & 1);
    *((unsigned int *)t12) = t25;
    t30 = (t0 + 2328U);
    t31 = *((char **)t30);
    memset(t32, 0, 8);
    t30 = (t32 + 4);
    t33 = (t31 + 4);
    t34 = *((unsigned int *)t31);
    t35 = (t34 >> 5);
    t36 = (t35 & 1);
    *((unsigned int *)t32) = t36;
    t37 = *((unsigned int *)t33);
    t38 = (t37 >> 5);
    t39 = (t38 & 1);
    *((unsigned int *)t30) = t39;
    t40 = (t0 + 2328U);
    t41 = *((char **)t40);
    memset(t42, 0, 8);
    t40 = (t42 + 4);
    t43 = (t41 + 4);
    t44 = *((unsigned int *)t41);
    t45 = (t44 >> 4);
    t46 = (t45 & 1);
    *((unsigned int *)t42) = t46;
    t47 = *((unsigned int *)t43);
    t48 = (t47 >> 4);
    t49 = (t48 & 1);
    *((unsigned int *)t40) = t49;
    t50 = (t0 + 2328U);
    t51 = *((char **)t50);
    memset(t52, 0, 8);
    t50 = (t52 + 4);
    t53 = (t51 + 4);
    t54 = *((unsigned int *)t51);
    t55 = (t54 >> 3);
    t56 = (t55 & 1);
    *((unsigned int *)t52) = t56;
    t57 = *((unsigned int *)t53);
    t58 = (t57 >> 3);
    t59 = (t58 & 1);
    *((unsigned int *)t50) = t59;
    t60 = (t0 + 2328U);
    t61 = *((char **)t60);
    memset(t62, 0, 8);
    t60 = (t62 + 4);
    t63 = (t61 + 4);
    t64 = *((unsigned int *)t61);
    t65 = (t64 >> 2);
    t66 = (t65 & 1);
    *((unsigned int *)t62) = t66;
    t67 = *((unsigned int *)t63);
    t68 = (t67 >> 2);
    t69 = (t68 & 1);
    *((unsigned int *)t60) = t69;
    t70 = (t0 + 2328U);
    t71 = *((char **)t70);
    memset(t72, 0, 8);
    t70 = (t72 + 4);
    t73 = (t71 + 4);
    t74 = *((unsigned int *)t71);
    t75 = (t74 >> 1);
    t76 = (t75 & 1);
    *((unsigned int *)t72) = t76;
    t77 = *((unsigned int *)t73);
    t78 = (t77 >> 1);
    t79 = (t78 & 1);
    *((unsigned int *)t70) = t79;
    t80 = (t0 + 2328U);
    t81 = *((char **)t80);
    memset(t82, 0, 8);
    t80 = (t82 + 4);
    t83 = (t81 + 4);
    t84 = *((unsigned int *)t81);
    t85 = (t84 >> 0);
    t86 = (t85 & 1);
    *((unsigned int *)t82) = t86;
    t87 = *((unsigned int *)t83);
    t88 = (t87 >> 0);
    t89 = (t88 & 1);
    *((unsigned int *)t80) = t89;
    xsi_vlogtype_concat(t13, 8, 8, 8U, t82, 1, t72, 1, t62, 1, t52, 1, t42, 1, t32, 1, t29, 1, t28, 1);
    t90 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t90, t13, 0, 0, 8, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    memset(t28, 0, 8);
    t2 = (t28 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 7);
    t8 = (t7 & 1);
    *((unsigned int *)t28) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 7);
    t14 = (t10 & 1);
    *((unsigned int *)t2) = t14;
    t5 = (t0 + 2488U);
    t11 = *((char **)t5);
    memset(t29, 0, 8);
    t5 = (t29 + 4);
    t12 = (t11 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (t15 >> 6);
    t17 = (t16 & 1);
    *((unsigned int *)t29) = t17;
    t18 = *((unsigned int *)t12);
    t19 = (t18 >> 6);
    t20 = (t19 & 1);
    *((unsigned int *)t5) = t20;
    t26 = (t0 + 2488U);
    t27 = *((char **)t26);
    memset(t32, 0, 8);
    t26 = (t32 + 4);
    t30 = (t27 + 4);
    t21 = *((unsigned int *)t27);
    t22 = (t21 >> 5);
    t23 = (t22 & 1);
    *((unsigned int *)t32) = t23;
    t24 = *((unsigned int *)t30);
    t25 = (t24 >> 5);
    t34 = (t25 & 1);
    *((unsigned int *)t26) = t34;
    t31 = (t0 + 2488U);
    t33 = *((char **)t31);
    memset(t42, 0, 8);
    t31 = (t42 + 4);
    t40 = (t33 + 4);
    t35 = *((unsigned int *)t33);
    t36 = (t35 >> 4);
    t37 = (t36 & 1);
    *((unsigned int *)t42) = t37;
    t38 = *((unsigned int *)t40);
    t39 = (t38 >> 4);
    t44 = (t39 & 1);
    *((unsigned int *)t31) = t44;
    t41 = (t0 + 2488U);
    t43 = *((char **)t41);
    memset(t52, 0, 8);
    t41 = (t52 + 4);
    t50 = (t43 + 4);
    t45 = *((unsigned int *)t43);
    t46 = (t45 >> 3);
    t47 = (t46 & 1);
    *((unsigned int *)t52) = t47;
    t48 = *((unsigned int *)t50);
    t49 = (t48 >> 3);
    t54 = (t49 & 1);
    *((unsigned int *)t41) = t54;
    t51 = (t0 + 2488U);
    t53 = *((char **)t51);
    memset(t62, 0, 8);
    t51 = (t62 + 4);
    t60 = (t53 + 4);
    t55 = *((unsigned int *)t53);
    t56 = (t55 >> 2);
    t57 = (t56 & 1);
    *((unsigned int *)t62) = t57;
    t58 = *((unsigned int *)t60);
    t59 = (t58 >> 2);
    t64 = (t59 & 1);
    *((unsigned int *)t51) = t64;
    t61 = (t0 + 2488U);
    t63 = *((char **)t61);
    memset(t72, 0, 8);
    t61 = (t72 + 4);
    t70 = (t63 + 4);
    t65 = *((unsigned int *)t63);
    t66 = (t65 >> 1);
    t67 = (t66 & 1);
    *((unsigned int *)t72) = t67;
    t68 = *((unsigned int *)t70);
    t69 = (t68 >> 1);
    t74 = (t69 & 1);
    *((unsigned int *)t61) = t74;
    t71 = (t0 + 2488U);
    t73 = *((char **)t71);
    memset(t82, 0, 8);
    t71 = (t82 + 4);
    t80 = (t73 + 4);
    t75 = *((unsigned int *)t73);
    t76 = (t75 >> 0);
    t77 = (t76 & 1);
    *((unsigned int *)t82) = t77;
    t78 = *((unsigned int *)t80);
    t79 = (t78 >> 0);
    t84 = (t79 & 1);
    *((unsigned int *)t71) = t84;
    xsi_vlogtype_concat(t13, 8, 8, 8U, t82, 1, t72, 1, t62, 1, t52, 1, t42, 1, t32, 1, t29, 1, t28, 1);
    t81 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t81, t13, 0, 0, 8, 0LL);
    goto LAB25;

LAB28:    xsi_set_current_line(96, ng0);

LAB31:    xsi_set_current_line(97, ng0);
    t4 = (t0 + 4328);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 4008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB35;

LAB32:    if (t18 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t13) = 1;

LAB35:    memset(t28, 0, 8);
    t27 = (t13 + 4);
    t21 = *((unsigned int *)t27);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t27) != 0)
        goto LAB38;

LAB39:    t31 = (t28 + 4);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t31);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB40;

LAB41:    memcpy(t42, t28, 8);

LAB42:    t81 = (t42 + 4);
    t101 = *((unsigned int *)t81);
    t102 = (~(t101));
    t103 = *((unsigned int *)t42);
    t104 = (t103 & t102);
    t105 = (t104 != 0);
    if (t105 > 0)
        goto LAB54;

LAB55:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 3848);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB61;

LAB58:    if (t18 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t13) = 1;

LAB61:    t27 = (t13 + 4);
    t21 = *((unsigned int *)t27);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(126, ng0);

LAB102:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 3848);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 2, t5, 32);
    t11 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 2, 0LL);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);

LAB64:
LAB56:    goto LAB30;

LAB34:    t26 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB35;

LAB36:    *((unsigned int *)t28) = 1;
    goto LAB39;

LAB38:    t30 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB39;

LAB40:    t33 = (t0 + 4168);
    t40 = (t33 + 56U);
    t41 = *((char **)t40);
    t43 = ((char*)((ng2)));
    memset(t29, 0, 8);
    t50 = (t41 + 4);
    t51 = (t43 + 4);
    t37 = *((unsigned int *)t41);
    t38 = *((unsigned int *)t43);
    t39 = (t37 ^ t38);
    t44 = *((unsigned int *)t50);
    t45 = *((unsigned int *)t51);
    t46 = (t44 ^ t45);
    t47 = (t39 | t46);
    t48 = *((unsigned int *)t50);
    t49 = *((unsigned int *)t51);
    t54 = (t48 | t49);
    t55 = (~(t54));
    t56 = (t47 & t55);
    if (t56 != 0)
        goto LAB46;

LAB43:    if (t54 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t29) = 1;

LAB46:    memset(t32, 0, 8);
    t60 = (t29 + 4);
    t57 = *((unsigned int *)t60);
    t58 = (~(t57));
    t59 = *((unsigned int *)t29);
    t64 = (t59 & t58);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t60) != 0)
        goto LAB49;

LAB50:    t66 = *((unsigned int *)t28);
    t67 = *((unsigned int *)t32);
    t68 = (t66 & t67);
    *((unsigned int *)t42) = t68;
    t63 = (t28 + 4);
    t70 = (t32 + 4);
    t71 = (t42 + 4);
    t69 = *((unsigned int *)t63);
    t74 = *((unsigned int *)t70);
    t75 = (t69 | t74);
    *((unsigned int *)t71) = t75;
    t76 = *((unsigned int *)t71);
    t77 = (t76 != 0);
    if (t77 == 1)
        goto LAB51;

LAB52:
LAB53:    goto LAB42;

LAB45:    t53 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB46;

LAB47:    *((unsigned int *)t32) = 1;
    goto LAB50;

LAB49:    t61 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB50;

LAB51:    t78 = *((unsigned int *)t42);
    t79 = *((unsigned int *)t71);
    *((unsigned int *)t42) = (t78 | t79);
    t73 = (t28 + 4);
    t80 = (t32 + 4);
    t84 = *((unsigned int *)t28);
    t85 = (~(t84));
    t86 = *((unsigned int *)t73);
    t87 = (~(t86));
    t88 = *((unsigned int *)t32);
    t89 = (~(t88));
    t91 = *((unsigned int *)t80);
    t92 = (~(t91));
    t93 = (t85 & t87);
    t94 = (t89 & t92);
    t95 = (~(t93));
    t96 = (~(t94));
    t97 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t97 & t95);
    t98 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t98 & t96);
    t99 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t99 & t95);
    t100 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t100 & t96);
    goto LAB53;

LAB54:    xsi_set_current_line(99, ng0);

LAB57:    xsi_set_current_line(100, ng0);
    t83 = ((char*)((ng1)));
    t90 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t90, t83, 0, 0, 8, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    goto LAB56;

LAB60:    t26 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(106, ng0);

LAB65:    xsi_set_current_line(107, ng0);
    t30 = (t0 + 1688U);
    t31 = *((char **)t30);
    t30 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t30, t31, 0, 0, 2, 0LL);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB69;

LAB66:    if (t18 != 0)
        goto LAB68;

LAB67:    *((unsigned int *)t13) = 1;

LAB69:    t27 = (t13 + 4);
    t21 = *((unsigned int *)t27);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB70;

LAB71:    xsi_set_current_line(121, ng0);

LAB101:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 8, t5, 32);
    t11 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 8, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 4008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);

LAB72:    goto LAB64;

LAB68:    t26 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB69;

LAB70:    xsi_set_current_line(109, ng0);

LAB73:    xsi_set_current_line(111, ng0);
    t30 = ((char*)((ng1)));
    t31 = (t0 + 4008);
    t33 = (t31 + 56U);
    t40 = *((char **)t33);
    memset(t29, 0, 8);
    t41 = (t29 + 4);
    t43 = (t40 + 4);
    t34 = *((unsigned int *)t40);
    t35 = (t34 >> 0);
    *((unsigned int *)t29) = t35;
    t36 = *((unsigned int *)t43);
    t37 = (t36 >> 0);
    *((unsigned int *)t41) = t37;
    t38 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t38 & 127U);
    t39 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t39 & 127U);
    xsi_vlogtype_concat(t28, 8, 8, 2U, t29, 7, t30, 1);
    t50 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t50, t28, 0, 0, 8, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t28, 0, 8);
    t11 = (t28 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    *((unsigned int *)t28) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t10 & 127U);
    t14 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t14 & 127U);
    xsi_vlogtype_concat(t13, 8, 8, 2U, t28, 7, t2, 1);
    t26 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t26, t13, 0, 0, 8, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB77;

LAB74:    if (t18 != 0)
        goto LAB76;

LAB75:    *((unsigned int *)t13) = 1;

LAB77:    memset(t28, 0, 8);
    t27 = (t13 + 4);
    t21 = *((unsigned int *)t27);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t27) != 0)
        goto LAB80;

LAB81:    t31 = (t28 + 4);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t31);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB82;

LAB83:    memcpy(t42, t28, 8);

LAB84:    t81 = (t42 + 4);
    t101 = *((unsigned int *)t81);
    t102 = (~(t101));
    t103 = *((unsigned int *)t42);
    t104 = (t103 & t102);
    t105 = (t104 != 0);
    if (t105 > 0)
        goto LAB96;

LAB97:    xsi_set_current_line(116, ng0);

LAB100:    xsi_set_current_line(117, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB98:    goto LAB72;

LAB76:    t26 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB77;

LAB78:    *((unsigned int *)t28) = 1;
    goto LAB81;

LAB80:    t30 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB81;

LAB82:    t33 = (t0 + 4168);
    t40 = (t33 + 56U);
    t41 = *((char **)t40);
    t43 = ((char*)((ng2)));
    memset(t29, 0, 8);
    t50 = (t41 + 4);
    t51 = (t43 + 4);
    t37 = *((unsigned int *)t41);
    t38 = *((unsigned int *)t43);
    t39 = (t37 ^ t38);
    t44 = *((unsigned int *)t50);
    t45 = *((unsigned int *)t51);
    t46 = (t44 ^ t45);
    t47 = (t39 | t46);
    t48 = *((unsigned int *)t50);
    t49 = *((unsigned int *)t51);
    t54 = (t48 | t49);
    t55 = (~(t54));
    t56 = (t47 & t55);
    if (t56 != 0)
        goto LAB88;

LAB85:    if (t54 != 0)
        goto LAB87;

LAB86:    *((unsigned int *)t29) = 1;

LAB88:    memset(t32, 0, 8);
    t60 = (t29 + 4);
    t57 = *((unsigned int *)t60);
    t58 = (~(t57));
    t59 = *((unsigned int *)t29);
    t64 = (t59 & t58);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB89;

LAB90:    if (*((unsigned int *)t60) != 0)
        goto LAB91;

LAB92:    t66 = *((unsigned int *)t28);
    t67 = *((unsigned int *)t32);
    t68 = (t66 & t67);
    *((unsigned int *)t42) = t68;
    t63 = (t28 + 4);
    t70 = (t32 + 4);
    t71 = (t42 + 4);
    t69 = *((unsigned int *)t63);
    t74 = *((unsigned int *)t70);
    t75 = (t69 | t74);
    *((unsigned int *)t71) = t75;
    t76 = *((unsigned int *)t71);
    t77 = (t76 != 0);
    if (t77 == 1)
        goto LAB93;

LAB94:
LAB95:    goto LAB84;

LAB87:    t53 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB88;

LAB89:    *((unsigned int *)t32) = 1;
    goto LAB92;

LAB91:    t61 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB92;

LAB93:    t78 = *((unsigned int *)t42);
    t79 = *((unsigned int *)t71);
    *((unsigned int *)t42) = (t78 | t79);
    t73 = (t28 + 4);
    t80 = (t32 + 4);
    t84 = *((unsigned int *)t28);
    t85 = (~(t84));
    t86 = *((unsigned int *)t73);
    t87 = (~(t86));
    t88 = *((unsigned int *)t32);
    t89 = (~(t88));
    t91 = *((unsigned int *)t80);
    t92 = (~(t91));
    t93 = (t85 & t87);
    t94 = (t89 & t92);
    t95 = (~(t93));
    t96 = (~(t94));
    t97 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t97 & t95);
    t98 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t98 & t96);
    t99 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t99 & t95);
    t100 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t100 & t96);
    goto LAB95;

LAB96:    xsi_set_current_line(114, ng0);

LAB99:    xsi_set_current_line(115, ng0);
    t83 = ((char*)((ng2)));
    t90 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t90, t83, 0, 0, 8, 0LL);
    goto LAB98;

}


extern void work_m_00000000002828635963_3672346354_init()
{
	static char *pe[] = {(void *)Cont_52_0,(void *)Cont_53_1,(void *)Cont_54_2,(void *)Cont_57_3,(void *)Cont_59_4,(void *)Always_64_5};
	xsi_register_didat("work_m_00000000002828635963_3672346354", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000002828635963_3672346354.didat");
	xsi_register_executes(pe);
}
