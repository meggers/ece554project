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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/CPU/Trap_Handler.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {7U, 0U};



static void Cont_91_0(char *t0)
{
    char t5[8];
    char t34[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
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
    char *t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;

LAB0:    t1 = (t0 + 8280U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2480U);
    t3 = *((char **)t2);
    t2 = (t0 + 2640U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 | t7);
    *((unsigned int *)t5) = t8;
    t2 = (t3 + 4);
    t9 = (t4 + 4);
    t10 = (t5 + 4);
    t11 = *((unsigned int *)t2);
    t12 = *((unsigned int *)t9);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 != 0);
    if (t15 == 1)
        goto LAB4;

LAB5:
LAB6:    t32 = (t0 + 2320U);
    t33 = *((char **)t32);
    t35 = *((unsigned int *)t5);
    t36 = *((unsigned int *)t33);
    t37 = (t35 | t36);
    *((unsigned int *)t34) = t37;
    t32 = (t5 + 4);
    t38 = (t33 + 4);
    t39 = (t34 + 4);
    t40 = *((unsigned int *)t32);
    t41 = *((unsigned int *)t38);
    t42 = (t40 | t41);
    *((unsigned int *)t39) = t42;
    t43 = *((unsigned int *)t39);
    t44 = (t43 != 0);
    if (t44 == 1)
        goto LAB7;

LAB8:
LAB9:    t61 = (t0 + 10792);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    t64 = (t63 + 56U);
    t65 = *((char **)t64);
    memset(t65, 0, 8);
    t66 = 1U;
    t67 = t66;
    t68 = (t34 + 4);
    t69 = *((unsigned int *)t34);
    t66 = (t66 & t69);
    t70 = *((unsigned int *)t68);
    t67 = (t67 & t70);
    t71 = (t65 + 4);
    t72 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t72 | t66);
    t73 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t73 | t67);
    xsi_driver_vfirst_trans(t61, 0, 0);
    t74 = (t0 + 10584);
    *((int *)t74) = 1;

LAB1:    return;
LAB4:    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t5) = (t16 | t17);
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
    t30 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t30 & t28);
    t31 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t31 & t29);
    goto LAB6;

LAB7:    t45 = *((unsigned int *)t34);
    t46 = *((unsigned int *)t39);
    *((unsigned int *)t34) = (t45 | t46);
    t47 = (t5 + 4);
    t48 = (t33 + 4);
    t49 = *((unsigned int *)t47);
    t50 = (~(t49));
    t51 = *((unsigned int *)t5);
    t52 = (t51 & t50);
    t53 = *((unsigned int *)t48);
    t54 = (~(t53));
    t55 = *((unsigned int *)t33);
    t56 = (t55 & t54);
    t57 = (~(t52));
    t58 = (~(t56));
    t59 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t59 & t57);
    t60 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t60 & t58);
    goto LAB9;

}

static void Always_94_1(char *t0)
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

LAB0:    t1 = (t0 + 8528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 10600);
    *((int *)t2) = 1;
    t3 = (t0 + 8560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(94, ng0);

LAB5:    xsi_set_current_line(95, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 5920);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5760);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(96, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5760);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    goto LAB8;

}

static void Always_102_2(char *t0)
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

LAB0:    t1 = (t0 + 8776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 10616);
    *((int *)t2) = 1;
    t3 = (t0 + 8808);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(102, ng0);

LAB5:    xsi_set_current_line(103, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 2800U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 4000);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);

LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(104, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(106, ng0);
    t4 = (t0 + 3280U);
    t5 = *((char **)t4);
    t4 = (t0 + 4000);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 8, 0LL);
    goto LAB11;

}

static void Always_112_3(char *t0)
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

LAB0:    t1 = (t0 + 9024U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 10632);
    *((int *)t2) = 1;
    t3 = (t0 + 9056);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(112, ng0);

LAB5:    xsi_set_current_line(113, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 7200);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:
LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(114, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4160);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(116, ng0);
    t11 = (t0 + 3440U);
    t12 = *((char **)t11);
    t11 = (t0 + 4160);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 32, 0LL);
    goto LAB11;

}

static void Always_120_4(char *t0)
{
    char t13[8];
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

LAB0:    t1 = (t0 + 9272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 10648);
    *((int *)t2) = 1;
    t3 = (t0 + 9304);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(120, ng0);

LAB5:    xsi_set_current_line(121, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 7360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 2, t5, 32);
    t11 = (t0 + 5600);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 2, 0LL);

LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(122, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5600);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(124, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 5600);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB11;

}

static void Always_135_5(char *t0)
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

LAB0:    t1 = (t0 + 9520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 10664);
    *((int *)t2) = 1;
    t3 = (t0 + 9552);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(135, ng0);

LAB5:    xsi_set_current_line(136, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 2800U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 6880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 6400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6400);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB14:
LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(137, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6400);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(139, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 6400);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB11;

LAB12:    xsi_set_current_line(141, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6400);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB14;

}

static void Always_147_6(char *t0)
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

LAB0:    t1 = (t0 + 9768U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 10680);
    *((int *)t2) = 1;
    t3 = (t0 + 9800);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(147, ng0);

LAB5:    xsi_set_current_line(148, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 3120U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(152, ng0);
    t2 = (t0 + 6720);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 6240);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6240);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB14:
LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(149, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6240);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(151, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 6240);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB11;

LAB12:    xsi_set_current_line(153, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6240);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB14;

}

static void Always_159_7(char *t0)
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

LAB0:    t1 = (t0 + 10016U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 10696);
    *((int *)t2) = 1;
    t3 = (t0 + 10048);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(159, ng0);

LAB5:    xsi_set_current_line(160, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 2960U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 6560);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 6080);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6080);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB14:
LAB11:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(161, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6080);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB8;

LAB9:    xsi_set_current_line(163, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 6080);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB11;

LAB12:    xsi_set_current_line(165, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 6080);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB14;

}

static void Always_170_8(char *t0)
{
    char t9[8];
    char t45[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
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
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;

LAB0:    t1 = (t0 + 10264U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(170, ng0);
    t2 = (t0 + 10712);
    *((int *)t2) = 1;
    t3 = (t0 + 10296);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(170, ng0);

LAB5:    xsi_set_current_line(172, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 5120);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(173, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5280);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5440);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7040);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(179, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(180, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4640);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(181, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4800);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(182, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4960);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(183, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6560);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(184, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6880);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(185, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6720);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 5760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t5, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(188, ng0);

LAB22:    xsi_set_current_line(189, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 5120);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    xsi_set_current_line(190, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5280);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(191, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5440);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(193, ng0);
    t2 = (t0 + 2800U);
    t3 = *((char **)t2);
    t2 = (t0 + 3600U);
    t5 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t5);
    t12 = (t10 & t11);
    *((unsigned int *)t9) = t12;
    t2 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = (t9 + 4);
    t13 = *((unsigned int *)t2);
    t14 = *((unsigned int *)t7);
    t15 = (t13 | t14);
    *((unsigned int *)t8) = t15;
    t16 = *((unsigned int *)t8);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB23;

LAB24:
LAB25:    t37 = (t9 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t9);
    t41 = (t40 & t39);
    t42 = (t41 != 0);
    if (t42 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 2800U);
    t3 = *((char **)t2);
    t2 = (t0 + 3600U);
    t5 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t5 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB33;

LAB31:    if (*((unsigned int *)t2) == 0)
        goto LAB30;

LAB32:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB33:    t8 = (t9 + 4);
    t20 = (t5 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    *((unsigned int *)t9) = t16;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t20) != 0)
        goto LAB35;

LAB34:    t23 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t23 & 1U);
    t24 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t24 & 1U);
    t25 = *((unsigned int *)t3);
    t26 = *((unsigned int *)t9);
    t27 = (t25 & t26);
    *((unsigned int *)t45) = t27;
    t21 = (t3 + 4);
    t37 = (t9 + 4);
    t43 = (t45 + 4);
    t28 = *((unsigned int *)t21);
    t29 = *((unsigned int *)t37);
    t31 = (t28 | t29);
    *((unsigned int *)t43) = t31;
    t32 = *((unsigned int *)t43);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB36;

LAB37:
LAB38:    t55 = (t45 + 4);
    t56 = *((unsigned int *)t55);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(207, ng0);
    t2 = (t0 + 2960U);
    t3 = *((char **)t2);
    t2 = (t0 + 3600U);
    t5 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t5);
    t12 = (t10 & t11);
    *((unsigned int *)t9) = t12;
    t2 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = (t9 + 4);
    t13 = *((unsigned int *)t2);
    t14 = *((unsigned int *)t7);
    t15 = (t13 | t14);
    *((unsigned int *)t8) = t15;
    t16 = *((unsigned int *)t8);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB43;

LAB44:
LAB45:    t37 = (t9 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t9);
    t41 = (t40 & t39);
    t42 = (t41 != 0);
    if (t42 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 2960U);
    t3 = *((char **)t2);
    t2 = (t0 + 3600U);
    t5 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t5 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB53;

LAB51:    if (*((unsigned int *)t2) == 0)
        goto LAB50;

LAB52:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB53:    t8 = (t9 + 4);
    t20 = (t5 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    *((unsigned int *)t9) = t16;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t20) != 0)
        goto LAB55;

LAB54:    t23 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t23 & 1U);
    t24 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t24 & 1U);
    t25 = *((unsigned int *)t3);
    t26 = *((unsigned int *)t9);
    t27 = (t25 & t26);
    *((unsigned int *)t45) = t27;
    t21 = (t3 + 4);
    t37 = (t9 + 4);
    t43 = (t45 + 4);
    t28 = *((unsigned int *)t21);
    t29 = *((unsigned int *)t37);
    t31 = (t28 | t29);
    *((unsigned int *)t43) = t31;
    t32 = *((unsigned int *)t43);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB56;

LAB57:
LAB58:    t55 = (t45 + 4);
    t56 = *((unsigned int *)t55);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB59;

LAB60:    xsi_set_current_line(218, ng0);
    t2 = (t0 + 3120U);
    t3 = *((char **)t2);
    t2 = (t0 + 3600U);
    t5 = *((char **)t2);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t5);
    t12 = (t10 & t11);
    *((unsigned int *)t9) = t12;
    t2 = (t3 + 4);
    t7 = (t5 + 4);
    t8 = (t9 + 4);
    t13 = *((unsigned int *)t2);
    t14 = *((unsigned int *)t7);
    t15 = (t13 | t14);
    *((unsigned int *)t8) = t15;
    t16 = *((unsigned int *)t8);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB63;

LAB64:
LAB65:    t37 = (t9 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t9);
    t41 = (t40 & t39);
    t42 = (t41 != 0);
    if (t42 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 3120U);
    t3 = *((char **)t2);
    t2 = (t0 + 3600U);
    t5 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t5 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB73;

LAB71:    if (*((unsigned int *)t2) == 0)
        goto LAB70;

LAB72:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB73:    t8 = (t9 + 4);
    t20 = (t5 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    *((unsigned int *)t9) = t16;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t20) != 0)
        goto LAB75;

LAB74:    t23 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t23 & 1U);
    t24 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t24 & 1U);
    t25 = *((unsigned int *)t3);
    t26 = *((unsigned int *)t9);
    t27 = (t25 & t26);
    *((unsigned int *)t45) = t27;
    t21 = (t3 + 4);
    t37 = (t9 + 4);
    t43 = (t45 + 4);
    t28 = *((unsigned int *)t21);
    t29 = *((unsigned int *)t37);
    t31 = (t28 | t29);
    *((unsigned int *)t43) = t31;
    t32 = *((unsigned int *)t43);
    t33 = (t32 != 0);
    if (t33 == 1)
        goto LAB76;

LAB77:
LAB78:    t55 = (t45 + 4);
    t56 = *((unsigned int *)t55);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (t58 & t57);
    t60 = (t59 != 0);
    if (t60 > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(228, ng0);

LAB83:    xsi_set_current_line(229, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB81:
LAB68:
LAB61:
LAB48:
LAB41:
LAB28:    goto LAB21;

LAB9:    xsi_set_current_line(233, ng0);

LAB84:    xsi_set_current_line(234, ng0);
    t3 = ((char*)((ng3)));
    t5 = (t0 + 7200);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(235, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5280);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(236, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5440);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(237, ng0);
    t2 = (t0 + 3600U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(240, ng0);

LAB89:    xsi_set_current_line(241, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(242, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB87:    goto LAB21;

LAB11:    xsi_set_current_line(247, ng0);

LAB90:    xsi_set_current_line(248, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5280);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(249, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5440);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(250, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t9, 0, 8);
    t7 = (t9 + 4);
    t8 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 1);
    t12 = (t11 & 1);
    *((unsigned int *)t9) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t7) = t15;
    t20 = (t9 + 4);
    t16 = *((unsigned int *)t20);
    t17 = (~(t16));
    t18 = *((unsigned int *)t9);
    t19 = (t18 & t17);
    t22 = (t19 != 0);
    if (t22 > 0)
        goto LAB91;

LAB92:    xsi_set_current_line(255, ng0);

LAB95:    xsi_set_current_line(256, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t45, 0, 8);
    t7 = (t45 + 4);
    t8 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t45) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t7) = t15;
    memset(t9, 0, 8);
    t20 = (t45 + 4);
    t16 = *((unsigned int *)t20);
    t17 = (~(t16));
    t18 = *((unsigned int *)t45);
    t19 = (t18 & t17);
    t22 = (t19 & 1U);
    if (t22 != 0)
        goto LAB99;

LAB97:    if (*((unsigned int *)t20) == 0)
        goto LAB96;

LAB98:    t21 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t21) = 1;

LAB99:    t37 = (t9 + 4);
    t43 = (t45 + 4);
    t23 = *((unsigned int *)t45);
    t24 = (~(t23));
    *((unsigned int *)t9) = t24;
    *((unsigned int *)t37) = 0;
    if (*((unsigned int *)t43) != 0)
        goto LAB101;

LAB100:    t29 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t29 & 1U);
    t31 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t31 & 1U);
    t44 = (t0 + 4320);
    xsi_vlogvar_assign_value(t44, t9, 0, 0, 1);
    xsi_set_current_line(257, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t9, 0, 8);
    t7 = (t9 + 4);
    t8 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t9) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t7) = t15;
    t20 = (t0 + 4480);
    xsi_vlogvar_assign_value(t20, t9, 0, 0, 1);
    xsi_set_current_line(258, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB93:    goto LAB21;

LAB13:    xsi_set_current_line(262, ng0);

LAB102:    xsi_set_current_line(263, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5120);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(264, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5440);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(265, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(266, ng0);
    t2 = (t0 + 3600U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB103;

LAB104:    xsi_set_current_line(269, ng0);

LAB107:    xsi_set_current_line(270, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(271, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB105:    goto LAB21;

LAB15:    xsi_set_current_line(275, ng0);

LAB108:    xsi_set_current_line(276, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5440);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(277, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5120);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(278, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t9, 0, 8);
    t7 = (t9 + 4);
    t8 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t9) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t7) = t15;
    t20 = (t9 + 4);
    t16 = *((unsigned int *)t20);
    t17 = (~(t16));
    t18 = *((unsigned int *)t9);
    t19 = (t18 & t17);
    t22 = (t19 != 0);
    if (t22 > 0)
        goto LAB109;

LAB110:    xsi_set_current_line(283, ng0);

LAB113:    xsi_set_current_line(284, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t45, 0, 8);
    t7 = (t45 + 4);
    t8 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t45) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t7) = t15;
    memset(t9, 0, 8);
    t20 = (t45 + 4);
    t16 = *((unsigned int *)t20);
    t17 = (~(t16));
    t18 = *((unsigned int *)t45);
    t19 = (t18 & t17);
    t22 = (t19 & 1U);
    if (t22 != 0)
        goto LAB117;

LAB115:    if (*((unsigned int *)t20) == 0)
        goto LAB114;

LAB116:    t21 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t21) = 1;

LAB117:    t37 = (t9 + 4);
    t43 = (t45 + 4);
    t23 = *((unsigned int *)t45);
    t24 = (~(t23));
    *((unsigned int *)t9) = t24;
    *((unsigned int *)t37) = 0;
    if (*((unsigned int *)t43) != 0)
        goto LAB119;

LAB118:    t29 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t29 & 1U);
    t31 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t31 & 1U);
    t44 = (t0 + 4480);
    xsi_vlogvar_assign_value(t44, t9, 0, 0, 1);
    xsi_set_current_line(285, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB111:    goto LAB21;

LAB17:    xsi_set_current_line(289, ng0);

LAB120:    xsi_set_current_line(290, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5120);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(291, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5280);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(292, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(293, ng0);
    t2 = (t0 + 3600U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t10 = *((unsigned int *)t2);
    t11 = (~(t10));
    t12 = *((unsigned int *)t3);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB121;

LAB122:    xsi_set_current_line(296, ng0);

LAB125:    xsi_set_current_line(297, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(298, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB123:    goto LAB21;

LAB19:    xsi_set_current_line(302, ng0);

LAB126:    xsi_set_current_line(303, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 5120);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    xsi_set_current_line(304, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5280);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(305, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t9, 0, 8);
    t7 = (t9 + 4);
    t8 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t9) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t7) = t15;
    t20 = (t9 + 4);
    t16 = *((unsigned int *)t20);
    t17 = (~(t16));
    t18 = *((unsigned int *)t9);
    t19 = (t18 & t17);
    t22 = (t19 != 0);
    if (t22 > 0)
        goto LAB127;

LAB128:    xsi_set_current_line(310, ng0);

LAB131:    xsi_set_current_line(311, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(312, ng0);
    t2 = (t0 + 5600);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t45, 0, 8);
    t7 = (t45 + 4);
    t8 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t45) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t7) = t15;
    memset(t9, 0, 8);
    t20 = (t45 + 4);
    t16 = *((unsigned int *)t20);
    t17 = (~(t16));
    t18 = *((unsigned int *)t45);
    t19 = (t18 & t17);
    t22 = (t19 & 1U);
    if (t22 != 0)
        goto LAB135;

LAB133:    if (*((unsigned int *)t20) == 0)
        goto LAB132;

LAB134:    t21 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t21) = 1;

LAB135:    t37 = (t9 + 4);
    t43 = (t45 + 4);
    t23 = *((unsigned int *)t45);
    t24 = (~(t23));
    *((unsigned int *)t9) = t24;
    *((unsigned int *)t37) = 0;
    if (*((unsigned int *)t43) != 0)
        goto LAB137;

LAB136:    t29 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t29 & 1U);
    t31 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t31 & 1U);
    t44 = (t0 + 4480);
    xsi_vlogvar_assign_value(t44, t9, 0, 0, 1);

LAB129:    goto LAB21;

LAB23:    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t18 | t19);
    t20 = (t3 + 4);
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t6 = (t23 & t25);
    t30 = (t27 & t29);
    t31 = (~(t6));
    t32 = (~(t30));
    t33 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t33 & t31);
    t34 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t34 & t32);
    t35 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t35 & t31);
    t36 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t36 & t32);
    goto LAB25;

LAB26:    xsi_set_current_line(193, ng0);

LAB29:    xsi_set_current_line(194, ng0);
    t43 = ((char*)((ng3)));
    t44 = (t0 + 7040);
    xsi_vlogvar_assign_value(t44, t43, 0, 0, 1);
    xsi_set_current_line(195, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(196, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5120);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB28;

LAB30:    *((unsigned int *)t9) = 1;
    goto LAB33;

LAB35:    t17 = *((unsigned int *)t9);
    t18 = *((unsigned int *)t20);
    *((unsigned int *)t9) = (t17 | t18);
    t19 = *((unsigned int *)t8);
    t22 = *((unsigned int *)t20);
    *((unsigned int *)t8) = (t19 | t22);
    goto LAB34;

LAB36:    t34 = *((unsigned int *)t45);
    t35 = *((unsigned int *)t43);
    *((unsigned int *)t45) = (t34 | t35);
    t44 = (t3 + 4);
    t46 = (t9 + 4);
    t36 = *((unsigned int *)t3);
    t38 = (~(t36));
    t39 = *((unsigned int *)t44);
    t40 = (~(t39));
    t41 = *((unsigned int *)t9);
    t42 = (~(t41));
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t6 = (t38 & t40);
    t30 = (t42 & t48);
    t49 = (~(t6));
    t50 = (~(t30));
    t51 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t51 & t49);
    t52 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t52 & t50);
    t53 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t53 & t49);
    t54 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t54 & t50);
    goto LAB38;

LAB39:    xsi_set_current_line(198, ng0);

LAB42:    xsi_set_current_line(199, ng0);
    t61 = ((char*)((ng3)));
    t62 = (t0 + 7040);
    xsi_vlogvar_assign_value(t62, t61, 0, 0, 1);
    xsi_set_current_line(200, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(201, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(202, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5120);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(203, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB41;

LAB43:    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t18 | t19);
    t20 = (t3 + 4);
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t6 = (t23 & t25);
    t30 = (t27 & t29);
    t31 = (~(t6));
    t32 = (~(t30));
    t33 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t33 & t31);
    t34 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t34 & t32);
    t35 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t35 & t31);
    t36 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t36 & t32);
    goto LAB45;

LAB46:    xsi_set_current_line(207, ng0);

LAB49:    xsi_set_current_line(208, ng0);
    t43 = ((char*)((ng3)));
    t44 = (t0 + 5280);
    xsi_vlogvar_assign_value(t44, t43, 0, 0, 1);
    xsi_set_current_line(209, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB48;

LAB50:    *((unsigned int *)t9) = 1;
    goto LAB53;

LAB55:    t17 = *((unsigned int *)t9);
    t18 = *((unsigned int *)t20);
    *((unsigned int *)t9) = (t17 | t18);
    t19 = *((unsigned int *)t8);
    t22 = *((unsigned int *)t20);
    *((unsigned int *)t8) = (t19 | t22);
    goto LAB54;

LAB56:    t34 = *((unsigned int *)t45);
    t35 = *((unsigned int *)t43);
    *((unsigned int *)t45) = (t34 | t35);
    t44 = (t3 + 4);
    t46 = (t9 + 4);
    t36 = *((unsigned int *)t3);
    t38 = (~(t36));
    t39 = *((unsigned int *)t44);
    t40 = (~(t39));
    t41 = *((unsigned int *)t9);
    t42 = (~(t41));
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t6 = (t38 & t40);
    t30 = (t42 & t48);
    t49 = (~(t6));
    t50 = (~(t30));
    t51 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t51 & t49);
    t52 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t52 & t50);
    t53 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t53 & t49);
    t54 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t54 & t50);
    goto LAB58;

LAB59:    xsi_set_current_line(211, ng0);

LAB62:    xsi_set_current_line(212, ng0);
    t61 = ((char*)((ng3)));
    t62 = (t0 + 7200);
    xsi_vlogvar_assign_value(t62, t61, 0, 0, 1);
    xsi_set_current_line(213, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5280);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(214, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(215, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB61;

LAB63:    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t8);
    *((unsigned int *)t9) = (t18 | t19);
    t20 = (t3 + 4);
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t6 = (t23 & t25);
    t30 = (t27 & t29);
    t31 = (~(t6));
    t32 = (~(t30));
    t33 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t33 & t31);
    t34 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t34 & t32);
    t35 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t35 & t31);
    t36 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t36 & t32);
    goto LAB65;

LAB66:    xsi_set_current_line(218, ng0);

LAB69:    xsi_set_current_line(219, ng0);
    t43 = ((char*)((ng3)));
    t44 = (t0 + 5440);
    xsi_vlogvar_assign_value(t44, t43, 0, 0, 1);
    xsi_set_current_line(220, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB68;

LAB70:    *((unsigned int *)t9) = 1;
    goto LAB73;

LAB75:    t17 = *((unsigned int *)t9);
    t18 = *((unsigned int *)t20);
    *((unsigned int *)t9) = (t17 | t18);
    t19 = *((unsigned int *)t8);
    t22 = *((unsigned int *)t20);
    *((unsigned int *)t8) = (t19 | t22);
    goto LAB74;

LAB76:    t34 = *((unsigned int *)t45);
    t35 = *((unsigned int *)t43);
    *((unsigned int *)t45) = (t34 | t35);
    t44 = (t3 + 4);
    t46 = (t9 + 4);
    t36 = *((unsigned int *)t3);
    t38 = (~(t36));
    t39 = *((unsigned int *)t44);
    t40 = (~(t39));
    t41 = *((unsigned int *)t9);
    t42 = (~(t41));
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t6 = (t38 & t40);
    t30 = (t42 & t48);
    t49 = (~(t6));
    t50 = (~(t30));
    t51 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t51 & t49);
    t52 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t52 & t50);
    t53 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t53 & t49);
    t54 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t54 & t50);
    goto LAB78;

LAB79:    xsi_set_current_line(222, ng0);

LAB82:    xsi_set_current_line(223, ng0);
    t61 = ((char*)((ng3)));
    t62 = (t0 + 7200);
    xsi_vlogvar_assign_value(t62, t61, 0, 0, 1);
    xsi_set_current_line(224, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5440);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(225, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(226, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB81;

LAB85:    xsi_set_current_line(237, ng0);

LAB88:    xsi_set_current_line(238, ng0);
    t5 = ((char*)((ng3)));
    t7 = (t0 + 5920);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 4);
    goto LAB87;

LAB91:    xsi_set_current_line(250, ng0);

LAB94:    xsi_set_current_line(251, ng0);
    t21 = ((char*)((ng3)));
    t37 = (t0 + 4640);
    xsi_vlogvar_assign_value(t37, t21, 0, 0, 1);
    xsi_set_current_line(252, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(253, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6880);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB93;

LAB96:    *((unsigned int *)t9) = 1;
    goto LAB99;

LAB101:    t25 = *((unsigned int *)t9);
    t26 = *((unsigned int *)t43);
    *((unsigned int *)t9) = (t25 | t26);
    t27 = *((unsigned int *)t37);
    t28 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t27 | t28);
    goto LAB100;

LAB103:    xsi_set_current_line(266, ng0);

LAB106:    xsi_set_current_line(267, ng0);
    t5 = ((char*)((ng5)));
    t7 = (t0 + 5920);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 4);
    goto LAB105;

LAB109:    xsi_set_current_line(278, ng0);

LAB112:    xsi_set_current_line(279, ng0);
    t21 = ((char*)((ng3)));
    t37 = (t0 + 4800);
    xsi_vlogvar_assign_value(t37, t21, 0, 0, 1);
    xsi_set_current_line(280, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(281, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6560);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB111;

LAB114:    *((unsigned int *)t9) = 1;
    goto LAB117;

LAB119:    t25 = *((unsigned int *)t9);
    t26 = *((unsigned int *)t43);
    *((unsigned int *)t9) = (t25 | t26);
    t27 = *((unsigned int *)t37);
    t28 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t27 | t28);
    goto LAB118;

LAB121:    xsi_set_current_line(293, ng0);

LAB124:    xsi_set_current_line(294, ng0);
    t5 = ((char*)((ng7)));
    t7 = (t0 + 5920);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 4);
    goto LAB123;

LAB127:    xsi_set_current_line(305, ng0);

LAB130:    xsi_set_current_line(306, ng0);
    t21 = ((char*)((ng3)));
    t37 = (t0 + 4960);
    xsi_vlogvar_assign_value(t37, t21, 0, 0, 1);
    xsi_set_current_line(307, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(308, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6720);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB129;

LAB132:    *((unsigned int *)t9) = 1;
    goto LAB135;

LAB137:    t25 = *((unsigned int *)t9);
    t26 = *((unsigned int *)t43);
    *((unsigned int *)t9) = (t25 | t26);
    t27 = *((unsigned int *)t37);
    t28 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t27 | t28);
    goto LAB136;

}


extern void work_m_00000000003686659738_0536836382_init()
{
	static char *pe[] = {(void *)Cont_91_0,(void *)Always_94_1,(void *)Always_102_2,(void *)Always_112_3,(void *)Always_120_4,(void *)Always_135_5,(void *)Always_147_6,(void *)Always_159_7,(void *)Always_170_8};
	xsi_register_didat("work_m_00000000003686659738_0536836382", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000003686659738_0536836382.didat");
	xsi_register_executes(pe);
}
