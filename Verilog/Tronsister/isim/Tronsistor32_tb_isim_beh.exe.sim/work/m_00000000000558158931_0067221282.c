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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/PPU/PPU_BGLGEN.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {7U, 0U};



static void Cont_47_0(char *t0)
{
    char t3[8];
    char t6[8];
    char t18[8];
    char t30[8];
    char t42[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
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
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;

LAB0:    t1 = (t0 + 4288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 2888);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t7 = (t6 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 15);
    t11 = (t10 & 1);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 15);
    t14 = (t13 & 1);
    *((unsigned int *)t7) = t14;
    t15 = (t0 + 3048);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memset(t18, 0, 8);
    t19 = (t18 + 4);
    t20 = (t17 + 4);
    t21 = *((unsigned int *)t17);
    t22 = (t21 >> 15);
    t23 = (t22 & 1);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t20);
    t25 = (t24 >> 15);
    t26 = (t25 & 1);
    *((unsigned int *)t19) = t26;
    t27 = (t0 + 2728);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memset(t30, 0, 8);
    t31 = (t30 + 4);
    t32 = (t29 + 4);
    t33 = *((unsigned int *)t29);
    t34 = (t33 >> 0);
    t35 = (t34 & 1);
    *((unsigned int *)t30) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 >> 0);
    t38 = (t37 & 1);
    *((unsigned int *)t31) = t38;
    t39 = (t0 + 2728);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    memset(t42, 0, 8);
    t43 = (t42 + 4);
    t44 = (t41 + 4);
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 1);
    t47 = (t46 & 1);
    *((unsigned int *)t42) = t47;
    t48 = *((unsigned int *)t44);
    t49 = (t48 >> 1);
    t50 = (t49 & 1);
    *((unsigned int *)t43) = t50;
    xsi_vlogtype_concat(t3, 4, 4, 4U, t42, 1, t30, 1, t18, 1, t6, 1);
    t51 = (t0 + 4952);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    t54 = (t53 + 56U);
    t55 = *((char **)t54);
    memset(t55, 0, 8);
    t56 = 15U;
    t57 = t56;
    t58 = (t3 + 4);
    t59 = *((unsigned int *)t3);
    t56 = (t56 & t59);
    t60 = *((unsigned int *)t58);
    t57 = (t57 & t60);
    t61 = (t55 + 4);
    t62 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t62 | t56);
    t63 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t63 | t57);
    xsi_driver_vfirst_trans(t51, 0, 3);
    t64 = (t0 + 4856);
    *((int *)t64) = 1;

LAB1:    return;
}

static void Always_51_1(char *t0)
{
    char t13[8];
    char t37[8];
    char t38[8];
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
    char *t14;
    char *t15;
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
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t39;
    char *t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 4536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 4872);
    *((int *)t2) = 1;
    t3 = (t0 + 4568);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(53, ng0);
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

LAB7:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(84, ng0);

LAB32:    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2008U);
    t4 = *((char **)t3);
    xsi_vlogtype_concat(t13, 16, 16, 2U, t4, 8, t2, 8);
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2168U);
    t4 = *((char **)t3);
    xsi_vlogtype_concat(t13, 16, 16, 2U, t4, 8, t2, 8);
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(53, ng0);

LAB9:    xsi_set_current_line(54, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 3, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(60, ng0);

LAB13:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3368);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t14 = (t11 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB17;

LAB14:    if (t25 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t13) = 1;

LAB17:    t29 = (t13 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t13);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(76, ng0);

LAB31:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 3368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 2, t5, 32);
    t11 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 2, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB20:    goto LAB12;

LAB16:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(62, ng0);

LAB21:    xsi_set_current_line(63, ng0);
    t35 = (t0 + 1688U);
    t36 = *((char **)t35);
    t35 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t35, t36, 0, 0, 2, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 3, t5, 32);
    t11 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 3, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB25;

LAB22:    if (t20 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t13) = 1;

LAB25:    t15 = (t13 + 4);
    t23 = *((unsigned int *)t15);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(70, ng0);

LAB30:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t37, 0, 8);
    t11 = (t37 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    *((unsigned int *)t37) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t10 & 32767U);
    t16 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t16 & 32767U);
    xsi_vlogtype_concat(t13, 16, 16, 2U, t37, 15, t2, 1);
    t14 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3048);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t37, 0, 8);
    t11 = (t37 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    *((unsigned int *)t37) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t10 & 32767U);
    t16 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t16 & 32767U);
    xsi_vlogtype_concat(t13, 16, 16, 2U, t37, 15, t2, 1);
    t14 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB28:    goto LAB20;

LAB24:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB25;

LAB26:    xsi_set_current_line(66, ng0);

LAB29:    xsi_set_current_line(67, ng0);
    t28 = (t0 + 2008U);
    t29 = *((char **)t28);
    t28 = (t0 + 2888);
    t35 = (t28 + 56U);
    t36 = *((char **)t35);
    memset(t38, 0, 8);
    t39 = (t38 + 4);
    t40 = (t36 + 4);
    t30 = *((unsigned int *)t36);
    t31 = (t30 >> 7);
    *((unsigned int *)t38) = t31;
    t32 = *((unsigned int *)t40);
    t33 = (t32 >> 7);
    *((unsigned int *)t39) = t33;
    t34 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t34 & 255U);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 & 255U);
    xsi_vlogtype_concat(t37, 16, 16, 2U, t38, 8, t29, 8);
    t42 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t42, t37, 0, 0, 16, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 3048);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t37, 0, 8);
    t11 = (t37 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 7);
    *((unsigned int *)t37) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 7);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t10 & 255U);
    t16 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t16 & 255U);
    xsi_vlogtype_concat(t13, 16, 16, 2U, t37, 8, t3, 8);
    t14 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 3U);
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t13, 0, 0, 2, 0LL);
    goto LAB28;

}


extern void work_m_00000000000558158931_0067221282_init()
{
	static char *pe[] = {(void *)Cont_47_0,(void *)Always_51_1};
	xsi_register_didat("work_m_00000000000558158931_0067221282", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000000558158931_0067221282.didat");
	xsi_register_executes(pe);
}
