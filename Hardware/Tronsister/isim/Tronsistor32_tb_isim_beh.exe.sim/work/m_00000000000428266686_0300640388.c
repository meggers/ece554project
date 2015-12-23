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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/CPU/CPU_control.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {3U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};



static void Always_72_0(char *t0)
{
    char t6[8];
    char t12[8];
    char t48[8];
    char t50[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    unsigned int t49;

LAB0:    t1 = (t0 + 5568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 5888);
    *((int *)t2) = 1;
    t3 = (t0 + 5600);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(72, ng0);

LAB5:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t7 + 4);
    t8 = *((unsigned int *)t7);
    t9 = *((unsigned int *)t4);
    t10 = (t8 | t9);
    if (t10 != 63U)
        goto LAB7;

LAB6:    if (*((unsigned int *)t4) == 0)
        goto LAB8;

LAB9:    t11 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t11) = 1;

LAB7:    t13 = *((unsigned int *)t5);
    t14 = *((unsigned int *)t6);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = (t5 + 4);
    t17 = (t6 + 4);
    t18 = (t12 + 4);
    t19 = *((unsigned int *)t16);
    t20 = *((unsigned int *)t17);
    t21 = (t19 | t20);
    *((unsigned int *)t18) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 != 0);
    if (t23 == 1)
        goto LAB10;

LAB11:
LAB12:    t40 = (t12 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t12);
    t44 = (t43 & t42);
    t45 = (t44 != 0);
    if (t45 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 5);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 5);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t6 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t6);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(172, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t48, 0, 8);
    t2 = (t48 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 3);
    *((unsigned int *)t48) = t9;
    t10 = *((unsigned int *)t4);
    t13 = (t10 >> 3);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t14 & 7U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 7U);
    memset(t12, 0, 8);
    t5 = (t48 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t48);
    t22 = (t21 & t20);
    t23 = (t22 & 7U);
    if (t23 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t5) != 0)
        goto LAB42;

LAB43:    memset(t6, 0, 8);
    t11 = (t12 + 4);
    t24 = *((unsigned int *)t11);
    t25 = (~(t24));
    t28 = *((unsigned int *)t12);
    t29 = (t28 & t25);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB47;

LAB45:    if (*((unsigned int *)t11) == 0)
        goto LAB44;

LAB46:    t16 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t16) = 1;

LAB47:    t17 = (t6 + 4);
    t18 = (t12 + 4);
    t32 = *((unsigned int *)t12);
    t33 = (~(t32));
    *((unsigned int *)t6) = t33;
    *((unsigned int *)t17) = 0;
    if (*((unsigned int *)t18) != 0)
        goto LAB49;

LAB48:    t39 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t39 & 1U);
    t41 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t41 & 1U);
    t26 = (t6 + 4);
    t42 = *((unsigned int *)t26);
    t43 = (~(t42));
    t44 = *((unsigned int *)t6);
    t45 = (t44 & t43);
    t49 = (t45 != 0);
    if (t49 > 0)
        goto LAB50;

LAB51:    xsi_set_current_line(294, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t48, 0, 8);
    t2 = (t48 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 4);
    *((unsigned int *)t48) = t9;
    t10 = *((unsigned int *)t4);
    t13 = (t10 >> 4);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t14 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);
    memset(t12, 0, 8);
    t5 = (t48 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t48);
    t22 = (t21 & t20);
    t23 = (t22 & 3U);
    if (t23 != 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t5) != 0)
        goto LAB78;

LAB79:    memset(t6, 0, 8);
    t11 = (t12 + 4);
    t24 = *((unsigned int *)t11);
    t25 = (~(t24));
    t28 = *((unsigned int *)t12);
    t29 = (t28 & t25);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB83;

LAB81:    if (*((unsigned int *)t11) == 0)
        goto LAB80;

LAB82:    t16 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t16) = 1;

LAB83:    t17 = (t6 + 4);
    t18 = (t12 + 4);
    t32 = *((unsigned int *)t12);
    t33 = (~(t32));
    *((unsigned int *)t6) = t33;
    *((unsigned int *)t17) = 0;
    if (*((unsigned int *)t18) != 0)
        goto LAB85;

LAB84:    t39 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t39 & 1U);
    t41 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t41 & 1U);
    t26 = (t6 + 4);
    t42 = *((unsigned int *)t26);
    t43 = (~(t42));
    t44 = *((unsigned int *)t6);
    t45 = (t44 & t43);
    t49 = (t45 != 0);
    if (t49 > 0)
        goto LAB86;

LAB87:    xsi_set_current_line(385, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 4);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 4);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t6 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t6);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB117;

LAB118:    xsi_set_current_line(415, ng0);

LAB121:    xsi_set_current_line(418, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(419, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(420, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(421, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(422, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(423, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(424, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(426, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(427, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(428, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(429, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(430, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(432, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(434, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(435, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(436, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(437, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(439, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(440, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(442, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);

LAB119:
LAB88:
LAB52:
LAB19:
LAB15:    goto LAB2;

LAB8:    *((unsigned int *)t6) = 1;
    goto LAB7;

LAB10:    t24 = *((unsigned int *)t12);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t12) = (t24 | t25);
    t26 = (t5 + 4);
    t27 = (t6 + 4);
    t28 = *((unsigned int *)t26);
    t29 = (~(t28));
    t30 = *((unsigned int *)t5);
    t31 = (t30 & t29);
    t32 = *((unsigned int *)t27);
    t33 = (~(t32));
    t34 = *((unsigned int *)t6);
    t35 = (t34 & t33);
    t36 = (~(t31));
    t37 = (~(t35));
    t38 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t38 & t36);
    t39 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t39 & t37);
    goto LAB12;

LAB13:    xsi_set_current_line(75, ng0);

LAB16:    xsi_set_current_line(77, ng0);
    t46 = ((char*)((ng1)));
    t47 = (t0 + 1608);
    xsi_vlogvar_assign_value(t47, t46, 0, 0, 1);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t4);
    t13 = (t10 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 31U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 31U);
    t5 = (t0 + 4648);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 5);
    goto LAB15;

LAB17:    xsi_set_current_line(106, ng0);

LAB20:    xsi_set_current_line(108, ng0);
    t7 = ((char*)((ng1)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t7, 0, 0, 1);
    xsi_set_current_line(109, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(117, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t4);
    t13 = (t10 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 31U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 31U);
    t5 = (t0 + 4648);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 5);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t12 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t12) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    memset(t6, 0, 8);
    t5 = (t12 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB24;

LAB22:    if (*((unsigned int *)t5) == 0)
        goto LAB21;

LAB23:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;

LAB24:    t11 = (t6 + 4);
    t24 = *((unsigned int *)t11);
    t25 = (~(t24));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t25);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(154, ng0);

LAB34:    xsi_set_current_line(156, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 2);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 2);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t6 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t6);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(161, ng0);

LAB39:    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB37:
LAB27:    goto LAB19;

LAB21:    *((unsigned int *)t6) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(134, ng0);

LAB28:    xsi_set_current_line(136, ng0);
    t16 = (t0 + 1208U);
    t17 = *((char **)t16);
    memset(t48, 0, 8);
    t16 = (t48 + 4);
    t18 = (t17 + 4);
    t32 = *((unsigned int *)t17);
    t33 = (t32 >> 0);
    t34 = (t33 & 1);
    *((unsigned int *)t48) = t34;
    t36 = *((unsigned int *)t18);
    t37 = (t36 >> 0);
    t38 = (t37 & 1);
    *((unsigned int *)t16) = t38;
    t26 = (t48 + 4);
    t39 = *((unsigned int *)t26);
    t41 = (~(t39));
    t42 = *((unsigned int *)t48);
    t43 = (t42 & t41);
    t44 = (t43 != 0);
    if (t44 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(141, ng0);

LAB33:    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB31:    goto LAB27;

LAB29:    xsi_set_current_line(136, ng0);

LAB32:    xsi_set_current_line(137, ng0);
    t27 = ((char*)((ng3)));
    t40 = (t0 + 3848);
    xsi_vlogvar_assign_value(t40, t27, 0, 0, 2);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB31;

LAB35:    xsi_set_current_line(156, ng0);

LAB38:    xsi_set_current_line(157, ng0);
    t7 = ((char*)((ng4)));
    t11 = (t0 + 3848);
    xsi_vlogvar_assign_value(t11, t7, 0, 0, 2);
    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(159, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB37;

LAB40:    *((unsigned int *)t12) = 1;
    goto LAB43;

LAB42:    t7 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB43;

LAB44:    *((unsigned int *)t6) = 1;
    goto LAB47;

LAB49:    t34 = *((unsigned int *)t6);
    t36 = *((unsigned int *)t18);
    *((unsigned int *)t6) = (t34 | t36);
    t37 = *((unsigned int *)t17);
    t38 = *((unsigned int *)t18);
    *((unsigned int *)t17) = (t37 | t38);
    goto LAB48;

LAB50:    xsi_set_current_line(172, ng0);

LAB53:    xsi_set_current_line(174, ng0);
    t27 = ((char*)((ng1)));
    t40 = (t0 + 4328);
    xsi_vlogvar_assign_value(t40, t27, 0, 0, 1);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(180, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(182, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(190, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t12 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 2);
    t10 = (t9 & 1);
    *((unsigned int *)t12) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 2);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    memset(t6, 0, 8);
    t5 = (t12 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB57;

LAB55:    if (*((unsigned int *)t5) == 0)
        goto LAB54;

LAB56:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;

LAB57:    t11 = (t6 + 4);
    t24 = *((unsigned int *)t11);
    t25 = (~(t24));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t25);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB58;

LAB59:    xsi_set_current_line(217, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t6 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t6);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(245, ng0);

LAB66:    xsi_set_current_line(247, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(248, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(249, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(250, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(252, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(253, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(255, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(258, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t12 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t12) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    memset(t6, 0, 8);
    t5 = (t12 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB70;

LAB68:    if (*((unsigned int *)t5) == 0)
        goto LAB67;

LAB69:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;

LAB70:    t11 = (t6 + 4);
    t24 = *((unsigned int *)t11);
    t25 = (~(t24));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t25);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(274, ng0);

LAB75:    xsi_set_current_line(276, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(277, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(278, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(280, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(281, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(284, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);

LAB73:
LAB64:
LAB60:    goto LAB52;

LAB54:    *((unsigned int *)t6) = 1;
    goto LAB57;

LAB58:    xsi_set_current_line(190, ng0);

LAB61:    xsi_set_current_line(192, ng0);
    t16 = ((char*)((ng1)));
    t17 = (t0 + 1608);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 1);
    xsi_set_current_line(193, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(194, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(195, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(196, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    *((unsigned int *)t6) = t9;
    t10 = *((unsigned int *)t4);
    t13 = (t10 >> 0);
    *((unsigned int *)t2) = t13;
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);
    t5 = (t0 + 2088);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 2);
    xsi_set_current_line(197, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(198, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(200, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(201, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(202, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(204, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(206, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(209, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    goto LAB60;

LAB62:    xsi_set_current_line(217, ng0);

LAB65:    xsi_set_current_line(219, ng0);
    t7 = ((char*)((ng1)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t7, 0, 0, 1);
    xsi_set_current_line(220, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(221, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(222, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(223, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(224, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(225, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(227, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(228, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(229, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(231, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(233, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(236, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    goto LAB64;

LAB67:    *((unsigned int *)t6) = 1;
    goto LAB70;

LAB71:    xsi_set_current_line(258, ng0);

LAB74:    xsi_set_current_line(260, ng0);
    t16 = ((char*)((ng3)));
    t17 = (t0 + 1608);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 1);
    xsi_set_current_line(261, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(262, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(264, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(265, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(268, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    goto LAB73;

LAB76:    *((unsigned int *)t12) = 1;
    goto LAB79;

LAB78:    t7 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB79;

LAB80:    *((unsigned int *)t6) = 1;
    goto LAB83;

LAB85:    t34 = *((unsigned int *)t6);
    t36 = *((unsigned int *)t18);
    *((unsigned int *)t6) = (t34 | t36);
    t37 = *((unsigned int *)t17);
    t38 = *((unsigned int *)t18);
    *((unsigned int *)t17) = (t37 | t38);
    goto LAB84;

LAB86:    xsi_set_current_line(294, ng0);

LAB89:    xsi_set_current_line(296, ng0);
    t27 = ((char*)((ng1)));
    t40 = (t0 + 1608);
    xsi_vlogvar_assign_value(t40, t27, 0, 0, 1);
    xsi_set_current_line(297, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(298, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(299, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(300, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(301, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(303, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(305, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(314, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t12 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 2);
    t10 = (t9 & 1);
    *((unsigned int *)t12) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 2);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    memset(t6, 0, 8);
    t5 = (t12 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB93;

LAB91:    if (*((unsigned int *)t5) == 0)
        goto LAB90;

LAB92:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;

LAB93:    t11 = (t6 + 4);
    t24 = *((unsigned int *)t11);
    t25 = (~(t24));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t25);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB94;

LAB95:    xsi_set_current_line(349, ng0);

LAB111:    xsi_set_current_line(351, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(352, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(353, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(355, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t0 + 4008);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 1);
    xsi_set_current_line(356, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(357, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(359, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(361, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(364, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t6 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t6);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB112;

LAB113:    xsi_set_current_line(373, ng0);

LAB116:    xsi_set_current_line(375, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(376, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(377, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(378, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);

LAB114:
LAB96:    goto LAB88;

LAB90:    *((unsigned int *)t6) = 1;
    goto LAB93;

LAB94:    xsi_set_current_line(314, ng0);

LAB97:    xsi_set_current_line(316, ng0);
    t16 = (t0 + 1208U);
    t17 = *((char **)t16);
    memset(t50, 0, 8);
    t16 = (t50 + 4);
    t18 = (t17 + 4);
    t32 = *((unsigned int *)t17);
    t33 = (t32 >> 0);
    t34 = (t33 & 1);
    *((unsigned int *)t50) = t34;
    t36 = *((unsigned int *)t18);
    t37 = (t36 >> 0);
    t38 = (t37 & 1);
    *((unsigned int *)t16) = t38;
    memset(t48, 0, 8);
    t26 = (t50 + 4);
    t39 = *((unsigned int *)t26);
    t41 = (~(t39));
    t42 = *((unsigned int *)t50);
    t43 = (t42 & t41);
    t44 = (t43 & 1U);
    if (t44 != 0)
        goto LAB101;

LAB99:    if (*((unsigned int *)t26) == 0)
        goto LAB98;

LAB100:    t27 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t27) = 1;

LAB101:    t40 = (t0 + 3208);
    xsi_vlogvar_assign_value(t40, t48, 0, 0, 1);
    xsi_set_current_line(317, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(318, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t0 + 3528);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 1);
    xsi_set_current_line(319, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(321, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(322, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(323, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t12, 0, 8);
    t2 = (t12 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 0);
    t10 = (t9 & 1);
    *((unsigned int *)t12) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    memset(t6, 0, 8);
    t5 = (t12 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB105;

LAB103:    if (*((unsigned int *)t5) == 0)
        goto LAB102;

LAB104:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;

LAB105:    t11 = (t0 + 4488);
    xsi_vlogvar_assign_value(t11, t6, 0, 0, 1);
    xsi_set_current_line(325, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(327, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(329, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(332, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t2) = t15;
    t5 = (t6 + 4);
    t19 = *((unsigned int *)t5);
    t20 = (~(t19));
    t21 = *((unsigned int *)t6);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB106;

LAB107:    xsi_set_current_line(338, ng0);

LAB110:    xsi_set_current_line(339, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(340, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB108:    goto LAB96;

LAB98:    *((unsigned int *)t48) = 1;
    goto LAB101;

LAB102:    *((unsigned int *)t6) = 1;
    goto LAB105;

LAB106:    xsi_set_current_line(332, ng0);

LAB109:    xsi_set_current_line(333, ng0);
    t7 = ((char*)((ng4)));
    t11 = (t0 + 3848);
    xsi_vlogvar_assign_value(t11, t7, 0, 0, 2);
    xsi_set_current_line(334, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB108;

LAB112:    xsi_set_current_line(364, ng0);

LAB115:    xsi_set_current_line(366, ng0);
    t7 = ((char*)((ng4)));
    t11 = (t0 + 3848);
    xsi_vlogvar_assign_value(t11, t7, 0, 0, 2);
    xsi_set_current_line(367, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(368, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(369, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    goto LAB114;

LAB117:    xsi_set_current_line(385, ng0);

LAB120:    xsi_set_current_line(387, ng0);
    t7 = ((char*)((ng1)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t7, 0, 0, 1);
    xsi_set_current_line(388, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(389, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(390, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(391, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(392, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(393, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(395, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(396, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(397, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(398, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(399, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(401, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(403, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(404, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(405, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(406, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(408, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(409, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(411, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    goto LAB119;

}


extern void work_m_00000000000428266686_0300640388_init()
{
	static char *pe[] = {(void *)Always_72_0};
	xsi_register_didat("work_m_00000000000428266686_0300640388", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000000428266686_0300640388.didat");
	xsi_register_executes(pe);
}
