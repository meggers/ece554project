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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/CPU/PC_control.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {0U, 4294967295U};



static void Cont_83_0(char *t0)
{
    char t3[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
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
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;

LAB0:    t1 = (t0 + 6616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 4096);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t0 + 5696);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t8);
    t12 = (t10 | t11);
    *((unsigned int *)t9) = t12;
    t13 = (t5 + 4);
    t14 = (t8 + 4);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t13);
    t17 = *((unsigned int *)t14);
    t18 = (t16 | t17);
    *((unsigned int *)t15) = t18;
    t19 = *((unsigned int *)t15);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB4;

LAB5:
LAB6:    memset(t3, 0, 8);
    t37 = (t9 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t9);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB10;

LAB8:    if (*((unsigned int *)t37) == 0)
        goto LAB7;

LAB9:    t43 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t43) = 1;

LAB10:    t44 = (t0 + 7544);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memset(t48, 0, 8);
    t49 = 1U;
    t50 = t49;
    t51 = (t3 + 4);
    t52 = *((unsigned int *)t3);
    t49 = (t49 & t52);
    t53 = *((unsigned int *)t51);
    t50 = (t50 & t53);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 | t49);
    t56 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t56 | t50);
    xsi_driver_vfirst_trans(t44, 0, 0);
    t57 = (t0 + 7432);
    *((int *)t57) = 1;

LAB1:    return;
LAB4:    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t9) = (t21 | t22);
    t23 = (t5 + 4);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (~(t25));
    t27 = *((unsigned int *)t5);
    t28 = (t27 & t26);
    t29 = *((unsigned int *)t24);
    t30 = (~(t29));
    t31 = *((unsigned int *)t8);
    t32 = (t31 & t30);
    t33 = (~(t28));
    t34 = (~(t32));
    t35 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t35 & t33);
    t36 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t36 & t34);
    goto LAB6;

LAB7:    *((unsigned int *)t3) = 1;
    goto LAB10;

}

static void Always_89_1(char *t0)
{
    char t6[8];
    char t19[8];
    char t26[8];
    char t66[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;

LAB0:    t1 = (t0 + 6864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 7448);
    *((int *)t2) = 1;
    t3 = (t0 + 6896);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(89, ng0);

LAB5:    xsi_set_current_line(91, ng0);
    t4 = (t0 + 1776U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t5 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t4) != 0)
        goto LAB8;

LAB9:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB10;

LAB11:    memcpy(t26, t6, 8);

LAB12:    t58 = (t26 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t26);
    t62 = (t61 & t60);
    t63 = (t62 != 0);
    if (t63 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 2256U);
    t4 = *((char **)t2);
    t2 = (t0 + 2096U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t5 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB61;

LAB59:    if (*((unsigned int *)t2) == 0)
        goto LAB58;

LAB60:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;

LAB61:    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t6);
    t16 = (t14 & t15);
    *((unsigned int *)t19) = t16;
    t13 = (t4 + 4);
    t17 = (t6 + 4);
    t18 = (t19 + 4);
    t20 = *((unsigned int *)t13);
    t21 = *((unsigned int *)t17);
    t22 = (t20 | t21);
    *((unsigned int *)t18) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 != 0);
    if (t24 == 1)
        goto LAB62;

LAB63:
LAB64:    t31 = (t19 + 4);
    t48 = *((unsigned int *)t31);
    t49 = (~(t48));
    t52 = *((unsigned int *)t19);
    t53 = (t52 & t49);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB65;

LAB66:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 3376U);
    t4 = *((char **)t2);
    t2 = (t0 + 2096U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t5 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB72;

LAB70:    if (*((unsigned int *)t2) == 0)
        goto LAB69;

LAB71:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;

LAB72:    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t6);
    t16 = (t14 & t15);
    *((unsigned int *)t19) = t16;
    t13 = (t4 + 4);
    t17 = (t6 + 4);
    t18 = (t19 + 4);
    t20 = *((unsigned int *)t13);
    t21 = *((unsigned int *)t17);
    t22 = (t20 | t21);
    *((unsigned int *)t18) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 != 0);
    if (t24 == 1)
        goto LAB73;

LAB74:
LAB75:    t31 = (t19 + 4);
    t48 = *((unsigned int *)t31);
    t49 = (~(t48));
    t52 = *((unsigned int *)t19);
    t53 = (t52 & t49);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB76;

LAB77:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 2416U);
    t4 = *((char **)t2);
    t2 = (t0 + 2096U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t5 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB89;

LAB87:    if (*((unsigned int *)t2) == 0)
        goto LAB86;

LAB88:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;

LAB89:    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t6);
    t16 = (t14 & t15);
    *((unsigned int *)t19) = t16;
    t13 = (t4 + 4);
    t17 = (t6 + 4);
    t18 = (t19 + 4);
    t20 = *((unsigned int *)t13);
    t21 = *((unsigned int *)t17);
    t22 = (t20 | t21);
    *((unsigned int *)t18) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 != 0);
    if (t24 == 1)
        goto LAB90;

LAB91:
LAB92:    t31 = (t19 + 4);
    t48 = *((unsigned int *)t31);
    t49 = (~(t48));
    t52 = *((unsigned int *)t19);
    t53 = (t52 & t49);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB93;

LAB94:    xsi_set_current_line(172, ng0);

LAB97:    xsi_set_current_line(173, ng0);
    t2 = ((char*)((ng6)));
    t4 = (t0 + 4736);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 32);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 4896);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5216);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5056);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5376);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(179, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5536);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);

LAB95:
LAB78:
LAB67:
LAB22:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB9;

LAB10:    t17 = (t0 + 3696U);
    t18 = *((char **)t17);
    memset(t19, 0, 8);
    t17 = (t18 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t17) != 0)
        goto LAB15;

LAB16:    t27 = *((unsigned int *)t6);
    t28 = *((unsigned int *)t19);
    t29 = (t27 & t28);
    *((unsigned int *)t26) = t29;
    t30 = (t6 + 4);
    t31 = (t19 + 4);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t30);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB12;

LAB13:    *((unsigned int *)t19) = 1;
    goto LAB16;

LAB15:    t25 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB16;

LAB17:    t38 = *((unsigned int *)t26);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t26) = (t38 | t39);
    t40 = (t6 + 4);
    t41 = (t19 + 4);
    t42 = *((unsigned int *)t6);
    t43 = (~(t42));
    t44 = *((unsigned int *)t40);
    t45 = (~(t44));
    t46 = *((unsigned int *)t19);
    t47 = (~(t46));
    t48 = *((unsigned int *)t41);
    t49 = (~(t48));
    t50 = (t43 & t45);
    t51 = (t47 & t49);
    t52 = (~(t50));
    t53 = (~(t51));
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t54 & t52);
    t55 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t55 & t53);
    t56 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t56 & t52);
    t57 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t57 & t53);
    goto LAB19;

LAB20:    xsi_set_current_line(91, ng0);

LAB23:    xsi_set_current_line(93, ng0);
    t64 = (t0 + 3056U);
    t65 = *((char **)t64);
    t64 = (t0 + 4736);
    xsi_vlogvar_assign_value(t64, t65, 0, 0, 32);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1936U);
    t3 = *((char **)t2);

LAB24:    t2 = ((char*)((ng1)));
    t50 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t50 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng4)));
    t50 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t50 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng5)));
    t50 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t50 == 1)
        goto LAB29;

LAB30:
LAB32:
LAB31:    xsi_set_current_line(121, ng0);

LAB57:    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 4896);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);

LAB33:    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 5056);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5216);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5376);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5536);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    goto LAB22;

LAB25:    xsi_set_current_line(97, ng0);

LAB34:    xsi_set_current_line(99, ng0);
    t4 = (t0 + 3216U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 2);
    t9 = (t8 & 1);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 2);
    t14 = (t11 & 1);
    *((unsigned int *)t4) = t14;
    t13 = (t6 + 4);
    t15 = *((unsigned int *)t13);
    t16 = (~(t15));
    t20 = *((unsigned int *)t6);
    t21 = (t20 & t16);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 4896);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);

LAB37:    goto LAB33;

LAB27:    xsi_set_current_line(105, ng0);

LAB38:    xsi_set_current_line(107, ng0);
    t4 = (t0 + 3216U);
    t5 = *((char **)t4);
    memset(t19, 0, 8);
    t4 = (t19 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 2);
    t9 = (t8 & 1);
    *((unsigned int *)t19) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 2);
    t14 = (t11 & 1);
    *((unsigned int *)t4) = t14;
    memset(t6, 0, 8);
    t13 = (t19 + 4);
    t15 = *((unsigned int *)t13);
    t16 = (~(t15));
    t20 = *((unsigned int *)t19);
    t21 = (t20 & t16);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB42;

LAB40:    if (*((unsigned int *)t13) == 0)
        goto LAB39;

LAB41:    t17 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t17) = 1;

LAB42:    t18 = (t6 + 4);
    t23 = *((unsigned int *)t18);
    t24 = (~(t23));
    t27 = *((unsigned int *)t6);
    t28 = (t27 & t24);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB43;

LAB44:    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 4896);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);

LAB45:    goto LAB33;

LAB29:    xsi_set_current_line(113, ng0);

LAB46:    xsi_set_current_line(115, ng0);
    t4 = (t0 + 3216U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    t9 = (t8 & 1);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 0);
    t14 = (t11 & 1);
    *((unsigned int *)t4) = t14;
    t13 = (t0 + 3216U);
    t17 = *((char **)t13);
    memset(t26, 0, 8);
    t13 = (t26 + 4);
    t18 = (t17 + 4);
    t15 = *((unsigned int *)t17);
    t16 = (t15 >> 1);
    t20 = (t16 & 1);
    *((unsigned int *)t26) = t20;
    t21 = *((unsigned int *)t18);
    t22 = (t21 >> 1);
    t23 = (t22 & 1);
    *((unsigned int *)t13) = t23;
    memset(t19, 0, 8);
    t25 = (t26 + 4);
    t24 = *((unsigned int *)t25);
    t27 = (~(t24));
    t28 = *((unsigned int *)t26);
    t29 = (t28 & t27);
    t33 = (t29 & 1U);
    if (t33 != 0)
        goto LAB50;

LAB48:    if (*((unsigned int *)t25) == 0)
        goto LAB47;

LAB49:    t30 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t30) = 1;

LAB50:    t34 = *((unsigned int *)t6);
    t35 = *((unsigned int *)t19);
    t36 = (t34 & t35);
    *((unsigned int *)t66) = t36;
    t31 = (t6 + 4);
    t32 = (t19 + 4);
    t40 = (t66 + 4);
    t37 = *((unsigned int *)t31);
    t38 = *((unsigned int *)t32);
    t39 = (t37 | t38);
    *((unsigned int *)t40) = t39;
    t42 = *((unsigned int *)t40);
    t43 = (t42 != 0);
    if (t43 == 1)
        goto LAB51;

LAB52:
LAB53:    t64 = (t66 + 4);
    t63 = *((unsigned int *)t64);
    t68 = (~(t63));
    t69 = *((unsigned int *)t66);
    t70 = (t69 & t68);
    t71 = (t70 != 0);
    if (t71 > 0)
        goto LAB54;

LAB55:    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 4896);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);

LAB56:    goto LAB33;

LAB35:    xsi_set_current_line(100, ng0);
    t17 = ((char*)((ng2)));
    t18 = (t0 + 4896);
    xsi_vlogvar_assign_value(t18, t17, 0, 0, 1);
    goto LAB37;

LAB39:    *((unsigned int *)t6) = 1;
    goto LAB42;

LAB43:    xsi_set_current_line(108, ng0);
    t25 = ((char*)((ng2)));
    t30 = (t0 + 4896);
    xsi_vlogvar_assign_value(t30, t25, 0, 0, 1);
    goto LAB45;

LAB47:    *((unsigned int *)t19) = 1;
    goto LAB50;

LAB51:    t44 = *((unsigned int *)t66);
    t45 = *((unsigned int *)t40);
    *((unsigned int *)t66) = (t44 | t45);
    t41 = (t6 + 4);
    t58 = (t19 + 4);
    t46 = *((unsigned int *)t6);
    t47 = (~(t46));
    t48 = *((unsigned int *)t41);
    t49 = (~(t48));
    t52 = *((unsigned int *)t19);
    t53 = (~(t52));
    t54 = *((unsigned int *)t58);
    t55 = (~(t54));
    t51 = (t47 & t49);
    t67 = (t53 & t55);
    t56 = (~(t51));
    t57 = (~(t67));
    t59 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t59 & t56);
    t60 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t60 & t57);
    t61 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t61 & t56);
    t62 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t62 & t57);
    goto LAB53;

LAB54:    xsi_set_current_line(116, ng0);
    t65 = ((char*)((ng2)));
    t72 = (t0 + 4896);
    xsi_vlogvar_assign_value(t72, t65, 0, 0, 1);
    goto LAB56;

LAB58:    *((unsigned int *)t6) = 1;
    goto LAB61;

LAB62:    t27 = *((unsigned int *)t19);
    t28 = *((unsigned int *)t18);
    *((unsigned int *)t19) = (t27 | t28);
    t25 = (t4 + 4);
    t30 = (t6 + 4);
    t29 = *((unsigned int *)t4);
    t33 = (~(t29));
    t34 = *((unsigned int *)t25);
    t35 = (~(t34));
    t36 = *((unsigned int *)t6);
    t37 = (~(t36));
    t38 = *((unsigned int *)t30);
    t39 = (~(t38));
    t50 = (t33 & t35);
    t51 = (t37 & t39);
    t42 = (~(t50));
    t43 = (~(t51));
    t44 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t44 & t42);
    t45 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t45 & t43);
    t46 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t46 & t42);
    t47 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t47 & t43);
    goto LAB64;

LAB65:    xsi_set_current_line(136, ng0);

LAB68:    xsi_set_current_line(138, ng0);
    t32 = (t0 + 2576U);
    t40 = *((char **)t32);
    t32 = (t0 + 2736U);
    t41 = *((char **)t32);
    xsi_vlogtype_concat(t26, 32, 32, 2U, t41, 6, t40, 26);
    t32 = (t0 + 4736);
    xsi_vlogvar_assign_value(t32, t26, 0, 0, 32);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 4896);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 5216);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5056);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5376);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5536);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    goto LAB67;

LAB69:    *((unsigned int *)t6) = 1;
    goto LAB72;

LAB73:    t27 = *((unsigned int *)t19);
    t28 = *((unsigned int *)t18);
    *((unsigned int *)t19) = (t27 | t28);
    t25 = (t4 + 4);
    t30 = (t6 + 4);
    t29 = *((unsigned int *)t4);
    t33 = (~(t29));
    t34 = *((unsigned int *)t25);
    t35 = (~(t34));
    t36 = *((unsigned int *)t6);
    t37 = (~(t36));
    t38 = *((unsigned int *)t30);
    t39 = (~(t38));
    t50 = (t33 & t35);
    t51 = (t37 & t39);
    t42 = (~(t50));
    t43 = (~(t51));
    t44 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t44 & t42);
    t45 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t45 & t43);
    t46 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t46 & t42);
    t47 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t47 & t43);
    goto LAB75;

LAB76:    xsi_set_current_line(148, ng0);

LAB79:    xsi_set_current_line(150, ng0);
    t32 = (t0 + 3536U);
    t40 = *((char **)t32);
    t32 = (t0 + 4736);
    xsi_vlogvar_assign_value(t32, t40, 0, 0, 32);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 4416);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t12);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB83;

LAB81:    if (*((unsigned int *)t12) == 0)
        goto LAB80;

LAB82:    t13 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t13) = 1;

LAB83:    t17 = (t6 + 4);
    t18 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (~(t14));
    *((unsigned int *)t6) = t15;
    *((unsigned int *)t17) = 0;
    if (*((unsigned int *)t18) != 0)
        goto LAB85;

LAB84:    t23 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t23 & 1U);
    t24 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t24 & 1U);
    t25 = (t0 + 4896);
    xsi_vlogvar_assign_value(t25, t6, 0, 0, 1);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5216);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5056);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 5376);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5536);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    goto LAB78;

LAB80:    *((unsigned int *)t6) = 1;
    goto LAB83;

LAB85:    t16 = *((unsigned int *)t6);
    t20 = *((unsigned int *)t18);
    *((unsigned int *)t6) = (t16 | t20);
    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t18);
    *((unsigned int *)t17) = (t21 | t22);
    goto LAB84;

LAB86:    *((unsigned int *)t6) = 1;
    goto LAB89;

LAB90:    t27 = *((unsigned int *)t19);
    t28 = *((unsigned int *)t18);
    *((unsigned int *)t19) = (t27 | t28);
    t25 = (t4 + 4);
    t30 = (t6 + 4);
    t29 = *((unsigned int *)t4);
    t33 = (~(t29));
    t34 = *((unsigned int *)t25);
    t35 = (~(t34));
    t36 = *((unsigned int *)t6);
    t37 = (~(t36));
    t38 = *((unsigned int *)t30);
    t39 = (~(t38));
    t50 = (t33 & t35);
    t51 = (t37 & t39);
    t42 = (~(t50));
    t43 = (~(t51));
    t44 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t44 & t42);
    t45 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t45 & t43);
    t46 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t46 & t42);
    t47 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t47 & t43);
    goto LAB92;

LAB93:    xsi_set_current_line(160, ng0);

LAB96:    xsi_set_current_line(162, ng0);
    t32 = (t0 + 2896U);
    t40 = *((char **)t32);
    t32 = (t0 + 4736);
    xsi_vlogvar_assign_value(t32, t40, 0, 0, 32);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng4)));
    t4 = (t0 + 4896);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(165, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5216);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5056);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng3)));
    t4 = (t0 + 5376);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(168, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 5536);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    goto LAB95;

}

static void Always_184_2(char *t0)
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

LAB0:    t1 = (t0 + 7112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(184, ng0);
    t2 = (t0 + 7464);
    *((int *)t2) = 1;
    t3 = (t0 + 7144);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(184, ng0);

LAB5:    xsi_set_current_line(185, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(193, ng0);

LAB10:    xsi_set_current_line(194, ng0);
    t2 = (t0 + 5056);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(195, ng0);
    t2 = (t0 + 5216);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(196, ng0);
    t2 = (t0 + 5376);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(197, ng0);
    t2 = (t0 + 5536);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(199, ng0);
    t2 = (t0 + 4096);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5696);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(185, ng0);

LAB9:    xsi_set_current_line(186, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4096);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(188, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(189, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(191, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5696);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}


extern void work_m_00000000003902768276_3046652700_init()
{
	static char *pe[] = {(void *)Cont_83_0,(void *)Always_89_1,(void *)Always_184_2};
	xsi_register_didat("work_m_00000000003902768276_3046652700", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000003902768276_3046652700.didat");
	xsi_register_executes(pe);
}
