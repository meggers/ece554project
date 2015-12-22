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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/CPU/IDEX_reg.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {0U, 31U};



static void Always_130_0(char *t0)
{
    char t13[8];
    char t14[8];
    char t20[8];
    char t52[8];
    char t61[8];
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
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    int t44;
    int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    int t85;
    int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;

LAB0:    t1 = (t0 + 10528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 10848);
    *((int *)t2) = 1;
    t3 = (t0 + 10560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(130, ng0);

LAB5:    xsi_set_current_line(132, ng0);
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

LAB7:    xsi_set_current_line(161, ng0);
    t2 = (t0 + 3128U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t2) == 0)
        goto LAB10;

LAB12:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;

LAB13:    t5 = (t0 + 3288U);
    t11 = *((char **)t5);
    memset(t14, 0, 8);
    t5 = (t11 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    t17 = *((unsigned int *)t11);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB17;

LAB15:    if (*((unsigned int *)t5) == 0)
        goto LAB14;

LAB16:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;

LAB17:    t21 = *((unsigned int *)t13);
    t22 = *((unsigned int *)t14);
    t23 = (t21 & t22);
    *((unsigned int *)t20) = t23;
    t24 = (t13 + 4);
    t25 = (t14 + 4);
    t26 = (t20 + 4);
    t27 = *((unsigned int *)t24);
    t28 = *((unsigned int *)t25);
    t29 = (t27 | t28);
    *((unsigned int *)t26) = t29;
    t30 = *((unsigned int *)t26);
    t31 = (t30 != 0);
    if (t31 == 1)
        goto LAB18;

LAB19:
LAB20:    t53 = (t0 + 3448U);
    t54 = *((char **)t53);
    memset(t52, 0, 8);
    t53 = (t54 + 4);
    t55 = *((unsigned int *)t53);
    t56 = (~(t55));
    t57 = *((unsigned int *)t54);
    t58 = (t57 & t56);
    t59 = (t58 & 1U);
    if (t59 != 0)
        goto LAB24;

LAB22:    if (*((unsigned int *)t53) == 0)
        goto LAB21;

LAB23:    t60 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t60) = 1;

LAB24:    t62 = *((unsigned int *)t20);
    t63 = *((unsigned int *)t52);
    t64 = (t62 & t63);
    *((unsigned int *)t61) = t64;
    t65 = (t20 + 4);
    t66 = (t52 + 4);
    t67 = (t61 + 4);
    t68 = *((unsigned int *)t65);
    t69 = *((unsigned int *)t66);
    t70 = (t68 | t69);
    *((unsigned int *)t67) = t70;
    t71 = *((unsigned int *)t67);
    t72 = (t71 != 0);
    if (t72 == 1)
        goto LAB25;

LAB26:
LAB27:    t93 = (t61 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t61);
    t97 = (t96 & t95);
    t98 = (t97 != 0);
    if (t98 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(190, ng0);

LAB41:    xsi_set_current_line(193, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(194, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(195, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(196, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(197, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(200, ng0);
    t2 = (t0 + 3288U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(203, ng0);
    t2 = (t0 + 3928U);
    t3 = *((char **)t2);
    t2 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);

LAB44:    xsi_set_current_line(205, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(206, ng0);
    t2 = (t0 + 3608U);
    t3 = *((char **)t2);
    t2 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 3768U);
    t3 = *((char **)t2);
    t2 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(208, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(209, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 5528U);
    t4 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t4 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB48;

LAB46:    if (*((unsigned int *)t2) == 0)
        goto LAB45;

LAB47:    t5 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t5) = 1;

LAB48:    t11 = (t13 + 4);
    t12 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = (~(t15));
    *((unsigned int *)t13) = t16;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB50;

LAB49:    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t23 & 1U);
    t27 = *((unsigned int *)t3);
    t28 = *((unsigned int *)t13);
    t29 = (t27 & t28);
    *((unsigned int *)t14) = t29;
    t24 = (t3 + 4);
    t25 = (t13 + 4);
    t26 = (t14 + 4);
    t30 = *((unsigned int *)t24);
    t31 = *((unsigned int *)t25);
    t32 = (t30 | t31);
    *((unsigned int *)t26) = t32;
    t33 = *((unsigned int *)t26);
    t36 = (t33 != 0);
    if (t36 == 1)
        goto LAB51;

LAB52:
LAB53:    t53 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t53, t14, 0, 0, 1, 0LL);
    xsi_set_current_line(210, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 4088U);
    t3 = *((char **)t2);
    t2 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(212, ng0);
    t2 = (t0 + 4248U);
    t3 = *((char **)t2);
    t2 = (t0 + 8328);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(213, ng0);
    t2 = (t0 + 4408U);
    t3 = *((char **)t2);
    t2 = (t0 + 8488);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(214, ng0);
    t2 = (t0 + 4568U);
    t3 = *((char **)t2);
    t2 = (t0 + 8648);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 4728U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 4888U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 5048U);
    t3 = *((char **)t2);
    t2 = (t0 + 9128);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 5208U);
    t3 = *((char **)t2);
    t2 = (t0 + 9288);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(219, ng0);
    t2 = (t0 + 5368U);
    t3 = *((char **)t2);
    t2 = (t0 + 9448);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(220, ng0);
    t2 = (t0 + 3448U);
    t3 = *((char **)t2);
    t2 = (t0 + 9608);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(221, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);

LAB30:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(132, ng0);

LAB9:    xsi_set_current_line(134, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8648);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(151, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8808);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8968);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t13) = 1;
    goto LAB13;

LAB14:    *((unsigned int *)t14) = 1;
    goto LAB17;

LAB18:    t32 = *((unsigned int *)t20);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t20) = (t32 | t33);
    t34 = (t13 + 4);
    t35 = (t14 + 4);
    t36 = *((unsigned int *)t13);
    t37 = (~(t36));
    t38 = *((unsigned int *)t34);
    t39 = (~(t38));
    t40 = *((unsigned int *)t14);
    t41 = (~(t40));
    t42 = *((unsigned int *)t35);
    t43 = (~(t42));
    t44 = (t37 & t39);
    t45 = (t41 & t43);
    t46 = (~(t44));
    t47 = (~(t45));
    t48 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t48 & t46);
    t49 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t49 & t47);
    t50 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t50 & t46);
    t51 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t51 & t47);
    goto LAB20;

LAB21:    *((unsigned int *)t52) = 1;
    goto LAB24;

LAB25:    t73 = *((unsigned int *)t61);
    t74 = *((unsigned int *)t67);
    *((unsigned int *)t61) = (t73 | t74);
    t75 = (t20 + 4);
    t76 = (t52 + 4);
    t77 = *((unsigned int *)t20);
    t78 = (~(t77));
    t79 = *((unsigned int *)t75);
    t80 = (~(t79));
    t81 = *((unsigned int *)t52);
    t82 = (~(t81));
    t83 = *((unsigned int *)t76);
    t84 = (~(t83));
    t85 = (t78 & t80);
    t86 = (t82 & t84);
    t87 = (~(t85));
    t88 = (~(t86));
    t89 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t89 & t87);
    t90 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t90 & t88);
    t91 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t91 & t87);
    t92 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t92 & t88);
    goto LAB27;

LAB28:    xsi_set_current_line(161, ng0);

LAB31:    xsi_set_current_line(163, ng0);
    t99 = (t0 + 2008U);
    t100 = *((char **)t99);
    t99 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t99, t100, 0, 0, 1, 0LL);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 6728);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t0 + 6888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(166, ng0);
    t2 = (t0 + 2488U);
    t3 = *((char **)t2);
    t2 = (t0 + 7048);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(167, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 7208);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    t2 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 3928U);
    t3 = *((char **)t2);
    t2 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 5928);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 3608U);
    t3 = *((char **)t2);
    t2 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(172, ng0);
    t2 = (t0 + 3768U);
    t3 = *((char **)t2);
    t2 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 6088);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(174, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 5528U);
    t4 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t4 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB35;

LAB33:    if (*((unsigned int *)t2) == 0)
        goto LAB32;

LAB34:    t5 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t5) = 1;

LAB35:    t11 = (t13 + 4);
    t12 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = (~(t15));
    *((unsigned int *)t13) = t16;
    *((unsigned int *)t11) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB37;

LAB36:    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t23 & 1U);
    t27 = *((unsigned int *)t3);
    t28 = *((unsigned int *)t13);
    t29 = (t27 & t28);
    *((unsigned int *)t14) = t29;
    t24 = (t3 + 4);
    t25 = (t13 + 4);
    t26 = (t14 + 4);
    t30 = *((unsigned int *)t24);
    t31 = *((unsigned int *)t25);
    t32 = (t30 | t31);
    *((unsigned int *)t26) = t32;
    t33 = *((unsigned int *)t26);
    t36 = (t33 != 0);
    if (t36 == 1)
        goto LAB38;

LAB39:
LAB40:    t53 = (t0 + 6248);
    xsi_vlogvar_wait_assign_value(t53, t14, 0, 0, 1, 0LL);
    xsi_set_current_line(175, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(176, ng0);
    t2 = (t0 + 4088U);
    t3 = *((char **)t2);
    t2 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = (t0 + 4248U);
    t3 = *((char **)t2);
    t2 = (t0 + 8328);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(178, ng0);
    t2 = (t0 + 4408U);
    t3 = *((char **)t2);
    t2 = (t0 + 8488);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 4568U);
    t3 = *((char **)t2);
    t2 = (t0 + 8648);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 4728U);
    t3 = *((char **)t2);
    t2 = (t0 + 8808);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 4888U);
    t3 = *((char **)t2);
    t2 = (t0 + 8968);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(182, ng0);
    t2 = (t0 + 5048U);
    t3 = *((char **)t2);
    t2 = (t0 + 9128);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(183, ng0);
    t2 = (t0 + 5208U);
    t3 = *((char **)t2);
    t2 = (t0 + 9288);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(184, ng0);
    t2 = (t0 + 5368U);
    t3 = *((char **)t2);
    t2 = (t0 + 9448);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(185, ng0);
    t2 = (t0 + 3448U);
    t3 = *((char **)t2);
    t2 = (t0 + 9608);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(186, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB30;

LAB32:    *((unsigned int *)t13) = 1;
    goto LAB35;

LAB37:    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t12);
    *((unsigned int *)t13) = (t17 | t18);
    t19 = *((unsigned int *)t11);
    t21 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t19 | t21);
    goto LAB36;

LAB38:    t37 = *((unsigned int *)t14);
    t38 = *((unsigned int *)t26);
    *((unsigned int *)t14) = (t37 | t38);
    t34 = (t3 + 4);
    t35 = (t13 + 4);
    t39 = *((unsigned int *)t3);
    t40 = (~(t39));
    t41 = *((unsigned int *)t34);
    t42 = (~(t41));
    t43 = *((unsigned int *)t13);
    t46 = (~(t43));
    t47 = *((unsigned int *)t35);
    t48 = (~(t47));
    t44 = (t40 & t42);
    t45 = (t46 & t48);
    t49 = (~(t44));
    t50 = (~(t45));
    t51 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t51 & t49);
    t55 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t55 & t50);
    t56 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t56 & t49);
    t57 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t57 & t50);
    goto LAB40;

LAB42:    xsi_set_current_line(201, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 5, 0LL);
    goto LAB44;

LAB45:    *((unsigned int *)t13) = 1;
    goto LAB48;

LAB50:    t17 = *((unsigned int *)t13);
    t18 = *((unsigned int *)t12);
    *((unsigned int *)t13) = (t17 | t18);
    t19 = *((unsigned int *)t11);
    t21 = *((unsigned int *)t12);
    *((unsigned int *)t11) = (t19 | t21);
    goto LAB49;

LAB51:    t37 = *((unsigned int *)t14);
    t38 = *((unsigned int *)t26);
    *((unsigned int *)t14) = (t37 | t38);
    t34 = (t3 + 4);
    t35 = (t13 + 4);
    t39 = *((unsigned int *)t3);
    t40 = (~(t39));
    t41 = *((unsigned int *)t34);
    t42 = (~(t41));
    t43 = *((unsigned int *)t13);
    t46 = (~(t43));
    t47 = *((unsigned int *)t35);
    t48 = (~(t47));
    t44 = (t40 & t42);
    t45 = (t46 & t48);
    t49 = (~(t44));
    t50 = (~(t45));
    t51 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t51 & t49);
    t55 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t55 & t50);
    t56 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t56 & t49);
    t57 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t57 & t50);
    goto LAB53;

}


extern void work_m_00000000000341490802_0230835231_init()
{
	static char *pe[] = {(void *)Always_130_0};
	xsi_register_didat("work_m_00000000000341490802_0230835231", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000000341490802_0230835231.didat");
	xsi_register_executes(pe);
}
