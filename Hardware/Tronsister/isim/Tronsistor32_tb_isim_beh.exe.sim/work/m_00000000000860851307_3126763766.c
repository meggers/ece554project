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
static const char *ng0 = "//userspace.cae.wisc.edu/people/j/jtruelove/Git/Tronsister/PPU/PPU_SCANGEN.v";
static unsigned int ng1[] = {255U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {15U, 0U};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {2U, 0U};
static unsigned int ng8[] = {3U, 0U};
static unsigned int ng9[] = {4U, 0U};
static unsigned int ng10[] = {5U, 0U};
static unsigned int ng11[] = {6U, 0U};
static unsigned int ng12[] = {7U, 0U};



static void Always_58_0(char *t0)
{
    char t11[8];
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

LAB0:    t1 = (t0 + 7488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 10040);
    *((int *)t2) = 1;
    t3 = (t0 + 7520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(58, ng0);

LAB5:    xsi_set_current_line(59, ng0);
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

LAB7:    xsi_set_current_line(62, ng0);
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

LAB11:    xsi_set_current_line(69, ng0);

LAB23:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1688U);
    t4 = *((char **)t3);
    xsi_vlogtype_concat(t11, 10, 10, 2U, t4, 2, t2, 8);
    t3 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t3, t11, 0, 0, 10, 0LL);

LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(59, ng0);

LAB9:    xsi_set_current_line(60, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 1688U);
    t14 = *((char **)t13);
    xsi_vlogtype_concat(t11, 10, 10, 2U, t14, 2, t12, 8);
    t13 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t13, t11, 0, 0, 10, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(62, ng0);

LAB13:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 6408);
    t5 = (t4 + 56U);
    t12 = *((char **)t5);
    t13 = ((char*)((ng2)));
    memset(t11, 0, 8);
    t14 = (t12 + 4);
    t15 = (t13 + 4);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t13);
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

LAB15:    *((unsigned int *)t11) = 1;

LAB17:    t29 = (t11 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t11);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(65, ng0);

LAB22:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 6408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_minus(t11, 32, t4, 10, t5, 32);
    t12 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 10, 0LL);

LAB20:    goto LAB12;

LAB16:    t28 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(63, ng0);

LAB21:    xsi_set_current_line(64, ng0);
    t35 = ((char*)((ng2)));
    t36 = (t0 + 6408);
    xsi_vlogvar_wait_assign_value(t36, t35, 0, 0, 10, 0LL);
    goto LAB20;

}

static void Cont_76_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t40[8];
    char t41[8];
    char t42[8];
    char t53[8];
    char t80[8];
    char t87[8];
    char t88[8];
    char t89[8];
    char t100[8];
    char t127[8];
    char t134[8];
    char t135[8];
    char t136[8];
    char t147[8];
    char t174[8];
    char t181[8];
    char t182[8];
    char t183[8];
    char t194[8];
    char t221[8];
    char t228[8];
    char t229[8];
    char t230[8];
    char t241[8];
    char t268[8];
    char t275[8];
    char t276[8];
    char t277[8];
    char t288[8];
    char t315[8];
    char t322[8];
    char t323[8];
    char t324[8];
    char t335[8];
    char t362[8];
    char t369[8];
    char t370[8];
    char t371[8];
    char t382[8];
    char t409[8];
    char t416[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
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
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
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
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t101;
    char *t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    char *t128;
    char *t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    char *t146;
    char *t148;
    char *t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    char *t162;
    char *t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    char *t169;
    char *t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    char *t175;
    char *t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    char *t184;
    char *t185;
    char *t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    char *t193;
    char *t195;
    char *t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    unsigned int t201;
    unsigned int t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    unsigned int t208;
    char *t209;
    char *t210;
    unsigned int t211;
    unsigned int t212;
    unsigned int t213;
    unsigned int t214;
    unsigned int t215;
    char *t216;
    char *t217;
    unsigned int t218;
    unsigned int t219;
    unsigned int t220;
    char *t222;
    char *t223;
    unsigned int t224;
    unsigned int t225;
    unsigned int t226;
    unsigned int t227;
    char *t231;
    char *t232;
    char *t233;
    unsigned int t234;
    unsigned int t235;
    unsigned int t236;
    unsigned int t237;
    unsigned int t238;
    unsigned int t239;
    char *t240;
    char *t242;
    char *t243;
    unsigned int t244;
    unsigned int t245;
    unsigned int t246;
    unsigned int t247;
    unsigned int t248;
    unsigned int t249;
    unsigned int t250;
    unsigned int t251;
    unsigned int t252;
    unsigned int t253;
    unsigned int t254;
    unsigned int t255;
    char *t256;
    char *t257;
    unsigned int t258;
    unsigned int t259;
    unsigned int t260;
    unsigned int t261;
    unsigned int t262;
    char *t263;
    char *t264;
    unsigned int t265;
    unsigned int t266;
    unsigned int t267;
    char *t269;
    char *t270;
    unsigned int t271;
    unsigned int t272;
    unsigned int t273;
    unsigned int t274;
    char *t278;
    char *t279;
    char *t280;
    unsigned int t281;
    unsigned int t282;
    unsigned int t283;
    unsigned int t284;
    unsigned int t285;
    unsigned int t286;
    char *t287;
    char *t289;
    char *t290;
    unsigned int t291;
    unsigned int t292;
    unsigned int t293;
    unsigned int t294;
    unsigned int t295;
    unsigned int t296;
    unsigned int t297;
    unsigned int t298;
    unsigned int t299;
    unsigned int t300;
    unsigned int t301;
    unsigned int t302;
    char *t303;
    char *t304;
    unsigned int t305;
    unsigned int t306;
    unsigned int t307;
    unsigned int t308;
    unsigned int t309;
    char *t310;
    char *t311;
    unsigned int t312;
    unsigned int t313;
    unsigned int t314;
    char *t316;
    char *t317;
    unsigned int t318;
    unsigned int t319;
    unsigned int t320;
    unsigned int t321;
    char *t325;
    char *t326;
    char *t327;
    unsigned int t328;
    unsigned int t329;
    unsigned int t330;
    unsigned int t331;
    unsigned int t332;
    unsigned int t333;
    char *t334;
    char *t336;
    char *t337;
    unsigned int t338;
    unsigned int t339;
    unsigned int t340;
    unsigned int t341;
    unsigned int t342;
    unsigned int t343;
    unsigned int t344;
    unsigned int t345;
    unsigned int t346;
    unsigned int t347;
    unsigned int t348;
    unsigned int t349;
    char *t350;
    char *t351;
    unsigned int t352;
    unsigned int t353;
    unsigned int t354;
    unsigned int t355;
    unsigned int t356;
    char *t357;
    char *t358;
    unsigned int t359;
    unsigned int t360;
    unsigned int t361;
    char *t363;
    char *t364;
    unsigned int t365;
    unsigned int t366;
    unsigned int t367;
    unsigned int t368;
    char *t372;
    char *t373;
    char *t374;
    unsigned int t375;
    unsigned int t376;
    unsigned int t377;
    unsigned int t378;
    unsigned int t379;
    unsigned int t380;
    char *t381;
    char *t383;
    char *t384;
    unsigned int t385;
    unsigned int t386;
    unsigned int t387;
    unsigned int t388;
    unsigned int t389;
    unsigned int t390;
    unsigned int t391;
    unsigned int t392;
    unsigned int t393;
    unsigned int t394;
    unsigned int t395;
    unsigned int t396;
    char *t397;
    char *t398;
    unsigned int t399;
    unsigned int t400;
    unsigned int t401;
    unsigned int t402;
    unsigned int t403;
    char *t404;
    char *t405;
    unsigned int t406;
    unsigned int t407;
    unsigned int t408;
    char *t410;
    char *t411;
    unsigned int t412;
    unsigned int t413;
    unsigned int t414;
    unsigned int t415;
    char *t417;
    char *t418;
    char *t419;
    char *t420;
    char *t421;
    char *t422;
    char *t423;
    unsigned int t424;
    unsigned int t425;
    char *t426;
    unsigned int t427;
    unsigned int t428;
    char *t429;
    unsigned int t430;
    unsigned int t431;
    char *t432;

LAB0:    t1 = (t0 + 7736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 6408);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t419 = (t0 + 10264);
    t420 = (t419 + 56U);
    t421 = *((char **)t420);
    t422 = (t421 + 56U);
    t423 = *((char **)t422);
    memset(t423, 0, 8);
    t424 = 31U;
    t425 = t424;
    t426 = (t3 + 4);
    t427 = *((unsigned int *)t3);
    t424 = (t424 & t427);
    t428 = *((unsigned int *)t426);
    t425 = (t425 & t428);
    t429 = (t423 + 4);
    t430 = *((unsigned int *)t423);
    *((unsigned int *)t423) = (t430 | t424);
    t431 = *((unsigned int *)t429);
    *((unsigned int *)t429) = (t431 | t425);
    xsi_driver_vfirst_trans(t419, 0, 4);
    t432 = (t0 + 10056);
    *((int *)t432) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng4)));
    goto LAB13;

LAB14:    t43 = (t0 + 3448U);
    t44 = *((char **)t43);
    memset(t42, 0, 8);
    t43 = (t42 + 4);
    t45 = (t44 + 4);
    t46 = *((unsigned int *)t44);
    t47 = (t46 >> 0);
    *((unsigned int *)t42) = t47;
    t48 = *((unsigned int *)t45);
    t49 = (t48 >> 0);
    *((unsigned int *)t43) = t49;
    t50 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t50 & 3U);
    t51 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t51 & 3U);
    t52 = ((char*)((ng5)));
    memset(t53, 0, 8);
    t54 = (t42 + 4);
    t55 = (t52 + 4);
    t56 = *((unsigned int *)t42);
    t57 = *((unsigned int *)t52);
    t58 = (t56 ^ t57);
    t59 = *((unsigned int *)t54);
    t60 = *((unsigned int *)t55);
    t61 = (t59 ^ t60);
    t62 = (t58 | t61);
    t63 = *((unsigned int *)t54);
    t64 = *((unsigned int *)t55);
    t65 = (t63 | t64);
    t66 = (~(t65));
    t67 = (t62 & t66);
    if (t67 != 0)
        goto LAB22;

LAB21:    if (t65 != 0)
        goto LAB23;

LAB24:    memset(t41, 0, 8);
    t69 = (t53 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t53);
    t73 = (t72 & t71);
    t74 = (t73 & 1U);
    if (t74 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t69) != 0)
        goto LAB27;

LAB28:    t76 = (t41 + 4);
    t77 = *((unsigned int *)t41);
    t78 = *((unsigned int *)t76);
    t79 = (t77 || t78);
    if (t79 > 0)
        goto LAB29;

LAB30:    t83 = *((unsigned int *)t41);
    t84 = (~(t83));
    t85 = *((unsigned int *)t76);
    t86 = (t84 || t85);
    if (t86 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t76) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t41) > 0)
        goto LAB35;

LAB36:    memcpy(t40, t87, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 5, t35, 5, t40, 5);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

LAB22:    *((unsigned int *)t53) = 1;
    goto LAB24;

LAB23:    t68 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t68) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t41) = 1;
    goto LAB28;

LAB27:    t75 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB28;

LAB29:    t81 = (t0 + 3448U);
    t82 = *((char **)t81);
    t81 = ((char*)((ng5)));
    xsi_vlogtype_concat(t80, 5, 5, 2U, t81, 1, t82, 4);
    goto LAB30;

LAB31:    t90 = (t0 + 3608U);
    t91 = *((char **)t90);
    memset(t89, 0, 8);
    t90 = (t89 + 4);
    t92 = (t91 + 4);
    t93 = *((unsigned int *)t91);
    t94 = (t93 >> 0);
    *((unsigned int *)t89) = t94;
    t95 = *((unsigned int *)t92);
    t96 = (t95 >> 0);
    *((unsigned int *)t90) = t96;
    t97 = *((unsigned int *)t89);
    *((unsigned int *)t89) = (t97 & 3U);
    t98 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t98 & 3U);
    t99 = ((char*)((ng5)));
    memset(t100, 0, 8);
    t101 = (t89 + 4);
    t102 = (t99 + 4);
    t103 = *((unsigned int *)t89);
    t104 = *((unsigned int *)t99);
    t105 = (t103 ^ t104);
    t106 = *((unsigned int *)t101);
    t107 = *((unsigned int *)t102);
    t108 = (t106 ^ t107);
    t109 = (t105 | t108);
    t110 = *((unsigned int *)t101);
    t111 = *((unsigned int *)t102);
    t112 = (t110 | t111);
    t113 = (~(t112));
    t114 = (t109 & t113);
    if (t114 != 0)
        goto LAB39;

LAB38:    if (t112 != 0)
        goto LAB40;

LAB41:    memset(t88, 0, 8);
    t116 = (t100 + 4);
    t117 = *((unsigned int *)t116);
    t118 = (~(t117));
    t119 = *((unsigned int *)t100);
    t120 = (t119 & t118);
    t121 = (t120 & 1U);
    if (t121 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t116) != 0)
        goto LAB44;

LAB45:    t123 = (t88 + 4);
    t124 = *((unsigned int *)t88);
    t125 = *((unsigned int *)t123);
    t126 = (t124 || t125);
    if (t126 > 0)
        goto LAB46;

LAB47:    t130 = *((unsigned int *)t88);
    t131 = (~(t130));
    t132 = *((unsigned int *)t123);
    t133 = (t131 || t132);
    if (t133 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t123) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t88) > 0)
        goto LAB52;

LAB53:    memcpy(t87, t134, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t40, 5, t80, 5, t87, 5);
    goto LAB37;

LAB35:    memcpy(t40, t80, 8);
    goto LAB37;

LAB39:    *((unsigned int *)t100) = 1;
    goto LAB41;

LAB40:    t115 = (t100 + 4);
    *((unsigned int *)t100) = 1;
    *((unsigned int *)t115) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t88) = 1;
    goto LAB45;

LAB44:    t122 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t122) = 1;
    goto LAB45;

LAB46:    t128 = (t0 + 3608U);
    t129 = *((char **)t128);
    t128 = ((char*)((ng5)));
    xsi_vlogtype_concat(t127, 5, 5, 2U, t128, 1, t129, 4);
    goto LAB47;

LAB48:    t137 = (t0 + 3768U);
    t138 = *((char **)t137);
    memset(t136, 0, 8);
    t137 = (t136 + 4);
    t139 = (t138 + 4);
    t140 = *((unsigned int *)t138);
    t141 = (t140 >> 0);
    *((unsigned int *)t136) = t141;
    t142 = *((unsigned int *)t139);
    t143 = (t142 >> 0);
    *((unsigned int *)t137) = t143;
    t144 = *((unsigned int *)t136);
    *((unsigned int *)t136) = (t144 & 3U);
    t145 = *((unsigned int *)t137);
    *((unsigned int *)t137) = (t145 & 3U);
    t146 = ((char*)((ng5)));
    memset(t147, 0, 8);
    t148 = (t136 + 4);
    t149 = (t146 + 4);
    t150 = *((unsigned int *)t136);
    t151 = *((unsigned int *)t146);
    t152 = (t150 ^ t151);
    t153 = *((unsigned int *)t148);
    t154 = *((unsigned int *)t149);
    t155 = (t153 ^ t154);
    t156 = (t152 | t155);
    t157 = *((unsigned int *)t148);
    t158 = *((unsigned int *)t149);
    t159 = (t157 | t158);
    t160 = (~(t159));
    t161 = (t156 & t160);
    if (t161 != 0)
        goto LAB56;

LAB55:    if (t159 != 0)
        goto LAB57;

LAB58:    memset(t135, 0, 8);
    t163 = (t147 + 4);
    t164 = *((unsigned int *)t163);
    t165 = (~(t164));
    t166 = *((unsigned int *)t147);
    t167 = (t166 & t165);
    t168 = (t167 & 1U);
    if (t168 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t163) != 0)
        goto LAB61;

LAB62:    t170 = (t135 + 4);
    t171 = *((unsigned int *)t135);
    t172 = *((unsigned int *)t170);
    t173 = (t171 || t172);
    if (t173 > 0)
        goto LAB63;

LAB64:    t177 = *((unsigned int *)t135);
    t178 = (~(t177));
    t179 = *((unsigned int *)t170);
    t180 = (t178 || t179);
    if (t180 > 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t170) > 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t135) > 0)
        goto LAB69;

LAB70:    memcpy(t134, t181, 8);

LAB71:    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t87, 5, t127, 5, t134, 5);
    goto LAB54;

LAB52:    memcpy(t87, t127, 8);
    goto LAB54;

LAB56:    *((unsigned int *)t147) = 1;
    goto LAB58;

LAB57:    t162 = (t147 + 4);
    *((unsigned int *)t147) = 1;
    *((unsigned int *)t162) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t135) = 1;
    goto LAB62;

LAB61:    t169 = (t135 + 4);
    *((unsigned int *)t135) = 1;
    *((unsigned int *)t169) = 1;
    goto LAB62;

LAB63:    t175 = (t0 + 3768U);
    t176 = *((char **)t175);
    t175 = ((char*)((ng5)));
    xsi_vlogtype_concat(t174, 5, 5, 2U, t175, 1, t176, 4);
    goto LAB64;

LAB65:    t184 = (t0 + 3928U);
    t185 = *((char **)t184);
    memset(t183, 0, 8);
    t184 = (t183 + 4);
    t186 = (t185 + 4);
    t187 = *((unsigned int *)t185);
    t188 = (t187 >> 0);
    *((unsigned int *)t183) = t188;
    t189 = *((unsigned int *)t186);
    t190 = (t189 >> 0);
    *((unsigned int *)t184) = t190;
    t191 = *((unsigned int *)t183);
    *((unsigned int *)t183) = (t191 & 3U);
    t192 = *((unsigned int *)t184);
    *((unsigned int *)t184) = (t192 & 3U);
    t193 = ((char*)((ng5)));
    memset(t194, 0, 8);
    t195 = (t183 + 4);
    t196 = (t193 + 4);
    t197 = *((unsigned int *)t183);
    t198 = *((unsigned int *)t193);
    t199 = (t197 ^ t198);
    t200 = *((unsigned int *)t195);
    t201 = *((unsigned int *)t196);
    t202 = (t200 ^ t201);
    t203 = (t199 | t202);
    t204 = *((unsigned int *)t195);
    t205 = *((unsigned int *)t196);
    t206 = (t204 | t205);
    t207 = (~(t206));
    t208 = (t203 & t207);
    if (t208 != 0)
        goto LAB73;

LAB72:    if (t206 != 0)
        goto LAB74;

LAB75:    memset(t182, 0, 8);
    t210 = (t194 + 4);
    t211 = *((unsigned int *)t210);
    t212 = (~(t211));
    t213 = *((unsigned int *)t194);
    t214 = (t213 & t212);
    t215 = (t214 & 1U);
    if (t215 != 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t210) != 0)
        goto LAB78;

LAB79:    t217 = (t182 + 4);
    t218 = *((unsigned int *)t182);
    t219 = *((unsigned int *)t217);
    t220 = (t218 || t219);
    if (t220 > 0)
        goto LAB80;

LAB81:    t224 = *((unsigned int *)t182);
    t225 = (~(t224));
    t226 = *((unsigned int *)t217);
    t227 = (t225 || t226);
    if (t227 > 0)
        goto LAB82;

LAB83:    if (*((unsigned int *)t217) > 0)
        goto LAB84;

LAB85:    if (*((unsigned int *)t182) > 0)
        goto LAB86;

LAB87:    memcpy(t181, t228, 8);

LAB88:    goto LAB66;

LAB67:    xsi_vlog_unsigned_bit_combine(t134, 5, t174, 5, t181, 5);
    goto LAB71;

LAB69:    memcpy(t134, t174, 8);
    goto LAB71;

LAB73:    *((unsigned int *)t194) = 1;
    goto LAB75;

LAB74:    t209 = (t194 + 4);
    *((unsigned int *)t194) = 1;
    *((unsigned int *)t209) = 1;
    goto LAB75;

LAB76:    *((unsigned int *)t182) = 1;
    goto LAB79;

LAB78:    t216 = (t182 + 4);
    *((unsigned int *)t182) = 1;
    *((unsigned int *)t216) = 1;
    goto LAB79;

LAB80:    t222 = (t0 + 3928U);
    t223 = *((char **)t222);
    t222 = ((char*)((ng5)));
    xsi_vlogtype_concat(t221, 5, 5, 2U, t222, 1, t223, 4);
    goto LAB81;

LAB82:    t231 = (t0 + 4088U);
    t232 = *((char **)t231);
    memset(t230, 0, 8);
    t231 = (t230 + 4);
    t233 = (t232 + 4);
    t234 = *((unsigned int *)t232);
    t235 = (t234 >> 0);
    *((unsigned int *)t230) = t235;
    t236 = *((unsigned int *)t233);
    t237 = (t236 >> 0);
    *((unsigned int *)t231) = t237;
    t238 = *((unsigned int *)t230);
    *((unsigned int *)t230) = (t238 & 3U);
    t239 = *((unsigned int *)t231);
    *((unsigned int *)t231) = (t239 & 3U);
    t240 = ((char*)((ng5)));
    memset(t241, 0, 8);
    t242 = (t230 + 4);
    t243 = (t240 + 4);
    t244 = *((unsigned int *)t230);
    t245 = *((unsigned int *)t240);
    t246 = (t244 ^ t245);
    t247 = *((unsigned int *)t242);
    t248 = *((unsigned int *)t243);
    t249 = (t247 ^ t248);
    t250 = (t246 | t249);
    t251 = *((unsigned int *)t242);
    t252 = *((unsigned int *)t243);
    t253 = (t251 | t252);
    t254 = (~(t253));
    t255 = (t250 & t254);
    if (t255 != 0)
        goto LAB90;

LAB89:    if (t253 != 0)
        goto LAB91;

LAB92:    memset(t229, 0, 8);
    t257 = (t241 + 4);
    t258 = *((unsigned int *)t257);
    t259 = (~(t258));
    t260 = *((unsigned int *)t241);
    t261 = (t260 & t259);
    t262 = (t261 & 1U);
    if (t262 != 0)
        goto LAB93;

LAB94:    if (*((unsigned int *)t257) != 0)
        goto LAB95;

LAB96:    t264 = (t229 + 4);
    t265 = *((unsigned int *)t229);
    t266 = *((unsigned int *)t264);
    t267 = (t265 || t266);
    if (t267 > 0)
        goto LAB97;

LAB98:    t271 = *((unsigned int *)t229);
    t272 = (~(t271));
    t273 = *((unsigned int *)t264);
    t274 = (t272 || t273);
    if (t274 > 0)
        goto LAB99;

LAB100:    if (*((unsigned int *)t264) > 0)
        goto LAB101;

LAB102:    if (*((unsigned int *)t229) > 0)
        goto LAB103;

LAB104:    memcpy(t228, t275, 8);

LAB105:    goto LAB83;

LAB84:    xsi_vlog_unsigned_bit_combine(t181, 5, t221, 5, t228, 5);
    goto LAB88;

LAB86:    memcpy(t181, t221, 8);
    goto LAB88;

LAB90:    *((unsigned int *)t241) = 1;
    goto LAB92;

LAB91:    t256 = (t241 + 4);
    *((unsigned int *)t241) = 1;
    *((unsigned int *)t256) = 1;
    goto LAB92;

LAB93:    *((unsigned int *)t229) = 1;
    goto LAB96;

LAB95:    t263 = (t229 + 4);
    *((unsigned int *)t229) = 1;
    *((unsigned int *)t263) = 1;
    goto LAB96;

LAB97:    t269 = (t0 + 4088U);
    t270 = *((char **)t269);
    t269 = ((char*)((ng5)));
    xsi_vlogtype_concat(t268, 5, 5, 2U, t269, 1, t270, 4);
    goto LAB98;

LAB99:    t278 = (t0 + 4248U);
    t279 = *((char **)t278);
    memset(t277, 0, 8);
    t278 = (t277 + 4);
    t280 = (t279 + 4);
    t281 = *((unsigned int *)t279);
    t282 = (t281 >> 0);
    *((unsigned int *)t277) = t282;
    t283 = *((unsigned int *)t280);
    t284 = (t283 >> 0);
    *((unsigned int *)t278) = t284;
    t285 = *((unsigned int *)t277);
    *((unsigned int *)t277) = (t285 & 3U);
    t286 = *((unsigned int *)t278);
    *((unsigned int *)t278) = (t286 & 3U);
    t287 = ((char*)((ng5)));
    memset(t288, 0, 8);
    t289 = (t277 + 4);
    t290 = (t287 + 4);
    t291 = *((unsigned int *)t277);
    t292 = *((unsigned int *)t287);
    t293 = (t291 ^ t292);
    t294 = *((unsigned int *)t289);
    t295 = *((unsigned int *)t290);
    t296 = (t294 ^ t295);
    t297 = (t293 | t296);
    t298 = *((unsigned int *)t289);
    t299 = *((unsigned int *)t290);
    t300 = (t298 | t299);
    t301 = (~(t300));
    t302 = (t297 & t301);
    if (t302 != 0)
        goto LAB107;

LAB106:    if (t300 != 0)
        goto LAB108;

LAB109:    memset(t276, 0, 8);
    t304 = (t288 + 4);
    t305 = *((unsigned int *)t304);
    t306 = (~(t305));
    t307 = *((unsigned int *)t288);
    t308 = (t307 & t306);
    t309 = (t308 & 1U);
    if (t309 != 0)
        goto LAB110;

LAB111:    if (*((unsigned int *)t304) != 0)
        goto LAB112;

LAB113:    t311 = (t276 + 4);
    t312 = *((unsigned int *)t276);
    t313 = *((unsigned int *)t311);
    t314 = (t312 || t313);
    if (t314 > 0)
        goto LAB114;

LAB115:    t318 = *((unsigned int *)t276);
    t319 = (~(t318));
    t320 = *((unsigned int *)t311);
    t321 = (t319 || t320);
    if (t321 > 0)
        goto LAB116;

LAB117:    if (*((unsigned int *)t311) > 0)
        goto LAB118;

LAB119:    if (*((unsigned int *)t276) > 0)
        goto LAB120;

LAB121:    memcpy(t275, t322, 8);

LAB122:    goto LAB100;

LAB101:    xsi_vlog_unsigned_bit_combine(t228, 5, t268, 5, t275, 5);
    goto LAB105;

LAB103:    memcpy(t228, t268, 8);
    goto LAB105;

LAB107:    *((unsigned int *)t288) = 1;
    goto LAB109;

LAB108:    t303 = (t288 + 4);
    *((unsigned int *)t288) = 1;
    *((unsigned int *)t303) = 1;
    goto LAB109;

LAB110:    *((unsigned int *)t276) = 1;
    goto LAB113;

LAB112:    t310 = (t276 + 4);
    *((unsigned int *)t276) = 1;
    *((unsigned int *)t310) = 1;
    goto LAB113;

LAB114:    t316 = (t0 + 4248U);
    t317 = *((char **)t316);
    t316 = ((char*)((ng5)));
    xsi_vlogtype_concat(t315, 5, 5, 2U, t316, 1, t317, 4);
    goto LAB115;

LAB116:    t325 = (t0 + 4408U);
    t326 = *((char **)t325);
    memset(t324, 0, 8);
    t325 = (t324 + 4);
    t327 = (t326 + 4);
    t328 = *((unsigned int *)t326);
    t329 = (t328 >> 0);
    *((unsigned int *)t324) = t329;
    t330 = *((unsigned int *)t327);
    t331 = (t330 >> 0);
    *((unsigned int *)t325) = t331;
    t332 = *((unsigned int *)t324);
    *((unsigned int *)t324) = (t332 & 3U);
    t333 = *((unsigned int *)t325);
    *((unsigned int *)t325) = (t333 & 3U);
    t334 = ((char*)((ng5)));
    memset(t335, 0, 8);
    t336 = (t324 + 4);
    t337 = (t334 + 4);
    t338 = *((unsigned int *)t324);
    t339 = *((unsigned int *)t334);
    t340 = (t338 ^ t339);
    t341 = *((unsigned int *)t336);
    t342 = *((unsigned int *)t337);
    t343 = (t341 ^ t342);
    t344 = (t340 | t343);
    t345 = *((unsigned int *)t336);
    t346 = *((unsigned int *)t337);
    t347 = (t345 | t346);
    t348 = (~(t347));
    t349 = (t344 & t348);
    if (t349 != 0)
        goto LAB124;

LAB123:    if (t347 != 0)
        goto LAB125;

LAB126:    memset(t323, 0, 8);
    t351 = (t335 + 4);
    t352 = *((unsigned int *)t351);
    t353 = (~(t352));
    t354 = *((unsigned int *)t335);
    t355 = (t354 & t353);
    t356 = (t355 & 1U);
    if (t356 != 0)
        goto LAB127;

LAB128:    if (*((unsigned int *)t351) != 0)
        goto LAB129;

LAB130:    t358 = (t323 + 4);
    t359 = *((unsigned int *)t323);
    t360 = *((unsigned int *)t358);
    t361 = (t359 || t360);
    if (t361 > 0)
        goto LAB131;

LAB132:    t365 = *((unsigned int *)t323);
    t366 = (~(t365));
    t367 = *((unsigned int *)t358);
    t368 = (t366 || t367);
    if (t368 > 0)
        goto LAB133;

LAB134:    if (*((unsigned int *)t358) > 0)
        goto LAB135;

LAB136:    if (*((unsigned int *)t323) > 0)
        goto LAB137;

LAB138:    memcpy(t322, t369, 8);

LAB139:    goto LAB117;

LAB118:    xsi_vlog_unsigned_bit_combine(t275, 5, t315, 5, t322, 5);
    goto LAB122;

LAB120:    memcpy(t275, t315, 8);
    goto LAB122;

LAB124:    *((unsigned int *)t335) = 1;
    goto LAB126;

LAB125:    t350 = (t335 + 4);
    *((unsigned int *)t335) = 1;
    *((unsigned int *)t350) = 1;
    goto LAB126;

LAB127:    *((unsigned int *)t323) = 1;
    goto LAB130;

LAB129:    t357 = (t323 + 4);
    *((unsigned int *)t323) = 1;
    *((unsigned int *)t357) = 1;
    goto LAB130;

LAB131:    t363 = (t0 + 4408U);
    t364 = *((char **)t363);
    t363 = ((char*)((ng5)));
    xsi_vlogtype_concat(t362, 5, 5, 2U, t363, 1, t364, 4);
    goto LAB132;

LAB133:    t372 = (t0 + 4568U);
    t373 = *((char **)t372);
    memset(t371, 0, 8);
    t372 = (t371 + 4);
    t374 = (t373 + 4);
    t375 = *((unsigned int *)t373);
    t376 = (t375 >> 0);
    *((unsigned int *)t371) = t376;
    t377 = *((unsigned int *)t374);
    t378 = (t377 >> 0);
    *((unsigned int *)t372) = t378;
    t379 = *((unsigned int *)t371);
    *((unsigned int *)t371) = (t379 & 3U);
    t380 = *((unsigned int *)t372);
    *((unsigned int *)t372) = (t380 & 3U);
    t381 = ((char*)((ng5)));
    memset(t382, 0, 8);
    t383 = (t371 + 4);
    t384 = (t381 + 4);
    t385 = *((unsigned int *)t371);
    t386 = *((unsigned int *)t381);
    t387 = (t385 ^ t386);
    t388 = *((unsigned int *)t383);
    t389 = *((unsigned int *)t384);
    t390 = (t388 ^ t389);
    t391 = (t387 | t390);
    t392 = *((unsigned int *)t383);
    t393 = *((unsigned int *)t384);
    t394 = (t392 | t393);
    t395 = (~(t394));
    t396 = (t391 & t395);
    if (t396 != 0)
        goto LAB141;

LAB140:    if (t394 != 0)
        goto LAB142;

LAB143:    memset(t370, 0, 8);
    t398 = (t382 + 4);
    t399 = *((unsigned int *)t398);
    t400 = (~(t399));
    t401 = *((unsigned int *)t382);
    t402 = (t401 & t400);
    t403 = (t402 & 1U);
    if (t403 != 0)
        goto LAB144;

LAB145:    if (*((unsigned int *)t398) != 0)
        goto LAB146;

LAB147:    t405 = (t370 + 4);
    t406 = *((unsigned int *)t370);
    t407 = *((unsigned int *)t405);
    t408 = (t406 || t407);
    if (t408 > 0)
        goto LAB148;

LAB149:    t412 = *((unsigned int *)t370);
    t413 = (~(t412));
    t414 = *((unsigned int *)t405);
    t415 = (t413 || t414);
    if (t415 > 0)
        goto LAB150;

LAB151:    if (*((unsigned int *)t405) > 0)
        goto LAB152;

LAB153:    if (*((unsigned int *)t370) > 0)
        goto LAB154;

LAB155:    memcpy(t369, t416, 8);

LAB156:    goto LAB134;

LAB135:    xsi_vlog_unsigned_bit_combine(t322, 5, t362, 5, t369, 5);
    goto LAB139;

LAB137:    memcpy(t322, t362, 8);
    goto LAB139;

LAB141:    *((unsigned int *)t382) = 1;
    goto LAB143;

LAB142:    t397 = (t382 + 4);
    *((unsigned int *)t382) = 1;
    *((unsigned int *)t397) = 1;
    goto LAB143;

LAB144:    *((unsigned int *)t370) = 1;
    goto LAB147;

LAB146:    t404 = (t370 + 4);
    *((unsigned int *)t370) = 1;
    *((unsigned int *)t404) = 1;
    goto LAB147;

LAB148:    t410 = (t0 + 4568U);
    t411 = *((char **)t410);
    t410 = ((char*)((ng5)));
    xsi_vlogtype_concat(t409, 5, 5, 2U, t410, 1, t411, 4);
    goto LAB149;

LAB150:    t417 = (t0 + 4728U);
    t418 = *((char **)t417);
    t417 = ((char*)((ng6)));
    xsi_vlogtype_concat(t416, 5, 5, 2U, t417, 1, t418, 4);
    goto LAB151;

LAB152:    xsi_vlog_unsigned_bit_combine(t369, 5, t409, 5, t416, 5);
    goto LAB156;

LAB154:    memcpy(t369, t409, 8);
    goto LAB156;

}

static void implSig1_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 7984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10328);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10072);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng5)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}

static void implSig2_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 8232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10392);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10088);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng6)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}

static void implSig3_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 8480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10456);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10104);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng7)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}

static void implSig4_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 8728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10520);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10120);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng8)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}

static void implSig5_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 8976U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10584);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10136);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng9)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}

static void implSig6_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 9224U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10648);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10152);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng10)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}

static void implSig7_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 9472U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10712);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10168);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng11)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}

static void implSig8_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;

LAB0:    t1 = (t0 + 9720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t60, t22, 8);

LAB14:    memset(t4, 0, 8);
    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 & 1U);
    if (t97 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t92) != 0)
        goto LAB28;

LAB29:    t99 = (t4 + 4);
    t100 = *((unsigned int *)t4);
    t101 = *((unsigned int *)t99);
    t102 = (t100 || t101);
    if (t102 > 0)
        goto LAB30;

LAB31:    t104 = *((unsigned int *)t4);
    t105 = (~(t104));
    t106 = *((unsigned int *)t99);
    t107 = (t105 || t106);
    if (t107 > 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t99) > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t4) > 0)
        goto LAB36;

LAB37:    memcpy(t3, t108, 8);

LAB38:    t109 = (t0 + 10776);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    t112 = (t111 + 56U);
    t113 = *((char **)t112);
    memset(t113, 0, 8);
    t114 = 1U;
    t115 = t114;
    t116 = (t3 + 4);
    t117 = *((unsigned int *)t3);
    t114 = (t114 & t117);
    t118 = *((unsigned int *)t116);
    t115 = (t115 & t118);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t120 | t114);
    t121 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t121 | t115);
    xsi_driver_vfirst_trans(t109, 0, 0);
    t122 = (t0 + 10184);
    *((int *)t122) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng12)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB18;

LAB15:    if (t48 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t36) = 1;

LAB18:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t53) != 0)
        goto LAB21;

LAB22:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t52) = 1;
    goto LAB22;

LAB21:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB22;

LAB23:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB25;

LAB26:    *((unsigned int *)t4) = 1;
    goto LAB29;

LAB28:    t98 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t98) = 1;
    goto LAB29;

LAB30:    t103 = ((char*)((ng6)));
    goto LAB31;

LAB32:    t108 = ((char*)((ng5)));
    goto LAB33;

LAB34:    xsi_vlog_unsigned_bit_combine(t3, 1, t103, 1, t108, 1);
    goto LAB38;

LAB36:    memcpy(t3, t103, 8);
    goto LAB38;

}


extern void work_m_00000000000860851307_3126763766_init()
{
	static char *pe[] = {(void *)Always_58_0,(void *)Cont_76_1,(void *)implSig1_execute,(void *)implSig2_execute,(void *)implSig3_execute,(void *)implSig4_execute,(void *)implSig5_execute,(void *)implSig6_execute,(void *)implSig7_execute,(void *)implSig8_execute};
	xsi_register_didat("work_m_00000000000860851307_3126763766", "isim/Tronsistor32_tb_isim_beh.exe.sim/work/m_00000000000860851307_3126763766.didat");
	xsi_register_executes(pe);
}
