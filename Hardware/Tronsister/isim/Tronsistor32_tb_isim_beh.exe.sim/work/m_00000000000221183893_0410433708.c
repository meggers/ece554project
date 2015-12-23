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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/CPU/Hazard_Detect.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};



static void Cont_80_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
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

LAB0:    t1 = (t0 + 6208U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 5288);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7928);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 7768);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_84_1(char *t0)
{
    char t13[8];
    char t38[8];
    char t47[8];
    char t56[8];
    char t88[8];
    char t97[8];
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
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    int t80;
    int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t101;
    char *t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    int t121;
    int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    char *t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    char *t135;
    char *t136;
    unsigned int t137;

LAB0:    t1 = (t0 + 6456U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 7784);
    *((int *)t2) = 1;
    t3 = (t0 + 6488);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(84, ng0);

LAB5:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 3768U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t13) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t11 = (t13 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t14 = (t9 | t10);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t11);
    t16 = (t15 != 0);
    if (t16 == 1)
        goto LAB10;

LAB11:
LAB12:    t32 = (t13 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t13);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 3928U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t13) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t11 = (t13 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t14 = (t9 | t10);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t11);
    t16 = (t15 != 0);
    if (t16 == 1)
        goto LAB40;

LAB41:
LAB42:    t32 = (t13 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t13);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(110, ng0);

LAB47:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t0 + 2808U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 & t7);
    *((unsigned int *)t13) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t11 = (t13 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t14 = (t9 | t10);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t11);
    t16 = (t15 != 0);
    if (t16 == 1)
        goto LAB48;

LAB49:
LAB50:    t32 = (t0 + 3288U);
    t39 = *((char **)t32);
    t37 = *((unsigned int *)t13);
    t41 = *((unsigned int *)t39);
    t42 = (t37 & t41);
    *((unsigned int *)t38) = t42;
    t32 = (t13 + 4);
    t40 = (t39 + 4);
    t46 = (t38 + 4);
    t43 = *((unsigned int *)t32);
    t44 = *((unsigned int *)t40);
    t45 = (t43 | t44);
    *((unsigned int *)t46) = t45;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB51;

LAB52:
LAB53:    t55 = (t0 + 2008U);
    t60 = *((char **)t55);
    t55 = (t0 + 2648U);
    t61 = *((char **)t55);
    t75 = *((unsigned int *)t60);
    t76 = *((unsigned int *)t61);
    t77 = (t75 ^ t76);
    *((unsigned int *)t56) = t77;
    t55 = (t60 + 4);
    t62 = (t61 + 4);
    t70 = (t56 + 4);
    t78 = *((unsigned int *)t55);
    t79 = *((unsigned int *)t62);
    t82 = (t78 | t79);
    *((unsigned int *)t70) = t82;
    t83 = *((unsigned int *)t56);
    t84 = (~(t83));
    *((unsigned int *)t56) = t84;
    t85 = *((unsigned int *)t70);
    t86 = (t85 != 0);
    if (t86 == 1)
        goto LAB54;

LAB55:
LAB56:    t92 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t92 & 31U);
    t71 = (t56 + 4);
    t93 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t93 & 31U);
    memset(t47, 0, 8);
    t89 = (t56 + 4);
    t94 = *((unsigned int *)t56);
    t95 = *((unsigned int *)t89);
    t98 = (t94 | t95);
    if (t98 != 31U)
        goto LAB58;

LAB57:    if (*((unsigned int *)t89) == 0)
        goto LAB59;

LAB60:    t90 = (t47 + 4);
    *((unsigned int *)t47) = 1;
    *((unsigned int *)t90) = 1;

LAB58:    t99 = *((unsigned int *)t38);
    t100 = *((unsigned int *)t47);
    t104 = (t99 & t100);
    *((unsigned int *)t88) = t104;
    t96 = (t38 + 4);
    t101 = (t47 + 4);
    t102 = (t88 + 4);
    t105 = *((unsigned int *)t96);
    t106 = *((unsigned int *)t101);
    t107 = (t105 | t106);
    *((unsigned int *)t102) = t107;
    t108 = *((unsigned int *)t102);
    t109 = (t108 != 0);
    if (t109 == 1)
        goto LAB61;

LAB62:
LAB63:    t112 = (t88 + 4);
    t131 = *((unsigned int *)t112);
    t132 = (~(t131));
    t133 = *((unsigned int *)t88);
    t134 = (t133 & t132);
    t137 = (t134 != 0);
    if (t137 > 0)
        goto LAB64;

LAB65:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t2 = (t0 + 2808U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 & t7);
    *((unsigned int *)t13) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t11 = (t13 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t14 = (t9 | t10);
    *((unsigned int *)t11) = t14;
    t15 = *((unsigned int *)t11);
    t16 = (t15 != 0);
    if (t16 == 1)
        goto LAB68;

LAB69:
LAB70:    t32 = (t0 + 3288U);
    t39 = *((char **)t32);
    t37 = *((unsigned int *)t13);
    t41 = *((unsigned int *)t39);
    t42 = (t37 & t41);
    *((unsigned int *)t38) = t42;
    t32 = (t13 + 4);
    t40 = (t39 + 4);
    t46 = (t38 + 4);
    t43 = *((unsigned int *)t32);
    t44 = *((unsigned int *)t40);
    t45 = (t43 | t44);
    *((unsigned int *)t46) = t45;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB71;

LAB72:
LAB73:    t55 = (t0 + 2168U);
    t60 = *((char **)t55);
    t55 = (t0 + 2648U);
    t61 = *((char **)t55);
    t75 = *((unsigned int *)t60);
    t76 = *((unsigned int *)t61);
    t77 = (t75 ^ t76);
    *((unsigned int *)t56) = t77;
    t55 = (t60 + 4);
    t62 = (t61 + 4);
    t70 = (t56 + 4);
    t78 = *((unsigned int *)t55);
    t79 = *((unsigned int *)t62);
    t82 = (t78 | t79);
    *((unsigned int *)t70) = t82;
    t83 = *((unsigned int *)t56);
    t84 = (~(t83));
    *((unsigned int *)t56) = t84;
    t85 = *((unsigned int *)t70);
    t86 = (t85 != 0);
    if (t86 == 1)
        goto LAB74;

LAB75:
LAB76:    t92 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t92 & 31U);
    t71 = (t56 + 4);
    t93 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t93 & 31U);
    memset(t47, 0, 8);
    t89 = (t56 + 4);
    t94 = *((unsigned int *)t56);
    t95 = *((unsigned int *)t89);
    t98 = (t94 | t95);
    if (t98 != 31U)
        goto LAB78;

LAB77:    if (*((unsigned int *)t89) == 0)
        goto LAB79;

LAB80:    t90 = (t47 + 4);
    *((unsigned int *)t47) = 1;
    *((unsigned int *)t90) = 1;

LAB78:    t99 = *((unsigned int *)t38);
    t100 = *((unsigned int *)t47);
    t104 = (t99 & t100);
    *((unsigned int *)t88) = t104;
    t96 = (t38 + 4);
    t101 = (t47 + 4);
    t102 = (t88 + 4);
    t105 = *((unsigned int *)t96);
    t106 = *((unsigned int *)t101);
    t107 = (t105 | t106);
    *((unsigned int *)t102) = t107;
    t108 = *((unsigned int *)t102);
    t109 = (t108 != 0);
    if (t109 == 1)
        goto LAB81;

LAB82:
LAB83:    t112 = (t88 + 4);
    t131 = *((unsigned int *)t112);
    t132 = (~(t131));
    t133 = *((unsigned int *)t88);
    t134 = (t133 & t132);
    t137 = (t134 != 0);
    if (t137 > 0)
        goto LAB84;

LAB85:    xsi_set_current_line(119, ng0);

LAB88:    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB86:
LAB66:
LAB45:
LAB15:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(86, ng0);

LAB9:    xsi_set_current_line(88, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4808);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 1);
    goto LAB8;

LAB10:    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t13) = (t17 | t18);
    t12 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t12);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = *((unsigned int *)t19);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (~(t23));
    t29 = (~(t27));
    t30 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t30 & t28);
    t31 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t31 & t29);
    goto LAB12;

LAB13:    xsi_set_current_line(93, ng0);

LAB16:    xsi_set_current_line(95, ng0);
    t39 = (t0 + 2808U);
    t40 = *((char **)t39);
    memset(t38, 0, 8);
    t39 = (t40 + 4);
    t41 = *((unsigned int *)t39);
    t42 = (~(t41));
    t43 = *((unsigned int *)t40);
    t44 = (t43 & t42);
    t45 = (t44 & 1U);
    if (t45 != 0)
        goto LAB20;

LAB18:    if (*((unsigned int *)t39) == 0)
        goto LAB17;

LAB19:    t46 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t46) = 1;

LAB20:    t48 = (t0 + 2968U);
    t49 = *((char **)t48);
    memset(t47, 0, 8);
    t48 = (t49 + 4);
    t50 = *((unsigned int *)t48);
    t51 = (~(t50));
    t52 = *((unsigned int *)t49);
    t53 = (t52 & t51);
    t54 = (t53 & 1U);
    if (t54 != 0)
        goto LAB24;

LAB22:    if (*((unsigned int *)t48) == 0)
        goto LAB21;

LAB23:    t55 = (t47 + 4);
    *((unsigned int *)t47) = 1;
    *((unsigned int *)t55) = 1;

LAB24:    t57 = *((unsigned int *)t38);
    t58 = *((unsigned int *)t47);
    t59 = (t57 & t58);
    *((unsigned int *)t56) = t59;
    t60 = (t38 + 4);
    t61 = (t47 + 4);
    t62 = (t56 + 4);
    t63 = *((unsigned int *)t60);
    t64 = *((unsigned int *)t61);
    t65 = (t63 | t64);
    *((unsigned int *)t62) = t65;
    t66 = *((unsigned int *)t62);
    t67 = (t66 != 0);
    if (t67 == 1)
        goto LAB25;

LAB26:
LAB27:    t89 = (t0 + 3128U);
    t90 = *((char **)t89);
    memset(t88, 0, 8);
    t89 = (t90 + 4);
    t91 = *((unsigned int *)t89);
    t92 = (~(t91));
    t93 = *((unsigned int *)t90);
    t94 = (t93 & t92);
    t95 = (t94 & 1U);
    if (t95 != 0)
        goto LAB31;

LAB29:    if (*((unsigned int *)t89) == 0)
        goto LAB28;

LAB30:    t96 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t96) = 1;

LAB31:    t98 = *((unsigned int *)t56);
    t99 = *((unsigned int *)t88);
    t100 = (t98 & t99);
    *((unsigned int *)t97) = t100;
    t101 = (t56 + 4);
    t102 = (t88 + 4);
    t103 = (t97 + 4);
    t104 = *((unsigned int *)t101);
    t105 = *((unsigned int *)t102);
    t106 = (t104 | t105);
    *((unsigned int *)t103) = t106;
    t107 = *((unsigned int *)t103);
    t108 = (t107 != 0);
    if (t108 == 1)
        goto LAB32;

LAB33:
LAB34:    t129 = (t97 + 4);
    t130 = *((unsigned int *)t129);
    t131 = (~(t130));
    t132 = *((unsigned int *)t97);
    t133 = (t132 & t131);
    t134 = (t133 != 0);
    if (t134 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(100, ng0);

LAB39:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 4808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4808);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);

LAB37:    goto LAB15;

LAB17:    *((unsigned int *)t38) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t47) = 1;
    goto LAB24;

LAB25:    t68 = *((unsigned int *)t56);
    t69 = *((unsigned int *)t62);
    *((unsigned int *)t56) = (t68 | t69);
    t70 = (t38 + 4);
    t71 = (t47 + 4);
    t72 = *((unsigned int *)t38);
    t73 = (~(t72));
    t74 = *((unsigned int *)t70);
    t75 = (~(t74));
    t76 = *((unsigned int *)t47);
    t77 = (~(t76));
    t78 = *((unsigned int *)t71);
    t79 = (~(t78));
    t80 = (t73 & t75);
    t81 = (t77 & t79);
    t82 = (~(t80));
    t83 = (~(t81));
    t84 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t84 & t82);
    t85 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t85 & t83);
    t86 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t86 & t82);
    t87 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t87 & t83);
    goto LAB27;

LAB28:    *((unsigned int *)t88) = 1;
    goto LAB31;

LAB32:    t109 = *((unsigned int *)t97);
    t110 = *((unsigned int *)t103);
    *((unsigned int *)t97) = (t109 | t110);
    t111 = (t56 + 4);
    t112 = (t88 + 4);
    t113 = *((unsigned int *)t56);
    t114 = (~(t113));
    t115 = *((unsigned int *)t111);
    t116 = (~(t115));
    t117 = *((unsigned int *)t88);
    t118 = (~(t117));
    t119 = *((unsigned int *)t112);
    t120 = (~(t119));
    t121 = (t114 & t116);
    t122 = (t118 & t120);
    t123 = (~(t121));
    t124 = (~(t122));
    t125 = *((unsigned int *)t103);
    *((unsigned int *)t103) = (t125 & t123);
    t126 = *((unsigned int *)t103);
    *((unsigned int *)t103) = (t126 & t124);
    t127 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t127 & t123);
    t128 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t128 & t124);
    goto LAB34;

LAB35:    xsi_set_current_line(97, ng0);

LAB38:    xsi_set_current_line(98, ng0);
    t135 = ((char*)((ng1)));
    t136 = (t0 + 4808);
    xsi_vlogvar_assign_value(t136, t135, 0, 0, 1);
    goto LAB37;

LAB40:    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t13) = (t17 | t18);
    t12 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t12);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = *((unsigned int *)t19);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (~(t23));
    t29 = (~(t27));
    t30 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t30 & t28);
    t31 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t31 & t29);
    goto LAB42;

LAB43:    xsi_set_current_line(105, ng0);

LAB46:    xsi_set_current_line(107, ng0);
    t39 = ((char*)((ng1)));
    t40 = (t0 + 4808);
    xsi_vlogvar_assign_value(t40, t39, 0, 0, 1);
    goto LAB45;

LAB48:    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t13) = (t17 | t18);
    t12 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t3);
    t21 = (~(t20));
    t22 = *((unsigned int *)t12);
    t24 = (~(t22));
    t25 = *((unsigned int *)t4);
    t26 = (~(t25));
    t28 = *((unsigned int *)t19);
    t29 = (~(t28));
    t23 = (t21 & t24);
    t27 = (t26 & t29);
    t30 = (~(t23));
    t31 = (~(t27));
    t33 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t33 & t30);
    t34 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t34 & t31);
    t35 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t35 & t30);
    t36 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t36 & t31);
    goto LAB50;

LAB51:    t52 = *((unsigned int *)t38);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t38) = (t52 | t53);
    t48 = (t13 + 4);
    t49 = (t39 + 4);
    t54 = *((unsigned int *)t13);
    t57 = (~(t54));
    t58 = *((unsigned int *)t48);
    t59 = (~(t58));
    t63 = *((unsigned int *)t39);
    t64 = (~(t63));
    t65 = *((unsigned int *)t49);
    t66 = (~(t65));
    t80 = (t57 & t59);
    t81 = (t64 & t66);
    t67 = (~(t80));
    t68 = (~(t81));
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t72 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t72 & t68);
    t73 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t73 & t67);
    t74 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t74 & t68);
    goto LAB53;

LAB54:    t87 = *((unsigned int *)t56);
    t91 = *((unsigned int *)t70);
    *((unsigned int *)t56) = (t87 | t91);
    goto LAB56;

LAB59:    *((unsigned int *)t47) = 1;
    goto LAB58;

LAB61:    t110 = *((unsigned int *)t88);
    t113 = *((unsigned int *)t102);
    *((unsigned int *)t88) = (t110 | t113);
    t103 = (t38 + 4);
    t111 = (t47 + 4);
    t114 = *((unsigned int *)t38);
    t115 = (~(t114));
    t116 = *((unsigned int *)t103);
    t117 = (~(t116));
    t118 = *((unsigned int *)t47);
    t119 = (~(t118));
    t120 = *((unsigned int *)t111);
    t123 = (~(t120));
    t121 = (t115 & t117);
    t122 = (t119 & t123);
    t124 = (~(t121));
    t125 = (~(t122));
    t126 = *((unsigned int *)t102);
    *((unsigned int *)t102) = (t126 & t124);
    t127 = *((unsigned int *)t102);
    *((unsigned int *)t102) = (t127 & t125);
    t128 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t128 & t124);
    t130 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t130 & t125);
    goto LAB63;

LAB64:    xsi_set_current_line(112, ng0);

LAB67:    xsi_set_current_line(113, ng0);
    t129 = ((char*)((ng2)));
    t135 = (t0 + 4808);
    xsi_vlogvar_assign_value(t135, t129, 0, 0, 1);
    goto LAB66;

LAB68:    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t13) = (t17 | t18);
    t12 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t3);
    t21 = (~(t20));
    t22 = *((unsigned int *)t12);
    t24 = (~(t22));
    t25 = *((unsigned int *)t4);
    t26 = (~(t25));
    t28 = *((unsigned int *)t19);
    t29 = (~(t28));
    t23 = (t21 & t24);
    t27 = (t26 & t29);
    t30 = (~(t23));
    t31 = (~(t27));
    t33 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t33 & t30);
    t34 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t34 & t31);
    t35 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t35 & t30);
    t36 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t36 & t31);
    goto LAB70;

LAB71:    t52 = *((unsigned int *)t38);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t38) = (t52 | t53);
    t48 = (t13 + 4);
    t49 = (t39 + 4);
    t54 = *((unsigned int *)t13);
    t57 = (~(t54));
    t58 = *((unsigned int *)t48);
    t59 = (~(t58));
    t63 = *((unsigned int *)t39);
    t64 = (~(t63));
    t65 = *((unsigned int *)t49);
    t66 = (~(t65));
    t80 = (t57 & t59);
    t81 = (t64 & t66);
    t67 = (~(t80));
    t68 = (~(t81));
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t72 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t72 & t68);
    t73 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t73 & t67);
    t74 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t74 & t68);
    goto LAB73;

LAB74:    t87 = *((unsigned int *)t56);
    t91 = *((unsigned int *)t70);
    *((unsigned int *)t56) = (t87 | t91);
    goto LAB76;

LAB79:    *((unsigned int *)t47) = 1;
    goto LAB78;

LAB81:    t110 = *((unsigned int *)t88);
    t113 = *((unsigned int *)t102);
    *((unsigned int *)t88) = (t110 | t113);
    t103 = (t38 + 4);
    t111 = (t47 + 4);
    t114 = *((unsigned int *)t38);
    t115 = (~(t114));
    t116 = *((unsigned int *)t103);
    t117 = (~(t116));
    t118 = *((unsigned int *)t47);
    t119 = (~(t118));
    t120 = *((unsigned int *)t111);
    t123 = (~(t120));
    t121 = (t115 & t117);
    t122 = (t119 & t123);
    t124 = (~(t121));
    t125 = (~(t122));
    t126 = *((unsigned int *)t102);
    *((unsigned int *)t102) = (t126 & t124);
    t127 = *((unsigned int *)t102);
    *((unsigned int *)t102) = (t127 & t125);
    t128 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t128 & t124);
    t130 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t130 & t125);
    goto LAB83;

LAB84:    xsi_set_current_line(116, ng0);

LAB87:    xsi_set_current_line(117, ng0);
    t129 = ((char*)((ng2)));
    t135 = (t0 + 4808);
    xsi_vlogvar_assign_value(t135, t129, 0, 0, 1);
    goto LAB86;

}

static void Always_144_2(char *t0)
{
    char t11[8];
    char t40[8];
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
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;

LAB0:    t1 = (t0 + 6704U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 7800);
    *((int *)t2) = 1;
    t3 = (t0 + 6736);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(144, ng0);

LAB5:    xsi_set_current_line(146, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 5288);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 3768U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t11) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t12 = (t11 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t13 = (t9 | t10);
    *((unsigned int *)t12) = t13;
    t14 = *((unsigned int *)t12);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB10;

LAB11:
LAB12:    t32 = (t11 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 3928U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t11) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t12 = (t11 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t13 = (t9 | t10);
    *((unsigned int *)t12) = t13;
    t14 = *((unsigned int *)t12);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB17;

LAB18:
LAB19:    t32 = (t11 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1528U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t11) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t12 = (t11 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t13 = (t9 | t10);
    *((unsigned int *)t12) = t13;
    t14 = *((unsigned int *)t12);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB24;

LAB25:
LAB26:    t32 = (t11 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB27;

LAB28:
LAB29:
LAB22:
LAB15:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(148, ng0);

LAB9:    xsi_set_current_line(149, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 5288);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB8;

LAB10:    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t16 | t17);
    t18 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = *((unsigned int *)t19);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (~(t23));
    t29 = (~(t27));
    t30 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t30 & t28);
    t31 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t31 & t29);
    goto LAB12;

LAB13:    xsi_set_current_line(154, ng0);

LAB16:    xsi_set_current_line(155, ng0);
    t38 = ((char*)((ng1)));
    t39 = (t0 + 5288);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 1);
    goto LAB15;

LAB17:    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t16 | t17);
    t18 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = *((unsigned int *)t19);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (~(t23));
    t29 = (~(t27));
    t30 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t30 & t28);
    t31 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t31 & t29);
    goto LAB19;

LAB20:    xsi_set_current_line(159, ng0);

LAB23:    xsi_set_current_line(160, ng0);
    t38 = ((char*)((ng2)));
    t39 = (t0 + 5288);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 1);
    goto LAB22;

LAB24:    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t16 | t17);
    t18 = (t3 + 4);
    t19 = (t4 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = *((unsigned int *)t19);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t27 = (t26 & t25);
    t28 = (~(t23));
    t29 = (~(t27));
    t30 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t30 & t28);
    t31 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t31 & t29);
    goto LAB26;

LAB27:    xsi_set_current_line(163, ng0);

LAB30:    xsi_set_current_line(164, ng0);
    t38 = (t0 + 4808);
    t39 = (t38 + 56U);
    t41 = *((char **)t39);
    memset(t40, 0, 8);
    t42 = (t41 + 4);
    t43 = *((unsigned int *)t42);
    t44 = (~(t43));
    t45 = *((unsigned int *)t41);
    t46 = (t45 & t44);
    t47 = (t46 & 1U);
    if (t47 != 0)
        goto LAB34;

LAB32:    if (*((unsigned int *)t42) == 0)
        goto LAB31;

LAB33:    t48 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t48) = 1;

LAB34:    t49 = (t0 + 5288);
    xsi_vlogvar_assign_value(t49, t40, 0, 0, 1);
    goto LAB29;

LAB31:    *((unsigned int *)t40) = 1;
    goto LAB34;

}

static void Always_172_3(char *t0)
{
    char t13[8];
    char t22[8];
    char t60[8];
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
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    int t46;
    int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;

LAB0:    t1 = (t0 + 6952U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(172, ng0);
    t2 = (t0 + 7816);
    *((int *)t2) = 1;
    t3 = (t0 + 6984);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(172, ng0);

LAB5:    xsi_set_current_line(174, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 3448U);
    t3 = *((char **)t2);
    t2 = (t0 + 3608U);
    t4 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t4 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t2) == 0)
        goto LAB10;

LAB12:    t5 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t5) = 1;

LAB13:    t11 = (t13 + 4);
    t12 = (t4 + 4);
    t14 = *((unsigned int *)t4);
    t15 = (~(t14));
    *((unsigned int *)t13) = t15;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB15;

LAB14:    t20 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t20 & 1U);
    t21 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t21 & 1U);
    t23 = *((unsigned int *)t3);
    t24 = *((unsigned int *)t13);
    t25 = (t23 & t24);
    *((unsigned int *)t22) = t25;
    t26 = (t3 + 4);
    t27 = (t13 + 4);
    t28 = (t22 + 4);
    t29 = *((unsigned int *)t26);
    t30 = *((unsigned int *)t27);
    t31 = (t29 | t30);
    *((unsigned int *)t28) = t31;
    t32 = *((unsigned int *)t28);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB16;

LAB17:
LAB18:    t54 = (t22 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (~(t55));
    t57 = *((unsigned int *)t22);
    t58 = (t57 & t56);
    t59 = (t58 != 0);
    if (t59 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(180, ng0);

LAB29:    xsi_set_current_line(181, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB21:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(174, ng0);

LAB9:    xsi_set_current_line(175, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t13) = 1;
    goto LAB13;

LAB15:    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t12);
    *((unsigned int *)t13) = (t16 | t17);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t18 | t19);
    goto LAB14;

LAB16:    t34 = *((unsigned int *)t22);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t22) = (t34 | t35);
    t36 = (t3 + 4);
    t37 = (t13 + 4);
    t38 = *((unsigned int *)t3);
    t39 = (~(t38));
    t40 = *((unsigned int *)t36);
    t41 = (~(t40));
    t42 = *((unsigned int *)t13);
    t43 = (~(t42));
    t44 = *((unsigned int *)t37);
    t45 = (~(t44));
    t46 = (t39 & t41);
    t47 = (t43 & t45);
    t48 = (~(t46));
    t49 = (~(t47));
    t50 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t50 & t48);
    t51 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t51 & t49);
    t52 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t52 & t48);
    t53 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t53 & t49);
    goto LAB18;

LAB19:    xsi_set_current_line(177, ng0);

LAB22:    xsi_set_current_line(178, ng0);
    t61 = (t0 + 4968);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memset(t60, 0, 8);
    t64 = (t63 + 4);
    t65 = *((unsigned int *)t64);
    t66 = (~(t65));
    t67 = *((unsigned int *)t63);
    t68 = (t67 & t66);
    t69 = (t68 & 1U);
    if (t69 != 0)
        goto LAB26;

LAB24:    if (*((unsigned int *)t64) == 0)
        goto LAB23;

LAB25:    t70 = (t60 + 4);
    *((unsigned int *)t60) = 1;
    *((unsigned int *)t70) = 1;

LAB26:    t71 = (t60 + 4);
    t72 = (t63 + 4);
    t73 = *((unsigned int *)t63);
    t74 = (~(t73));
    *((unsigned int *)t60) = t74;
    *((unsigned int *)t71) = 0;
    if (*((unsigned int *)t72) != 0)
        goto LAB28;

LAB27:    t79 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t79 & 1U);
    t80 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t80 & 1U);
    t81 = (t0 + 4968);
    xsi_vlogvar_wait_assign_value(t81, t60, 0, 0, 1, 0LL);
    goto LAB21;

LAB23:    *((unsigned int *)t60) = 1;
    goto LAB26;

LAB28:    t75 = *((unsigned int *)t60);
    t76 = *((unsigned int *)t72);
    *((unsigned int *)t60) = (t75 | t76);
    t77 = *((unsigned int *)t71);
    t78 = *((unsigned int *)t72);
    *((unsigned int *)t71) = (t77 | t78);
    goto LAB27;

}

static void Always_186_4(char *t0)
{
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

LAB0:    t1 = (t0 + 7200U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 7832);
    *((int *)t2) = 1;
    t3 = (t0 + 7232);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(186, ng0);

LAB5:    xsi_set_current_line(188, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 3448U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(193, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(189, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5128);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 1);
    goto LAB8;

LAB9:    xsi_set_current_line(191, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t0 + 5128);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    goto LAB11;

}

static void Cont_197_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t5[8];
    char t23[8];
    char t42[8];
    char t88[8];
    char t109[8];
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
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    int t66;
    int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;
    char *t87;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    char *t113;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    char *t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    int t133;
    int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    char *t147;
    char *t148;
    char *t149;
    char *t150;
    unsigned int t151;
    unsigned int t152;
    char *t153;
    unsigned int t154;
    unsigned int t155;
    char *t156;
    unsigned int t157;
    unsigned int t158;
    char *t159;

LAB0:    t1 = (t0 + 7448U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(197, ng0);
    t2 = (t0 + 3608U);
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
    t24 = (t0 + 1208U);
    t25 = *((char **)t24);
    memset(t23, 0, 8);
    t24 = (t25 + 4);
    t26 = *((unsigned int *)t24);
    t27 = (~(t26));
    t28 = *((unsigned int *)t25);
    t29 = (t28 & t27);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t24) == 0)
        goto LAB10;

LAB12:    t31 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t31) = 1;

LAB13:    t32 = (t23 + 4);
    t33 = (t25 + 4);
    t34 = *((unsigned int *)t25);
    t35 = (~(t34));
    *((unsigned int *)t23) = t35;
    *((unsigned int *)t32) = 0;
    if (*((unsigned int *)t33) != 0)
        goto LAB15;

LAB14:    t40 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t40 & 1U);
    t41 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t41 & 1U);
    t43 = *((unsigned int *)t5);
    t44 = *((unsigned int *)t23);
    t45 = (t43 & t44);
    *((unsigned int *)t42) = t45;
    t46 = (t5 + 4);
    t47 = (t23 + 4);
    t48 = (t42 + 4);
    t49 = *((unsigned int *)t46);
    t50 = *((unsigned int *)t47);
    t51 = (t49 | t50);
    *((unsigned int *)t48) = t51;
    t52 = *((unsigned int *)t48);
    t53 = (t52 != 0);
    if (t53 == 1)
        goto LAB16;

LAB17:
LAB18:    memset(t4, 0, 8);
    t74 = (t42 + 4);
    t75 = *((unsigned int *)t74);
    t76 = (~(t75));
    t77 = *((unsigned int *)t42);
    t78 = (t77 & t76);
    t79 = (t78 & 1U);
    if (t79 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t74) != 0)
        goto LAB21;

LAB22:    t81 = (t4 + 4);
    t82 = *((unsigned int *)t4);
    t83 = *((unsigned int *)t81);
    t84 = (t82 || t83);
    if (t84 > 0)
        goto LAB23;

LAB24:    t141 = *((unsigned int *)t4);
    t142 = (~(t141));
    t143 = *((unsigned int *)t81);
    t144 = (t142 || t143);
    if (t144 > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t81) > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t4) > 0)
        goto LAB29;

LAB30:    memcpy(t3, t145, 8);

LAB31:    t146 = (t0 + 7992);
    t147 = (t146 + 56U);
    t148 = *((char **)t147);
    t149 = (t148 + 56U);
    t150 = *((char **)t149);
    memset(t150, 0, 8);
    t151 = 1U;
    t152 = t151;
    t153 = (t3 + 4);
    t154 = *((unsigned int *)t3);
    t151 = (t151 & t154);
    t155 = *((unsigned int *)t153);
    t152 = (t152 & t155);
    t156 = (t150 + 4);
    t157 = *((unsigned int *)t150);
    *((unsigned int *)t150) = (t157 | t151);
    t158 = *((unsigned int *)t156);
    *((unsigned int *)t156) = (t158 | t152);
    xsi_driver_vfirst_trans(t146, 0, 0);
    t159 = (t0 + 7848);
    *((int *)t159) = 1;

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

LAB10:    *((unsigned int *)t23) = 1;
    goto LAB13;

LAB15:    t36 = *((unsigned int *)t23);
    t37 = *((unsigned int *)t33);
    *((unsigned int *)t23) = (t36 | t37);
    t38 = *((unsigned int *)t32);
    t39 = *((unsigned int *)t33);
    *((unsigned int *)t32) = (t38 | t39);
    goto LAB14;

LAB16:    t54 = *((unsigned int *)t42);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t42) = (t54 | t55);
    t56 = (t5 + 4);
    t57 = (t23 + 4);
    t58 = *((unsigned int *)t5);
    t59 = (~(t58));
    t60 = *((unsigned int *)t56);
    t61 = (~(t60));
    t62 = *((unsigned int *)t23);
    t63 = (~(t62));
    t64 = *((unsigned int *)t57);
    t65 = (~(t64));
    t66 = (t59 & t61);
    t67 = (t63 & t65);
    t68 = (~(t66));
    t69 = (~(t67));
    t70 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t70 & t68);
    t71 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t71 & t69);
    t72 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t72 & t68);
    t73 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t73 & t69);
    goto LAB18;

LAB19:    *((unsigned int *)t4) = 1;
    goto LAB22;

LAB21:    t80 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t80) = 1;
    goto LAB22;

LAB23:    t85 = (t0 + 5128);
    t86 = (t85 + 56U);
    t87 = *((char **)t86);
    t89 = (t0 + 4968);
    t90 = (t89 + 56U);
    t91 = *((char **)t90);
    memset(t88, 0, 8);
    t92 = (t91 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t91);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB35;

LAB33:    if (*((unsigned int *)t92) == 0)
        goto LAB32;

LAB34:    t98 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t98) = 1;

LAB35:    t99 = (t88 + 4);
    t100 = (t91 + 4);
    t101 = *((unsigned int *)t91);
    t102 = (~(t101));
    *((unsigned int *)t88) = t102;
    *((unsigned int *)t99) = 0;
    if (*((unsigned int *)t100) != 0)
        goto LAB37;

LAB36:    t107 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t107 & 1U);
    t108 = *((unsigned int *)t99);
    *((unsigned int *)t99) = (t108 & 1U);
    t110 = *((unsigned int *)t87);
    t111 = *((unsigned int *)t88);
    t112 = (t110 & t111);
    *((unsigned int *)t109) = t112;
    t113 = (t87 + 4);
    t114 = (t88 + 4);
    t115 = (t109 + 4);
    t116 = *((unsigned int *)t113);
    t117 = *((unsigned int *)t114);
    t118 = (t116 | t117);
    *((unsigned int *)t115) = t118;
    t119 = *((unsigned int *)t115);
    t120 = (t119 != 0);
    if (t120 == 1)
        goto LAB38;

LAB39:
LAB40:    goto LAB24;

LAB25:    t145 = ((char*)((ng1)));
    goto LAB26;

LAB27:    xsi_vlog_unsigned_bit_combine(t3, 1, t109, 1, t145, 1);
    goto LAB31;

LAB29:    memcpy(t3, t109, 8);
    goto LAB31;

LAB32:    *((unsigned int *)t88) = 1;
    goto LAB35;

LAB37:    t103 = *((unsigned int *)t88);
    t104 = *((unsigned int *)t100);
    *((unsigned int *)t88) = (t103 | t104);
    t105 = *((unsigned int *)t99);
    t106 = *((unsigned int *)t100);
    *((unsigned int *)t99) = (t105 | t106);
    goto LAB36;

LAB38:    t121 = *((unsigned int *)t109);
    t122 = *((unsigned int *)t115);
    *((unsigned int *)t109) = (t121 | t122);
    t123 = (t87 + 4);
    t124 = (t88 + 4);
    t125 = *((unsigned int *)t87);
    t126 = (~(t125));
    t127 = *((unsigned int *)t123);
    t128 = (~(t127));
    t129 = *((unsigned int *)t88);
    t130 = (~(t129));
    t131 = *((unsigned int *)t124);
    t132 = (~(t131));
    t133 = (t126 & t128);
    t134 = (t130 & t132);
    t135 = (~(t133));
    t136 = (~(t134));
    t137 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t137 & t135);
    t138 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t138 & t136);
    t139 = *((unsigned int *)t109);
    *((unsigned int *)t109) = (t139 & t135);
    t140 = *((unsigned int *)t109);
    *((unsigned int *)t109) = (t140 & t136);
    goto LAB40;

}


extern void work_m_00000000000221183893_0410433708_init()
{
	static char *pe[] = {(void *)Cont_80_0,(void *)Always_84_1,(void *)Always_144_2,(void *)Always_172_3,(void *)Always_186_4,(void *)Cont_197_5};
	xsi_register_didat("work_m_00000000000221183893_0410433708", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000000221183893_0410433708.didat");
	xsi_register_executes(pe);
}
