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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/SPART/BRG.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};



static void Always_44_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 4056);
    *((int *)t2) = 1;
    t3 = (t0 + 3520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);

LAB5:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB2;

}

static void Always_52_1(char *t0)
{
    char t13[8];
    char t14[8];
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
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    t1 = (t0 + 3736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 4072);
    *((int *)t2) = 1;
    t3 = (t0 + 3768);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(52, ng0);

LAB5:    xsi_set_current_line(55, ng0);
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

LAB7:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 65535U);
    if (t10 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t5) != 0)
        goto LAB16;

LAB17:    memset(t13, 0, 8);
    t12 = (t14 + 4);
    t15 = *((unsigned int *)t12);
    t16 = (~(t15));
    t17 = *((unsigned int *)t14);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB21;

LAB19:    if (*((unsigned int *)t12) == 0)
        goto LAB18;

LAB20:    t20 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t20) = 1;

LAB21:    t21 = (t13 + 4);
    t22 = (t14 + 4);
    t23 = *((unsigned int *)t14);
    t24 = (~(t23));
    *((unsigned int *)t13) = t24;
    *((unsigned int *)t21) = 0;
    if (*((unsigned int *)t22) != 0)
        goto LAB23;

LAB22:    t29 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t29 & 1U);
    t30 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t30 & 1U);
    t31 = (t13 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t13);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(73, ng0);

LAB28:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 16, t5, 32);
    t11 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 16, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB26:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(55, ng0);

LAB9:    xsi_set_current_line(56, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 16, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(61, ng0);

LAB13:    xsi_set_current_line(62, ng0);
    t11 = (t0 + 1528U);
    t12 = *((char **)t11);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 16, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 16, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB12;

LAB14:    *((unsigned int *)t14) = 1;
    goto LAB17;

LAB16:    t11 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB17;

LAB18:    *((unsigned int *)t13) = 1;
    goto LAB21;

LAB23:    t25 = *((unsigned int *)t13);
    t26 = *((unsigned int *)t22);
    *((unsigned int *)t13) = (t25 | t26);
    t27 = *((unsigned int *)t21);
    t28 = *((unsigned int *)t22);
    *((unsigned int *)t21) = (t27 | t28);
    goto LAB22;

LAB24:    xsi_set_current_line(67, ng0);

LAB27:    xsi_set_current_line(68, ng0);
    t37 = (t0 + 2408);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    t40 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t40, t39, 0, 0, 16, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 16, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB26;

}


extern void work_m_00000000003089652942_0292359186_init()
{
	static char *pe[] = {(void *)Always_44_0,(void *)Always_52_1};
	xsi_register_didat("work_m_00000000003089652942_0292359186", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000003089652942_0292359186.didat");
	xsi_register_executes(pe);
}
