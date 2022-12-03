{-# OPTIONS_GHC -w #-}
module Parser
  ( parseMain
  ) where

import Data.ByteString.Lazy.Char8 (ByteString)

import qualified Lexer as Lex
import AST
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
	= HappyTerminal (Lex.Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,1089) ([0,8192,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,32,0,4096,160,8128,8,0,0,0,0,0,0,0,0,64,0,1024,0,0,0,0,0,0,0,0,0,16,64,4128,0,0,0,0,0,0,256,0,0,0,0,40960,49152,2079,0,0,1280,65024,64,0,0,40,2032,2,0,16384,32768,0,0,0,2560,64512,129,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,16,0,4128,0,0,0,0,0,0,0,20,1016,1,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,16384,32768,0,0,0,0,1024,0,0,0,0,0,0,0,128,0,33024,0,0,8192,0,0,0,0,0,32768,0,0,256,2,768,1,0,4096,0,0,0,0,0,0,4,0,128,0,0,0,0,20480,57344,1039,0,0,0,256,0,0,18496,150,1020,0,0,40960,49152,2079,0,0,1280,65024,64,0,2048,0,4096,0,0,0,0,128,0,8192,60196,65535,13,0,0,0,0,0,0,32832,2,8319,0,16384,38472,64512,3,0,16896,1202,8160,0,0,0,1,2,0,32768,11408,63489,7,0,33792,2404,16320,0,0,9248,75,510,0,0,22817,61442,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,40,2032,2,0,0,0,0,0,0,0,0,0,0,0,16,32,8,0,32768,2,8319,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,2048,4096,1024,0,16384,0,32768,64,0,0,2048,16388,0,0,0,4,0,0,0,128,256,64,0,0,0,0,0,0,0,16384,0,0,0,256,512,128,0,2048,0,4096,8,0,32768,32768,2048,0,0,2,0,516,0,8448,65289,19,0,0,18696,0,0,0,16384,54856,65535,27,0,0,256,0,0,0,0,0,1024,0,32768,48272,65535,63,0,0,128,0,0,0,0,0,8192,0,0,4096,8192,528,0,2048,64217,32767,3,0,22592,65494,7167,0,0,12,0,0,0,0,1280,65024,64,0,0,0,0,0,0,25732,49161,63,0,8192,19236,65024,1,0,8448,601,4080,0,0,51464,32786,127,0,16384,38472,64512,3,0,16896,1202,8160,0,0,37392,37,255,0,32768,11408,63489,7,0,33792,2404,16320,0,0,9248,75,510,0,0,22817,61442,15,0,2048,4809,32640,0,0,18496,150,1020,0,0,45634,57348,31,0,4096,61586,511,2,0,36992,65412,4111,0,0,9348,24572,0,0,8192,57636,639,0,0,8448,3849,0,0,0,18696,120,0,0,16384,49736,3,0,0,16896,7698,0,0,0,37392,240,0,0,32768,33936,7,0,0,33792,36,0,0,0,9248,1,0,0,0,2337,0,0,0,2048,24649,0,0,0,384,0,0,0,0,45634,57348,31,0,4096,9618,65280,0,0,0,40,2032,10,0,16384,32768,8192,0,8192,19236,65024,1,0,8448,601,4080,0,0,0,0,0,0,0,0,0,0,0,0,32,64,16,0,37392,37,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,8192,2048,0,0,256,256,16,0,0,0,0,0,0,16384,16384,1024,0,0,256,512,128,0,36992,300,2040,0,0,25732,65533,447,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,128,0,16896,65202,24575,0,0,0,2,8194,0,32768,44176,65535,55,0,33792,64548,32895,1,0,0,0,16388,0,0,1040,0,4640,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1280,65024,64,0,53376,65452,14335,0,0,9348,32764,128,0,8192,19236,65024,1,0,8448,65289,8223,0,0,51464,32786,127,0,0,0,0,0,0,0,160,8128,8,0,37392,37,255,0,32768,11408,63489,7,0,33792,2404,16320,32,0,0,0,0,0,0,2337,8191,96,0,2048,4809,32640,64,0,0,0,0,0,0,4674,16382,192,0,4096,62866,65535,38,0,0,0,0,0,0,9348,32764,128,0,8192,19236,65024,1,0,8448,65289,24607,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseMain","start","decl","let_binding","pattern","expr","pattern_matching","pattern_match","type","parameter","constant","list__expr__','__","list__expr__';'__","list__pattern__','__","list__pattern__';'__","list1__decl__';;'__","list1__let_binding__and__","list1__pattern_match__'|'__","list1__type__'*'__","list_nosep__parameter__","list_nosep__pattern__","list_nosep1__parameter__","list1__expr__','__","list1__expr__';'__","list1__pattern__','__","list1__pattern__';'__","list_nosep1__pattern__","let","in","and","rec","as","if","then","else","match","with","when","fun","'('","')'","'['","']'","'+'","'-'","'*'","'/'","'<'","'<='","'='","'<>'","'>='","'>'","'&&'","'||'","'!'","id","constr","int","float","string","true","false","':'","'::'","';'","';;'","','","'->'","'_'","apo","'|'","%eof"]
        bit_start = st Prelude.* 75
        bit_end = (st Prelude.+ 1) Prelude.* 75
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..74]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (30) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (18) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (30) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 (18) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (69) = happyReduce_73
action_2 (75) = happyReduce_73
action_2 _ = happyReduce_73

action_3 (69) = happyShift action_23
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (33) = happyShift action_12
action_4 (42) = happyShift action_13
action_4 (44) = happyShift action_14
action_4 (59) = happyShift action_15
action_4 (60) = happyShift action_16
action_4 (61) = happyShift action_17
action_4 (62) = happyShift action_18
action_4 (63) = happyShift action_19
action_4 (64) = happyShift action_20
action_4 (65) = happyShift action_21
action_4 (72) = happyShift action_22
action_4 (6) = happyGoto action_8
action_4 (7) = happyGoto action_9
action_4 (13) = happyGoto action_10
action_4 (19) = happyGoto action_11
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (75) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (69) = happyShift action_7
action_6 _ = happyReduce_1

action_7 (30) = happyShift action_4
action_7 (5) = happyGoto action_24
action_7 _ = happyReduce_2

action_8 (31) = happyReduce_75
action_8 (32) = happyReduce_75
action_8 (69) = happyReduce_75
action_8 (75) = happyReduce_75
action_8 _ = happyReduce_75

action_9 (34) = happyShift action_42
action_9 (52) = happyShift action_43
action_9 (67) = happyShift action_44
action_9 (74) = happyShift action_45
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_9

action_11 (32) = happyShift action_41
action_11 _ = happyReduce_3

action_12 (42) = happyShift action_13
action_12 (44) = happyShift action_14
action_12 (59) = happyShift action_15
action_12 (60) = happyShift action_16
action_12 (61) = happyShift action_17
action_12 (62) = happyShift action_18
action_12 (63) = happyShift action_19
action_12 (64) = happyShift action_20
action_12 (65) = happyShift action_21
action_12 (72) = happyShift action_22
action_12 (6) = happyGoto action_8
action_12 (7) = happyGoto action_9
action_12 (13) = happyGoto action_10
action_12 (19) = happyGoto action_40
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (42) = happyShift action_13
action_13 (44) = happyShift action_14
action_13 (59) = happyShift action_28
action_13 (60) = happyShift action_16
action_13 (61) = happyShift action_17
action_13 (62) = happyShift action_18
action_13 (63) = happyShift action_19
action_13 (64) = happyShift action_20
action_13 (65) = happyShift action_21
action_13 (72) = happyShift action_22
action_13 (7) = happyGoto action_37
action_13 (13) = happyGoto action_10
action_13 (16) = happyGoto action_38
action_13 (27) = happyGoto action_39
action_13 _ = happyReduce_70

action_14 (42) = happyShift action_13
action_14 (44) = happyShift action_14
action_14 (59) = happyShift action_28
action_14 (60) = happyShift action_16
action_14 (61) = happyShift action_17
action_14 (62) = happyShift action_18
action_14 (63) = happyShift action_19
action_14 (64) = happyShift action_20
action_14 (65) = happyShift action_21
action_14 (72) = happyShift action_22
action_14 (7) = happyGoto action_34
action_14 (13) = happyGoto action_10
action_14 (17) = happyGoto action_35
action_14 (28) = happyGoto action_36
action_14 _ = happyReduce_72

action_15 (42) = happyShift action_32
action_15 (59) = happyShift action_33
action_15 (66) = happyReduce_82
action_15 (12) = happyGoto action_29
action_15 (22) = happyGoto action_30
action_15 (24) = happyGoto action_31
action_15 _ = happyReduce_7

action_16 (34) = happyReduce_84
action_16 (40) = happyReduce_84
action_16 (42) = happyShift action_13
action_16 (43) = happyReduce_84
action_16 (44) = happyShift action_14
action_16 (45) = happyReduce_84
action_16 (52) = happyReduce_84
action_16 (59) = happyShift action_28
action_16 (60) = happyShift action_16
action_16 (61) = happyShift action_17
action_16 (62) = happyShift action_18
action_16 (63) = happyShift action_19
action_16 (64) = happyShift action_20
action_16 (65) = happyShift action_21
action_16 (66) = happyReduce_84
action_16 (67) = happyReduce_84
action_16 (68) = happyReduce_84
action_16 (70) = happyReduce_84
action_16 (71) = happyReduce_84
action_16 (72) = happyShift action_22
action_16 (74) = happyReduce_84
action_16 (7) = happyGoto action_25
action_16 (13) = happyGoto action_10
action_16 (23) = happyGoto action_26
action_16 (29) = happyGoto action_27
action_16 _ = happyReduce_84

action_17 _ = happyReduce_60

action_18 _ = happyReduce_61

action_19 _ = happyReduce_62

action_20 _ = happyReduce_63

action_21 _ = happyReduce_64

action_22 _ = happyReduce_8

action_23 (30) = happyShift action_4
action_23 (5) = happyGoto action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_74

action_25 (34) = happyShift action_42
action_25 (40) = happyReduce_95
action_25 (42) = happyReduce_95
action_25 (43) = happyReduce_95
action_25 (44) = happyReduce_95
action_25 (45) = happyReduce_95
action_25 (52) = happyReduce_95
action_25 (59) = happyReduce_95
action_25 (60) = happyReduce_95
action_25 (61) = happyReduce_95
action_25 (62) = happyReduce_95
action_25 (63) = happyReduce_95
action_25 (64) = happyReduce_95
action_25 (65) = happyReduce_95
action_25 (66) = happyReduce_95
action_25 (67) = happyShift action_44
action_25 (68) = happyReduce_95
action_25 (70) = happyReduce_95
action_25 (71) = happyReduce_95
action_25 (72) = happyReduce_95
action_25 (74) = happyShift action_45
action_25 _ = happyReduce_95

action_26 (34) = happyReduce_14
action_26 (40) = happyReduce_14
action_26 (42) = happyReduce_14
action_26 (43) = happyReduce_14
action_26 (44) = happyReduce_14
action_26 (45) = happyReduce_14
action_26 (52) = happyReduce_14
action_26 (59) = happyReduce_14
action_26 (60) = happyReduce_14
action_26 (61) = happyReduce_14
action_26 (62) = happyReduce_14
action_26 (63) = happyReduce_14
action_26 (64) = happyReduce_14
action_26 (65) = happyReduce_14
action_26 (66) = happyReduce_14
action_26 (67) = happyReduce_14
action_26 (68) = happyReduce_14
action_26 (70) = happyReduce_14
action_26 (71) = happyReduce_14
action_26 (72) = happyReduce_14
action_26 (74) = happyReduce_14
action_26 _ = happyReduce_14

action_27 (34) = happyReduce_83
action_27 (40) = happyReduce_83
action_27 (42) = happyShift action_13
action_27 (43) = happyReduce_83
action_27 (44) = happyShift action_14
action_27 (45) = happyReduce_83
action_27 (52) = happyReduce_83
action_27 (59) = happyShift action_28
action_27 (60) = happyShift action_16
action_27 (61) = happyShift action_17
action_27 (62) = happyShift action_18
action_27 (63) = happyShift action_19
action_27 (64) = happyShift action_20
action_27 (65) = happyShift action_21
action_27 (66) = happyReduce_83
action_27 (67) = happyReduce_83
action_27 (68) = happyReduce_83
action_27 (70) = happyReduce_83
action_27 (71) = happyReduce_83
action_27 (72) = happyShift action_22
action_27 (74) = happyReduce_83
action_27 (7) = happyGoto action_71
action_27 (13) = happyGoto action_10
action_27 _ = happyReduce_83

action_28 _ = happyReduce_7

action_29 (42) = happyReduce_85
action_29 (59) = happyReduce_85
action_29 (66) = happyReduce_85
action_29 (71) = happyReduce_85
action_29 _ = happyReduce_85

action_30 (66) = happyShift action_70
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (42) = happyShift action_32
action_31 (59) = happyShift action_33
action_31 (66) = happyReduce_81
action_31 (12) = happyGoto action_69
action_31 _ = happyReduce_81

action_32 (59) = happyShift action_68
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_58

action_34 (34) = happyShift action_42
action_34 (45) = happyReduce_93
action_34 (67) = happyShift action_44
action_34 (68) = happyReduce_93
action_34 (74) = happyShift action_45
action_34 _ = happyReduce_93

action_35 (45) = happyShift action_67
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (68) = happyShift action_66
action_36 _ = happyReduce_71

action_37 (34) = happyShift action_42
action_37 (43) = happyShift action_64
action_37 (66) = happyShift action_65
action_37 (67) = happyShift action_44
action_37 (70) = happyReduce_91
action_37 (74) = happyShift action_45
action_37 _ = happyReduce_91

action_38 (43) = happyShift action_63
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (70) = happyShift action_62
action_39 _ = happyReduce_69

action_40 (32) = happyShift action_41
action_40 _ = happyReduce_4

action_41 (42) = happyShift action_13
action_41 (44) = happyShift action_14
action_41 (59) = happyShift action_15
action_41 (60) = happyShift action_16
action_41 (61) = happyShift action_17
action_41 (62) = happyShift action_18
action_41 (63) = happyShift action_19
action_41 (64) = happyShift action_20
action_41 (65) = happyShift action_21
action_41 (72) = happyShift action_22
action_41 (6) = happyGoto action_61
action_41 (7) = happyGoto action_9
action_41 (13) = happyGoto action_10
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (59) = happyShift action_60
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (30) = happyShift action_50
action_43 (35) = happyShift action_51
action_43 (38) = happyShift action_52
action_43 (41) = happyShift action_53
action_43 (42) = happyShift action_54
action_43 (44) = happyShift action_55
action_43 (47) = happyShift action_56
action_43 (58) = happyShift action_57
action_43 (59) = happyShift action_58
action_43 (60) = happyShift action_59
action_43 (61) = happyShift action_17
action_43 (62) = happyShift action_18
action_43 (63) = happyShift action_19
action_43 (64) = happyShift action_20
action_43 (65) = happyShift action_21
action_43 (8) = happyGoto action_48
action_43 (13) = happyGoto action_49
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (42) = happyShift action_13
action_44 (44) = happyShift action_14
action_44 (59) = happyShift action_28
action_44 (60) = happyShift action_16
action_44 (61) = happyShift action_17
action_44 (62) = happyShift action_18
action_44 (63) = happyShift action_19
action_44 (64) = happyShift action_20
action_44 (65) = happyShift action_21
action_44 (72) = happyShift action_22
action_44 (7) = happyGoto action_47
action_44 (13) = happyGoto action_10
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (42) = happyShift action_13
action_45 (44) = happyShift action_14
action_45 (59) = happyShift action_28
action_45 (60) = happyShift action_16
action_45 (61) = happyShift action_17
action_45 (62) = happyShift action_18
action_45 (63) = happyShift action_19
action_45 (64) = happyShift action_20
action_45 (65) = happyShift action_21
action_45 (72) = happyShift action_22
action_45 (7) = happyGoto action_46
action_45 (13) = happyGoto action_10
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (34) = happyShift action_42
action_46 (67) = happyShift action_44
action_46 _ = happyReduce_13

action_47 (67) = happyShift action_44
action_47 _ = happyReduce_17

action_48 (30) = happyShift action_50
action_48 (35) = happyShift action_51
action_48 (38) = happyShift action_52
action_48 (41) = happyShift action_53
action_48 (42) = happyShift action_54
action_48 (44) = happyShift action_55
action_48 (46) = happyShift action_95
action_48 (47) = happyShift action_96
action_48 (48) = happyShift action_97
action_48 (49) = happyShift action_98
action_48 (50) = happyShift action_99
action_48 (51) = happyShift action_100
action_48 (52) = happyShift action_101
action_48 (53) = happyShift action_102
action_48 (54) = happyShift action_103
action_48 (55) = happyShift action_104
action_48 (56) = happyShift action_105
action_48 (57) = happyShift action_106
action_48 (58) = happyShift action_57
action_48 (59) = happyShift action_58
action_48 (60) = happyShift action_59
action_48 (61) = happyShift action_17
action_48 (62) = happyShift action_18
action_48 (63) = happyShift action_19
action_48 (64) = happyShift action_20
action_48 (65) = happyShift action_21
action_48 (67) = happyShift action_107
action_48 (68) = happyShift action_108
action_48 (8) = happyGoto action_94
action_48 (13) = happyGoto action_49
action_48 _ = happyReduce_5

action_49 _ = happyReduce_20

action_50 (33) = happyShift action_93
action_50 (42) = happyShift action_13
action_50 (44) = happyShift action_14
action_50 (59) = happyShift action_15
action_50 (60) = happyShift action_16
action_50 (61) = happyShift action_17
action_50 (62) = happyShift action_18
action_50 (63) = happyShift action_19
action_50 (64) = happyShift action_20
action_50 (65) = happyShift action_21
action_50 (72) = happyShift action_22
action_50 (6) = happyGoto action_8
action_50 (7) = happyGoto action_9
action_50 (13) = happyGoto action_10
action_50 (19) = happyGoto action_92
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (30) = happyShift action_50
action_51 (35) = happyShift action_51
action_51 (38) = happyShift action_52
action_51 (41) = happyShift action_53
action_51 (42) = happyShift action_54
action_51 (44) = happyShift action_55
action_51 (47) = happyShift action_56
action_51 (58) = happyShift action_57
action_51 (59) = happyShift action_58
action_51 (60) = happyShift action_59
action_51 (61) = happyShift action_17
action_51 (62) = happyShift action_18
action_51 (63) = happyShift action_19
action_51 (64) = happyShift action_20
action_51 (65) = happyShift action_21
action_51 (8) = happyGoto action_91
action_51 (13) = happyGoto action_49
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (30) = happyShift action_50
action_52 (35) = happyShift action_51
action_52 (38) = happyShift action_52
action_52 (41) = happyShift action_53
action_52 (42) = happyShift action_54
action_52 (44) = happyShift action_55
action_52 (47) = happyShift action_56
action_52 (58) = happyShift action_57
action_52 (59) = happyShift action_58
action_52 (60) = happyShift action_59
action_52 (61) = happyShift action_17
action_52 (62) = happyShift action_18
action_52 (63) = happyShift action_19
action_52 (64) = happyShift action_20
action_52 (65) = happyShift action_21
action_52 (8) = happyGoto action_90
action_52 (13) = happyGoto action_49
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (42) = happyShift action_32
action_53 (59) = happyShift action_33
action_53 (12) = happyGoto action_29
action_53 (24) = happyGoto action_89
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (30) = happyShift action_50
action_54 (35) = happyShift action_51
action_54 (38) = happyShift action_52
action_54 (41) = happyShift action_53
action_54 (42) = happyShift action_54
action_54 (44) = happyShift action_55
action_54 (47) = happyShift action_56
action_54 (58) = happyShift action_57
action_54 (59) = happyShift action_58
action_54 (60) = happyShift action_59
action_54 (61) = happyShift action_17
action_54 (62) = happyShift action_18
action_54 (63) = happyShift action_19
action_54 (64) = happyShift action_20
action_54 (65) = happyShift action_21
action_54 (8) = happyGoto action_86
action_54 (13) = happyGoto action_49
action_54 (14) = happyGoto action_87
action_54 (25) = happyGoto action_88
action_54 _ = happyReduce_66

action_55 (30) = happyShift action_50
action_55 (35) = happyShift action_51
action_55 (38) = happyShift action_52
action_55 (41) = happyShift action_53
action_55 (42) = happyShift action_54
action_55 (44) = happyShift action_55
action_55 (47) = happyShift action_56
action_55 (58) = happyShift action_57
action_55 (59) = happyShift action_58
action_55 (60) = happyShift action_59
action_55 (61) = happyShift action_17
action_55 (62) = happyShift action_18
action_55 (63) = happyShift action_19
action_55 (64) = happyShift action_20
action_55 (65) = happyShift action_21
action_55 (8) = happyGoto action_83
action_55 (13) = happyGoto action_49
action_55 (15) = happyGoto action_84
action_55 (26) = happyGoto action_85
action_55 _ = happyReduce_68

action_56 (30) = happyShift action_50
action_56 (35) = happyShift action_51
action_56 (38) = happyShift action_52
action_56 (41) = happyShift action_53
action_56 (42) = happyShift action_54
action_56 (44) = happyShift action_55
action_56 (47) = happyShift action_56
action_56 (58) = happyShift action_57
action_56 (59) = happyShift action_58
action_56 (60) = happyShift action_59
action_56 (61) = happyShift action_17
action_56 (62) = happyShift action_18
action_56 (63) = happyShift action_19
action_56 (64) = happyShift action_20
action_56 (65) = happyShift action_21
action_56 (8) = happyGoto action_82
action_56 (13) = happyGoto action_49
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (30) = happyShift action_50
action_57 (35) = happyShift action_51
action_57 (38) = happyShift action_52
action_57 (41) = happyShift action_53
action_57 (42) = happyShift action_54
action_57 (44) = happyShift action_55
action_57 (47) = happyShift action_56
action_57 (58) = happyShift action_57
action_57 (59) = happyShift action_58
action_57 (60) = happyShift action_59
action_57 (61) = happyShift action_17
action_57 (62) = happyShift action_18
action_57 (63) = happyShift action_19
action_57 (64) = happyShift action_20
action_57 (65) = happyShift action_21
action_57 (8) = happyGoto action_81
action_57 (13) = happyGoto action_49
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_18

action_59 _ = happyReduce_19

action_60 _ = happyReduce_10

action_61 _ = happyReduce_76

action_62 (42) = happyShift action_13
action_62 (44) = happyShift action_14
action_62 (59) = happyShift action_28
action_62 (60) = happyShift action_16
action_62 (61) = happyShift action_17
action_62 (62) = happyShift action_18
action_62 (63) = happyShift action_19
action_62 (64) = happyShift action_20
action_62 (65) = happyShift action_21
action_62 (72) = happyShift action_22
action_62 (7) = happyGoto action_80
action_62 (13) = happyGoto action_10
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_15

action_64 _ = happyReduce_11

action_65 (42) = happyShift action_74
action_65 (59) = happyShift action_75
action_65 (73) = happyShift action_76
action_65 (11) = happyGoto action_79
action_65 (21) = happyGoto action_73
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (42) = happyShift action_13
action_66 (44) = happyShift action_14
action_66 (59) = happyShift action_28
action_66 (60) = happyShift action_16
action_66 (61) = happyShift action_17
action_66 (62) = happyShift action_18
action_66 (63) = happyShift action_19
action_66 (64) = happyShift action_20
action_66 (65) = happyShift action_21
action_66 (72) = happyShift action_22
action_66 (7) = happyGoto action_78
action_66 (13) = happyGoto action_10
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_16

action_68 (66) = happyShift action_77
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (42) = happyReduce_86
action_69 (59) = happyReduce_86
action_69 (66) = happyReduce_86
action_69 (71) = happyReduce_86
action_69 _ = happyReduce_86

action_70 (42) = happyShift action_74
action_70 (59) = happyShift action_75
action_70 (73) = happyShift action_76
action_70 (11) = happyGoto action_72
action_70 (21) = happyGoto action_73
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (34) = happyShift action_42
action_71 (40) = happyReduce_96
action_71 (42) = happyReduce_96
action_71 (43) = happyReduce_96
action_71 (44) = happyReduce_96
action_71 (45) = happyReduce_96
action_71 (52) = happyReduce_96
action_71 (59) = happyReduce_96
action_71 (60) = happyReduce_96
action_71 (61) = happyReduce_96
action_71 (62) = happyReduce_96
action_71 (63) = happyReduce_96
action_71 (64) = happyReduce_96
action_71 (65) = happyReduce_96
action_71 (66) = happyReduce_96
action_71 (67) = happyShift action_44
action_71 (68) = happyReduce_96
action_71 (70) = happyReduce_96
action_71 (71) = happyReduce_96
action_71 (72) = happyReduce_96
action_71 (74) = happyShift action_45
action_71 _ = happyReduce_96

action_72 (48) = happyReduce_79
action_72 (52) = happyShift action_142
action_72 (59) = happyShift action_136
action_72 (71) = happyShift action_137
action_72 _ = happyReduce_79

action_73 (43) = happyReduce_57
action_73 (48) = happyShift action_141
action_73 (52) = happyReduce_57
action_73 (59) = happyReduce_57
action_73 (71) = happyReduce_57
action_73 _ = happyReduce_57

action_74 (42) = happyShift action_74
action_74 (59) = happyShift action_75
action_74 (73) = happyShift action_76
action_74 (11) = happyGoto action_140
action_74 (21) = happyGoto action_73
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_52

action_76 (59) = happyShift action_139
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (42) = happyShift action_74
action_77 (59) = happyShift action_75
action_77 (73) = happyShift action_76
action_77 (11) = happyGoto action_138
action_77 (21) = happyGoto action_73
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (34) = happyShift action_42
action_78 (67) = happyShift action_44
action_78 (74) = happyShift action_45
action_78 _ = happyReduce_94

action_79 (43) = happyShift action_135
action_79 (48) = happyReduce_79
action_79 (59) = happyShift action_136
action_79 (71) = happyShift action_137
action_79 _ = happyReduce_79

action_80 (34) = happyShift action_42
action_80 (67) = happyShift action_44
action_80 (74) = happyShift action_45
action_80 _ = happyReduce_92

action_81 (30) = happyShift action_50
action_81 (35) = happyShift action_51
action_81 (38) = happyShift action_52
action_81 (41) = happyShift action_53
action_81 (42) = happyShift action_54
action_81 (44) = happyShift action_55
action_81 (46) = happyShift action_95
action_81 (47) = happyShift action_96
action_81 (48) = happyShift action_97
action_81 (49) = happyShift action_98
action_81 (50) = happyShift action_99
action_81 (51) = happyShift action_100
action_81 (52) = happyShift action_101
action_81 (53) = happyShift action_102
action_81 (54) = happyShift action_103
action_81 (55) = happyShift action_104
action_81 (58) = happyShift action_57
action_81 (59) = happyShift action_58
action_81 (60) = happyShift action_59
action_81 (61) = happyShift action_17
action_81 (62) = happyShift action_18
action_81 (63) = happyShift action_19
action_81 (64) = happyShift action_20
action_81 (65) = happyShift action_21
action_81 (8) = happyGoto action_94
action_81 (13) = happyGoto action_49
action_81 _ = happyReduce_40

action_82 (30) = happyShift action_50
action_82 (35) = happyShift action_51
action_82 (38) = happyShift action_52
action_82 (41) = happyShift action_53
action_82 (42) = happyShift action_54
action_82 (44) = happyShift action_55
action_82 (59) = happyShift action_58
action_82 (60) = happyShift action_59
action_82 (61) = happyShift action_17
action_82 (62) = happyShift action_18
action_82 (63) = happyShift action_19
action_82 (64) = happyShift action_20
action_82 (65) = happyShift action_21
action_82 (8) = happyGoto action_94
action_82 (13) = happyGoto action_49
action_82 _ = happyReduce_27

action_83 (30) = happyShift action_50
action_83 (35) = happyShift action_51
action_83 (38) = happyShift action_52
action_83 (41) = happyShift action_53
action_83 (42) = happyShift action_54
action_83 (44) = happyShift action_55
action_83 (45) = happyReduce_89
action_83 (46) = happyShift action_95
action_83 (47) = happyShift action_96
action_83 (48) = happyShift action_97
action_83 (49) = happyShift action_98
action_83 (50) = happyShift action_99
action_83 (51) = happyShift action_100
action_83 (52) = happyShift action_101
action_83 (53) = happyShift action_102
action_83 (54) = happyShift action_103
action_83 (55) = happyShift action_104
action_83 (56) = happyShift action_105
action_83 (57) = happyShift action_106
action_83 (58) = happyShift action_57
action_83 (59) = happyShift action_58
action_83 (60) = happyShift action_59
action_83 (61) = happyShift action_17
action_83 (62) = happyShift action_18
action_83 (63) = happyShift action_19
action_83 (64) = happyShift action_20
action_83 (65) = happyShift action_21
action_83 (67) = happyShift action_107
action_83 (68) = happyShift action_108
action_83 (8) = happyGoto action_94
action_83 (13) = happyGoto action_49
action_83 _ = happyReduce_89

action_84 (45) = happyShift action_134
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (68) = happyShift action_133
action_85 _ = happyReduce_67

action_86 (30) = happyShift action_50
action_86 (35) = happyShift action_51
action_86 (38) = happyShift action_52
action_86 (41) = happyShift action_53
action_86 (42) = happyShift action_54
action_86 (43) = happyShift action_131
action_86 (44) = happyShift action_55
action_86 (46) = happyShift action_95
action_86 (47) = happyShift action_96
action_86 (48) = happyShift action_97
action_86 (49) = happyShift action_98
action_86 (50) = happyShift action_99
action_86 (51) = happyShift action_100
action_86 (52) = happyShift action_101
action_86 (53) = happyShift action_102
action_86 (54) = happyShift action_103
action_86 (55) = happyShift action_104
action_86 (56) = happyShift action_105
action_86 (57) = happyShift action_106
action_86 (58) = happyShift action_57
action_86 (59) = happyShift action_58
action_86 (60) = happyShift action_59
action_86 (61) = happyShift action_17
action_86 (62) = happyShift action_18
action_86 (63) = happyShift action_19
action_86 (64) = happyShift action_20
action_86 (65) = happyShift action_21
action_86 (66) = happyShift action_132
action_86 (67) = happyShift action_107
action_86 (68) = happyShift action_108
action_86 (70) = happyReduce_87
action_86 (8) = happyGoto action_94
action_86 (13) = happyGoto action_49
action_86 _ = happyReduce_87

action_87 (43) = happyShift action_130
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (70) = happyShift action_129
action_88 _ = happyReduce_65

action_89 (42) = happyShift action_32
action_89 (59) = happyShift action_33
action_89 (66) = happyShift action_127
action_89 (71) = happyShift action_128
action_89 (12) = happyGoto action_69
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (30) = happyShift action_50
action_90 (35) = happyShift action_51
action_90 (38) = happyShift action_52
action_90 (39) = happyShift action_126
action_90 (41) = happyShift action_53
action_90 (42) = happyShift action_54
action_90 (44) = happyShift action_55
action_90 (46) = happyShift action_95
action_90 (47) = happyShift action_96
action_90 (48) = happyShift action_97
action_90 (49) = happyShift action_98
action_90 (50) = happyShift action_99
action_90 (51) = happyShift action_100
action_90 (52) = happyShift action_101
action_90 (53) = happyShift action_102
action_90 (54) = happyShift action_103
action_90 (55) = happyShift action_104
action_90 (56) = happyShift action_105
action_90 (57) = happyShift action_106
action_90 (58) = happyShift action_57
action_90 (59) = happyShift action_58
action_90 (60) = happyShift action_59
action_90 (61) = happyShift action_17
action_90 (62) = happyShift action_18
action_90 (63) = happyShift action_19
action_90 (64) = happyShift action_20
action_90 (65) = happyShift action_21
action_90 (67) = happyShift action_107
action_90 (68) = happyShift action_108
action_90 (8) = happyGoto action_94
action_90 (13) = happyGoto action_49
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (30) = happyShift action_50
action_91 (35) = happyShift action_51
action_91 (36) = happyShift action_125
action_91 (38) = happyShift action_52
action_91 (41) = happyShift action_53
action_91 (42) = happyShift action_54
action_91 (44) = happyShift action_55
action_91 (46) = happyShift action_95
action_91 (47) = happyShift action_96
action_91 (48) = happyShift action_97
action_91 (49) = happyShift action_98
action_91 (50) = happyShift action_99
action_91 (51) = happyShift action_100
action_91 (52) = happyShift action_101
action_91 (53) = happyShift action_102
action_91 (54) = happyShift action_103
action_91 (55) = happyShift action_104
action_91 (56) = happyShift action_105
action_91 (57) = happyShift action_106
action_91 (58) = happyShift action_57
action_91 (59) = happyShift action_58
action_91 (60) = happyShift action_59
action_91 (61) = happyShift action_17
action_91 (62) = happyShift action_18
action_91 (63) = happyShift action_19
action_91 (64) = happyShift action_20
action_91 (65) = happyShift action_21
action_91 (67) = happyShift action_107
action_91 (68) = happyShift action_108
action_91 (8) = happyGoto action_94
action_91 (13) = happyGoto action_49
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (31) = happyShift action_124
action_92 (32) = happyShift action_41
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (42) = happyShift action_13
action_93 (44) = happyShift action_14
action_93 (59) = happyShift action_15
action_93 (60) = happyShift action_16
action_93 (61) = happyShift action_17
action_93 (62) = happyShift action_18
action_93 (63) = happyShift action_19
action_93 (64) = happyShift action_20
action_93 (65) = happyShift action_21
action_93 (72) = happyShift action_22
action_93 (6) = happyGoto action_8
action_93 (7) = happyGoto action_9
action_93 (13) = happyGoto action_10
action_93 (19) = happyGoto action_123
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (42) = happyShift action_54
action_94 (44) = happyShift action_55
action_94 (59) = happyShift action_58
action_94 (60) = happyShift action_59
action_94 (61) = happyShift action_17
action_94 (62) = happyShift action_18
action_94 (63) = happyShift action_19
action_94 (64) = happyShift action_20
action_94 (65) = happyShift action_21
action_94 (8) = happyGoto action_94
action_94 (13) = happyGoto action_49
action_94 _ = happyReduce_21

action_95 (30) = happyShift action_50
action_95 (35) = happyShift action_51
action_95 (38) = happyShift action_52
action_95 (41) = happyShift action_53
action_95 (42) = happyShift action_54
action_95 (44) = happyShift action_55
action_95 (47) = happyShift action_56
action_95 (58) = happyShift action_57
action_95 (59) = happyShift action_58
action_95 (60) = happyShift action_59
action_95 (61) = happyShift action_17
action_95 (62) = happyShift action_18
action_95 (63) = happyShift action_19
action_95 (64) = happyShift action_20
action_95 (65) = happyShift action_21
action_95 (8) = happyGoto action_122
action_95 (13) = happyGoto action_49
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (30) = happyShift action_50
action_96 (35) = happyShift action_51
action_96 (38) = happyShift action_52
action_96 (41) = happyShift action_53
action_96 (42) = happyShift action_54
action_96 (44) = happyShift action_55
action_96 (47) = happyShift action_56
action_96 (58) = happyShift action_57
action_96 (59) = happyShift action_58
action_96 (60) = happyShift action_59
action_96 (61) = happyShift action_17
action_96 (62) = happyShift action_18
action_96 (63) = happyShift action_19
action_96 (64) = happyShift action_20
action_96 (65) = happyShift action_21
action_96 (8) = happyGoto action_121
action_96 (13) = happyGoto action_49
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (30) = happyShift action_50
action_97 (35) = happyShift action_51
action_97 (38) = happyShift action_52
action_97 (41) = happyShift action_53
action_97 (42) = happyShift action_54
action_97 (44) = happyShift action_55
action_97 (47) = happyShift action_56
action_97 (58) = happyShift action_57
action_97 (59) = happyShift action_58
action_97 (60) = happyShift action_59
action_97 (61) = happyShift action_17
action_97 (62) = happyShift action_18
action_97 (63) = happyShift action_19
action_97 (64) = happyShift action_20
action_97 (65) = happyShift action_21
action_97 (8) = happyGoto action_120
action_97 (13) = happyGoto action_49
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (30) = happyShift action_50
action_98 (35) = happyShift action_51
action_98 (38) = happyShift action_52
action_98 (41) = happyShift action_53
action_98 (42) = happyShift action_54
action_98 (44) = happyShift action_55
action_98 (47) = happyShift action_56
action_98 (58) = happyShift action_57
action_98 (59) = happyShift action_58
action_98 (60) = happyShift action_59
action_98 (61) = happyShift action_17
action_98 (62) = happyShift action_18
action_98 (63) = happyShift action_19
action_98 (64) = happyShift action_20
action_98 (65) = happyShift action_21
action_98 (8) = happyGoto action_119
action_98 (13) = happyGoto action_49
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (30) = happyShift action_50
action_99 (35) = happyShift action_51
action_99 (38) = happyShift action_52
action_99 (41) = happyShift action_53
action_99 (42) = happyShift action_54
action_99 (44) = happyShift action_55
action_99 (47) = happyShift action_56
action_99 (58) = happyShift action_57
action_99 (59) = happyShift action_58
action_99 (60) = happyShift action_59
action_99 (61) = happyShift action_17
action_99 (62) = happyShift action_18
action_99 (63) = happyShift action_19
action_99 (64) = happyShift action_20
action_99 (65) = happyShift action_21
action_99 (8) = happyGoto action_118
action_99 (13) = happyGoto action_49
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (30) = happyShift action_50
action_100 (35) = happyShift action_51
action_100 (38) = happyShift action_52
action_100 (41) = happyShift action_53
action_100 (42) = happyShift action_54
action_100 (44) = happyShift action_55
action_100 (47) = happyShift action_56
action_100 (58) = happyShift action_57
action_100 (59) = happyShift action_58
action_100 (60) = happyShift action_59
action_100 (61) = happyShift action_17
action_100 (62) = happyShift action_18
action_100 (63) = happyShift action_19
action_100 (64) = happyShift action_20
action_100 (65) = happyShift action_21
action_100 (8) = happyGoto action_117
action_100 (13) = happyGoto action_49
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (30) = happyShift action_50
action_101 (35) = happyShift action_51
action_101 (38) = happyShift action_52
action_101 (41) = happyShift action_53
action_101 (42) = happyShift action_54
action_101 (44) = happyShift action_55
action_101 (47) = happyShift action_56
action_101 (58) = happyShift action_57
action_101 (59) = happyShift action_58
action_101 (60) = happyShift action_59
action_101 (61) = happyShift action_17
action_101 (62) = happyShift action_18
action_101 (63) = happyShift action_19
action_101 (64) = happyShift action_20
action_101 (65) = happyShift action_21
action_101 (8) = happyGoto action_116
action_101 (13) = happyGoto action_49
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (30) = happyShift action_50
action_102 (35) = happyShift action_51
action_102 (38) = happyShift action_52
action_102 (41) = happyShift action_53
action_102 (42) = happyShift action_54
action_102 (44) = happyShift action_55
action_102 (47) = happyShift action_56
action_102 (58) = happyShift action_57
action_102 (59) = happyShift action_58
action_102 (60) = happyShift action_59
action_102 (61) = happyShift action_17
action_102 (62) = happyShift action_18
action_102 (63) = happyShift action_19
action_102 (64) = happyShift action_20
action_102 (65) = happyShift action_21
action_102 (8) = happyGoto action_115
action_102 (13) = happyGoto action_49
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (30) = happyShift action_50
action_103 (35) = happyShift action_51
action_103 (38) = happyShift action_52
action_103 (41) = happyShift action_53
action_103 (42) = happyShift action_54
action_103 (44) = happyShift action_55
action_103 (47) = happyShift action_56
action_103 (58) = happyShift action_57
action_103 (59) = happyShift action_58
action_103 (60) = happyShift action_59
action_103 (61) = happyShift action_17
action_103 (62) = happyShift action_18
action_103 (63) = happyShift action_19
action_103 (64) = happyShift action_20
action_103 (65) = happyShift action_21
action_103 (8) = happyGoto action_114
action_103 (13) = happyGoto action_49
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (30) = happyShift action_50
action_104 (35) = happyShift action_51
action_104 (38) = happyShift action_52
action_104 (41) = happyShift action_53
action_104 (42) = happyShift action_54
action_104 (44) = happyShift action_55
action_104 (47) = happyShift action_56
action_104 (58) = happyShift action_57
action_104 (59) = happyShift action_58
action_104 (60) = happyShift action_59
action_104 (61) = happyShift action_17
action_104 (62) = happyShift action_18
action_104 (63) = happyShift action_19
action_104 (64) = happyShift action_20
action_104 (65) = happyShift action_21
action_104 (8) = happyGoto action_113
action_104 (13) = happyGoto action_49
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (30) = happyShift action_50
action_105 (35) = happyShift action_51
action_105 (38) = happyShift action_52
action_105 (41) = happyShift action_53
action_105 (42) = happyShift action_54
action_105 (44) = happyShift action_55
action_105 (47) = happyShift action_56
action_105 (58) = happyShift action_57
action_105 (59) = happyShift action_58
action_105 (60) = happyShift action_59
action_105 (61) = happyShift action_17
action_105 (62) = happyShift action_18
action_105 (63) = happyShift action_19
action_105 (64) = happyShift action_20
action_105 (65) = happyShift action_21
action_105 (8) = happyGoto action_112
action_105 (13) = happyGoto action_49
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (30) = happyShift action_50
action_106 (35) = happyShift action_51
action_106 (38) = happyShift action_52
action_106 (41) = happyShift action_53
action_106 (42) = happyShift action_54
action_106 (44) = happyShift action_55
action_106 (47) = happyShift action_56
action_106 (58) = happyShift action_57
action_106 (59) = happyShift action_58
action_106 (60) = happyShift action_59
action_106 (61) = happyShift action_17
action_106 (62) = happyShift action_18
action_106 (63) = happyShift action_19
action_106 (64) = happyShift action_20
action_106 (65) = happyShift action_21
action_106 (8) = happyGoto action_111
action_106 (13) = happyGoto action_49
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (30) = happyShift action_50
action_107 (35) = happyShift action_51
action_107 (38) = happyShift action_52
action_107 (41) = happyShift action_53
action_107 (42) = happyShift action_54
action_107 (44) = happyShift action_55
action_107 (47) = happyShift action_56
action_107 (58) = happyShift action_57
action_107 (59) = happyShift action_58
action_107 (60) = happyShift action_59
action_107 (61) = happyShift action_17
action_107 (62) = happyShift action_18
action_107 (63) = happyShift action_19
action_107 (64) = happyShift action_20
action_107 (65) = happyShift action_21
action_107 (8) = happyGoto action_110
action_107 (13) = happyGoto action_49
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (30) = happyShift action_50
action_108 (35) = happyShift action_51
action_108 (38) = happyShift action_52
action_108 (41) = happyShift action_53
action_108 (42) = happyShift action_54
action_108 (44) = happyShift action_55
action_108 (47) = happyShift action_56
action_108 (58) = happyShift action_57
action_108 (59) = happyShift action_58
action_108 (60) = happyShift action_59
action_108 (61) = happyShift action_17
action_108 (62) = happyShift action_18
action_108 (63) = happyShift action_19
action_108 (64) = happyShift action_20
action_108 (65) = happyShift action_21
action_108 (8) = happyGoto action_109
action_108 (13) = happyGoto action_49
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (30) = happyShift action_50
action_109 (35) = happyShift action_51
action_109 (38) = happyShift action_52
action_109 (41) = happyShift action_53
action_109 (42) = happyShift action_54
action_109 (44) = happyShift action_55
action_109 (46) = happyShift action_95
action_109 (47) = happyShift action_96
action_109 (48) = happyShift action_97
action_109 (49) = happyShift action_98
action_109 (50) = happyShift action_99
action_109 (51) = happyShift action_100
action_109 (52) = happyShift action_101
action_109 (53) = happyShift action_102
action_109 (54) = happyShift action_103
action_109 (55) = happyShift action_104
action_109 (56) = happyShift action_105
action_109 (57) = happyShift action_106
action_109 (58) = happyShift action_57
action_109 (59) = happyShift action_58
action_109 (60) = happyShift action_59
action_109 (61) = happyShift action_17
action_109 (62) = happyShift action_18
action_109 (63) = happyShift action_19
action_109 (64) = happyShift action_20
action_109 (65) = happyShift action_21
action_109 (67) = happyShift action_107
action_109 (8) = happyGoto action_94
action_109 (13) = happyGoto action_49
action_109 _ = happyReduce_47

action_110 (30) = happyShift action_50
action_110 (35) = happyShift action_51
action_110 (38) = happyShift action_52
action_110 (41) = happyShift action_53
action_110 (42) = happyShift action_54
action_110 (44) = happyShift action_55
action_110 (46) = happyShift action_95
action_110 (47) = happyShift action_96
action_110 (48) = happyShift action_97
action_110 (49) = happyShift action_98
action_110 (50) = happyShift action_99
action_110 (51) = happyShift action_100
action_110 (52) = happyShift action_101
action_110 (53) = happyShift action_102
action_110 (54) = happyShift action_103
action_110 (55) = happyShift action_104
action_110 (56) = happyShift action_105
action_110 (57) = happyShift action_106
action_110 (58) = happyShift action_57
action_110 (59) = happyShift action_58
action_110 (60) = happyShift action_59
action_110 (61) = happyShift action_17
action_110 (62) = happyShift action_18
action_110 (63) = happyShift action_19
action_110 (64) = happyShift action_20
action_110 (65) = happyShift action_21
action_110 (67) = happyShift action_107
action_110 (8) = happyGoto action_94
action_110 (13) = happyGoto action_49
action_110 _ = happyReduce_25

action_111 (30) = happyShift action_50
action_111 (35) = happyShift action_51
action_111 (38) = happyShift action_52
action_111 (41) = happyShift action_53
action_111 (42) = happyShift action_54
action_111 (44) = happyShift action_55
action_111 (46) = happyShift action_95
action_111 (47) = happyShift action_96
action_111 (48) = happyShift action_97
action_111 (49) = happyShift action_98
action_111 (50) = happyShift action_99
action_111 (51) = happyShift action_100
action_111 (52) = happyShift action_101
action_111 (53) = happyShift action_102
action_111 (54) = happyShift action_103
action_111 (55) = happyShift action_104
action_111 (56) = happyShift action_105
action_111 (58) = happyShift action_57
action_111 (59) = happyShift action_58
action_111 (60) = happyShift action_59
action_111 (61) = happyShift action_17
action_111 (62) = happyShift action_18
action_111 (63) = happyShift action_19
action_111 (64) = happyShift action_20
action_111 (65) = happyShift action_21
action_111 (8) = happyGoto action_94
action_111 (13) = happyGoto action_49
action_111 _ = happyReduce_39

action_112 (30) = happyShift action_50
action_112 (35) = happyShift action_51
action_112 (38) = happyShift action_52
action_112 (41) = happyShift action_53
action_112 (42) = happyShift action_54
action_112 (44) = happyShift action_55
action_112 (46) = happyShift action_95
action_112 (47) = happyShift action_96
action_112 (48) = happyShift action_97
action_112 (49) = happyShift action_98
action_112 (50) = happyShift action_99
action_112 (51) = happyShift action_100
action_112 (52) = happyShift action_101
action_112 (53) = happyShift action_102
action_112 (54) = happyShift action_103
action_112 (55) = happyShift action_104
action_112 (58) = happyShift action_57
action_112 (59) = happyShift action_58
action_112 (60) = happyShift action_59
action_112 (61) = happyShift action_17
action_112 (62) = happyShift action_18
action_112 (63) = happyShift action_19
action_112 (64) = happyShift action_20
action_112 (65) = happyShift action_21
action_112 (8) = happyGoto action_94
action_112 (13) = happyGoto action_49
action_112 _ = happyReduce_38

action_113 (30) = happyShift action_50
action_113 (35) = happyShift action_51
action_113 (38) = happyShift action_52
action_113 (41) = happyShift action_53
action_113 (42) = happyShift action_54
action_113 (44) = happyShift action_55
action_113 (46) = happyShift action_95
action_113 (47) = happyShift action_96
action_113 (48) = happyShift action_97
action_113 (49) = happyShift action_98
action_113 (50) = happyFail []
action_113 (51) = happyFail []
action_113 (52) = happyFail []
action_113 (53) = happyFail []
action_113 (54) = happyFail []
action_113 (55) = happyFail []
action_113 (59) = happyShift action_58
action_113 (60) = happyShift action_59
action_113 (61) = happyShift action_17
action_113 (62) = happyShift action_18
action_113 (63) = happyShift action_19
action_113 (64) = happyShift action_20
action_113 (65) = happyShift action_21
action_113 (8) = happyGoto action_94
action_113 (13) = happyGoto action_49
action_113 _ = happyReduce_37

action_114 (30) = happyShift action_50
action_114 (35) = happyShift action_51
action_114 (38) = happyShift action_52
action_114 (41) = happyShift action_53
action_114 (42) = happyShift action_54
action_114 (44) = happyShift action_55
action_114 (46) = happyShift action_95
action_114 (47) = happyShift action_96
action_114 (48) = happyShift action_97
action_114 (49) = happyShift action_98
action_114 (50) = happyFail []
action_114 (51) = happyFail []
action_114 (52) = happyFail []
action_114 (53) = happyFail []
action_114 (54) = happyFail []
action_114 (55) = happyFail []
action_114 (59) = happyShift action_58
action_114 (60) = happyShift action_59
action_114 (61) = happyShift action_17
action_114 (62) = happyShift action_18
action_114 (63) = happyShift action_19
action_114 (64) = happyShift action_20
action_114 (65) = happyShift action_21
action_114 (8) = happyGoto action_94
action_114 (13) = happyGoto action_49
action_114 _ = happyReduce_36

action_115 (30) = happyShift action_50
action_115 (35) = happyShift action_51
action_115 (38) = happyShift action_52
action_115 (41) = happyShift action_53
action_115 (42) = happyShift action_54
action_115 (44) = happyShift action_55
action_115 (46) = happyShift action_95
action_115 (47) = happyShift action_96
action_115 (48) = happyShift action_97
action_115 (49) = happyShift action_98
action_115 (50) = happyFail []
action_115 (51) = happyFail []
action_115 (52) = happyFail []
action_115 (53) = happyFail []
action_115 (54) = happyFail []
action_115 (55) = happyFail []
action_115 (59) = happyShift action_58
action_115 (60) = happyShift action_59
action_115 (61) = happyShift action_17
action_115 (62) = happyShift action_18
action_115 (63) = happyShift action_19
action_115 (64) = happyShift action_20
action_115 (65) = happyShift action_21
action_115 (8) = happyGoto action_94
action_115 (13) = happyGoto action_49
action_115 _ = happyReduce_35

action_116 (30) = happyShift action_50
action_116 (35) = happyShift action_51
action_116 (38) = happyShift action_52
action_116 (41) = happyShift action_53
action_116 (42) = happyShift action_54
action_116 (44) = happyShift action_55
action_116 (46) = happyShift action_95
action_116 (47) = happyShift action_96
action_116 (48) = happyShift action_97
action_116 (49) = happyShift action_98
action_116 (50) = happyFail []
action_116 (51) = happyFail []
action_116 (52) = happyFail []
action_116 (53) = happyFail []
action_116 (54) = happyFail []
action_116 (55) = happyFail []
action_116 (59) = happyShift action_58
action_116 (60) = happyShift action_59
action_116 (61) = happyShift action_17
action_116 (62) = happyShift action_18
action_116 (63) = happyShift action_19
action_116 (64) = happyShift action_20
action_116 (65) = happyShift action_21
action_116 (8) = happyGoto action_94
action_116 (13) = happyGoto action_49
action_116 _ = happyReduce_34

action_117 (30) = happyShift action_50
action_117 (35) = happyShift action_51
action_117 (38) = happyShift action_52
action_117 (41) = happyShift action_53
action_117 (42) = happyShift action_54
action_117 (44) = happyShift action_55
action_117 (46) = happyShift action_95
action_117 (47) = happyShift action_96
action_117 (48) = happyShift action_97
action_117 (49) = happyShift action_98
action_117 (50) = happyFail []
action_117 (51) = happyFail []
action_117 (52) = happyFail []
action_117 (53) = happyFail []
action_117 (54) = happyFail []
action_117 (55) = happyFail []
action_117 (59) = happyShift action_58
action_117 (60) = happyShift action_59
action_117 (61) = happyShift action_17
action_117 (62) = happyShift action_18
action_117 (63) = happyShift action_19
action_117 (64) = happyShift action_20
action_117 (65) = happyShift action_21
action_117 (8) = happyGoto action_94
action_117 (13) = happyGoto action_49
action_117 _ = happyReduce_33

action_118 (30) = happyShift action_50
action_118 (35) = happyShift action_51
action_118 (38) = happyShift action_52
action_118 (41) = happyShift action_53
action_118 (42) = happyShift action_54
action_118 (44) = happyShift action_55
action_118 (46) = happyShift action_95
action_118 (47) = happyShift action_96
action_118 (48) = happyShift action_97
action_118 (49) = happyShift action_98
action_118 (50) = happyFail []
action_118 (51) = happyFail []
action_118 (52) = happyFail []
action_118 (53) = happyFail []
action_118 (54) = happyFail []
action_118 (55) = happyFail []
action_118 (59) = happyShift action_58
action_118 (60) = happyShift action_59
action_118 (61) = happyShift action_17
action_118 (62) = happyShift action_18
action_118 (63) = happyShift action_19
action_118 (64) = happyShift action_20
action_118 (65) = happyShift action_21
action_118 (8) = happyGoto action_94
action_118 (13) = happyGoto action_49
action_118 _ = happyReduce_32

action_119 (30) = happyShift action_50
action_119 (35) = happyShift action_51
action_119 (38) = happyShift action_52
action_119 (41) = happyShift action_53
action_119 (42) = happyShift action_54
action_119 (44) = happyShift action_55
action_119 (59) = happyShift action_58
action_119 (60) = happyShift action_59
action_119 (61) = happyShift action_17
action_119 (62) = happyShift action_18
action_119 (63) = happyShift action_19
action_119 (64) = happyShift action_20
action_119 (65) = happyShift action_21
action_119 (8) = happyGoto action_94
action_119 (13) = happyGoto action_49
action_119 _ = happyReduce_31

action_120 (30) = happyShift action_50
action_120 (35) = happyShift action_51
action_120 (38) = happyShift action_52
action_120 (41) = happyShift action_53
action_120 (42) = happyShift action_54
action_120 (44) = happyShift action_55
action_120 (59) = happyShift action_58
action_120 (60) = happyShift action_59
action_120 (61) = happyShift action_17
action_120 (62) = happyShift action_18
action_120 (63) = happyShift action_19
action_120 (64) = happyShift action_20
action_120 (65) = happyShift action_21
action_120 (8) = happyGoto action_94
action_120 (13) = happyGoto action_49
action_120 _ = happyReduce_30

action_121 (30) = happyShift action_50
action_121 (31) = happyReduce_27
action_121 (32) = happyReduce_27
action_121 (35) = happyShift action_51
action_121 (36) = happyReduce_27
action_121 (37) = happyReduce_27
action_121 (38) = happyShift action_52
action_121 (39) = happyReduce_27
action_121 (41) = happyShift action_53
action_121 (42) = happyShift action_54
action_121 (43) = happyReduce_27
action_121 (44) = happyShift action_55
action_121 (45) = happyReduce_27
action_121 (46) = happyReduce_27
action_121 (47) = happyReduce_27
action_121 (59) = happyShift action_58
action_121 (60) = happyShift action_59
action_121 (61) = happyShift action_17
action_121 (62) = happyShift action_18
action_121 (63) = happyShift action_19
action_121 (64) = happyShift action_20
action_121 (65) = happyShift action_21
action_121 (66) = happyReduce_27
action_121 (67) = happyReduce_27
action_121 (69) = happyReduce_27
action_121 (70) = happyReduce_27
action_121 (71) = happyReduce_27
action_121 (74) = happyReduce_27
action_121 (75) = happyReduce_27
action_121 (8) = happyGoto action_94
action_121 (13) = happyGoto action_49
action_121 _ = happyReduce_27

action_122 (30) = happyShift action_50
action_122 (35) = happyShift action_51
action_122 (38) = happyShift action_52
action_122 (41) = happyShift action_53
action_122 (42) = happyShift action_54
action_122 (44) = happyShift action_55
action_122 (48) = happyShift action_97
action_122 (49) = happyShift action_98
action_122 (59) = happyShift action_58
action_122 (60) = happyShift action_59
action_122 (61) = happyShift action_17
action_122 (62) = happyShift action_18
action_122 (63) = happyShift action_19
action_122 (64) = happyShift action_20
action_122 (65) = happyShift action_21
action_122 (8) = happyGoto action_94
action_122 (13) = happyGoto action_49
action_122 _ = happyReduce_28

action_123 (31) = happyShift action_160
action_123 (32) = happyShift action_41
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (30) = happyShift action_50
action_124 (35) = happyShift action_51
action_124 (38) = happyShift action_52
action_124 (41) = happyShift action_53
action_124 (42) = happyShift action_54
action_124 (44) = happyShift action_55
action_124 (47) = happyShift action_56
action_124 (58) = happyShift action_57
action_124 (59) = happyShift action_58
action_124 (60) = happyShift action_59
action_124 (61) = happyShift action_17
action_124 (62) = happyShift action_18
action_124 (63) = happyShift action_19
action_124 (64) = happyShift action_20
action_124 (65) = happyShift action_21
action_124 (8) = happyGoto action_159
action_124 (13) = happyGoto action_49
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (30) = happyShift action_50
action_125 (35) = happyShift action_51
action_125 (38) = happyShift action_52
action_125 (41) = happyShift action_53
action_125 (42) = happyShift action_54
action_125 (44) = happyShift action_55
action_125 (47) = happyShift action_56
action_125 (58) = happyShift action_57
action_125 (59) = happyShift action_58
action_125 (60) = happyShift action_59
action_125 (61) = happyShift action_17
action_125 (62) = happyShift action_18
action_125 (63) = happyShift action_19
action_125 (64) = happyShift action_20
action_125 (65) = happyShift action_21
action_125 (8) = happyGoto action_158
action_125 (13) = happyGoto action_49
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (42) = happyShift action_13
action_126 (44) = happyShift action_14
action_126 (59) = happyShift action_28
action_126 (60) = happyShift action_16
action_126 (61) = happyShift action_17
action_126 (62) = happyShift action_18
action_126 (63) = happyShift action_19
action_126 (64) = happyShift action_20
action_126 (65) = happyShift action_21
action_126 (72) = happyShift action_22
action_126 (74) = happyShift action_157
action_126 (7) = happyGoto action_153
action_126 (9) = happyGoto action_154
action_126 (10) = happyGoto action_155
action_126 (13) = happyGoto action_10
action_126 (20) = happyGoto action_156
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (42) = happyShift action_74
action_127 (59) = happyShift action_75
action_127 (73) = happyShift action_76
action_127 (11) = happyGoto action_152
action_127 (21) = happyGoto action_73
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (30) = happyShift action_50
action_128 (35) = happyShift action_51
action_128 (38) = happyShift action_52
action_128 (41) = happyShift action_53
action_128 (42) = happyShift action_54
action_128 (44) = happyShift action_55
action_128 (47) = happyShift action_56
action_128 (58) = happyShift action_57
action_128 (59) = happyShift action_58
action_128 (60) = happyShift action_59
action_128 (61) = happyShift action_17
action_128 (62) = happyShift action_18
action_128 (63) = happyShift action_19
action_128 (64) = happyShift action_20
action_128 (65) = happyShift action_21
action_128 (8) = happyGoto action_151
action_128 (13) = happyGoto action_49
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (30) = happyShift action_50
action_129 (35) = happyShift action_51
action_129 (38) = happyShift action_52
action_129 (41) = happyShift action_53
action_129 (42) = happyShift action_54
action_129 (44) = happyShift action_55
action_129 (47) = happyShift action_56
action_129 (58) = happyShift action_57
action_129 (59) = happyShift action_58
action_129 (60) = happyShift action_59
action_129 (61) = happyShift action_17
action_129 (62) = happyShift action_18
action_129 (63) = happyShift action_19
action_129 (64) = happyShift action_20
action_129 (65) = happyShift action_21
action_129 (8) = happyGoto action_150
action_129 (13) = happyGoto action_49
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_24

action_131 _ = happyReduce_22

action_132 (42) = happyShift action_74
action_132 (59) = happyShift action_75
action_132 (73) = happyShift action_76
action_132 (11) = happyGoto action_149
action_132 (21) = happyGoto action_73
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (30) = happyShift action_50
action_133 (35) = happyShift action_51
action_133 (38) = happyShift action_52
action_133 (41) = happyShift action_53
action_133 (42) = happyShift action_54
action_133 (44) = happyShift action_55
action_133 (47) = happyShift action_56
action_133 (58) = happyShift action_57
action_133 (59) = happyShift action_58
action_133 (60) = happyShift action_59
action_133 (61) = happyShift action_17
action_133 (62) = happyShift action_18
action_133 (63) = happyShift action_19
action_133 (64) = happyShift action_20
action_133 (65) = happyShift action_21
action_133 (8) = happyGoto action_148
action_133 (13) = happyGoto action_49
action_133 _ = happyFail (happyExpListPerState 133)

action_134 _ = happyReduce_26

action_135 _ = happyReduce_12

action_136 _ = happyReduce_56

action_137 (42) = happyShift action_74
action_137 (59) = happyShift action_75
action_137 (73) = happyShift action_76
action_137 (11) = happyGoto action_147
action_137 (21) = happyGoto action_73
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (43) = happyShift action_146
action_138 (48) = happyReduce_79
action_138 (59) = happyShift action_136
action_138 (71) = happyShift action_137
action_138 _ = happyReduce_79

action_139 _ = happyReduce_53

action_140 (43) = happyShift action_145
action_140 (48) = happyReduce_79
action_140 (59) = happyShift action_136
action_140 (71) = happyShift action_137
action_140 _ = happyReduce_79

action_141 (42) = happyShift action_74
action_141 (59) = happyShift action_75
action_141 (73) = happyShift action_76
action_141 (11) = happyGoto action_144
action_141 (21) = happyGoto action_73
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (30) = happyShift action_50
action_142 (35) = happyShift action_51
action_142 (38) = happyShift action_52
action_142 (41) = happyShift action_53
action_142 (42) = happyShift action_54
action_142 (44) = happyShift action_55
action_142 (47) = happyShift action_56
action_142 (58) = happyShift action_57
action_142 (59) = happyShift action_58
action_142 (60) = happyShift action_59
action_142 (61) = happyShift action_17
action_142 (62) = happyShift action_18
action_142 (63) = happyShift action_19
action_142 (64) = happyShift action_20
action_142 (65) = happyShift action_21
action_142 (8) = happyGoto action_143
action_142 (13) = happyGoto action_49
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (30) = happyShift action_50
action_143 (35) = happyShift action_51
action_143 (38) = happyShift action_52
action_143 (41) = happyShift action_53
action_143 (42) = happyShift action_54
action_143 (44) = happyShift action_55
action_143 (46) = happyShift action_95
action_143 (47) = happyShift action_96
action_143 (48) = happyShift action_97
action_143 (49) = happyShift action_98
action_143 (50) = happyShift action_99
action_143 (51) = happyShift action_100
action_143 (52) = happyShift action_101
action_143 (53) = happyShift action_102
action_143 (54) = happyShift action_103
action_143 (55) = happyShift action_104
action_143 (56) = happyShift action_105
action_143 (57) = happyShift action_106
action_143 (58) = happyShift action_57
action_143 (59) = happyShift action_58
action_143 (60) = happyShift action_59
action_143 (61) = happyShift action_17
action_143 (62) = happyShift action_18
action_143 (63) = happyShift action_19
action_143 (64) = happyShift action_20
action_143 (65) = happyShift action_21
action_143 (67) = happyShift action_107
action_143 (68) = happyShift action_108
action_143 (8) = happyGoto action_94
action_143 (13) = happyGoto action_49
action_143 _ = happyReduce_6

action_144 (59) = happyShift action_136
action_144 _ = happyReduce_80

action_145 _ = happyReduce_54

action_146 _ = happyReduce_59

action_147 (59) = happyShift action_136
action_147 (71) = happyShift action_137
action_147 _ = happyReduce_55

action_148 (30) = happyShift action_50
action_148 (35) = happyShift action_51
action_148 (38) = happyShift action_52
action_148 (41) = happyShift action_53
action_148 (42) = happyShift action_54
action_148 (44) = happyShift action_55
action_148 (46) = happyShift action_95
action_148 (47) = happyShift action_96
action_148 (48) = happyShift action_97
action_148 (49) = happyShift action_98
action_148 (50) = happyShift action_99
action_148 (51) = happyShift action_100
action_148 (52) = happyShift action_101
action_148 (53) = happyShift action_102
action_148 (54) = happyShift action_103
action_148 (55) = happyShift action_104
action_148 (56) = happyShift action_105
action_148 (57) = happyShift action_106
action_148 (58) = happyShift action_57
action_148 (59) = happyShift action_58
action_148 (60) = happyShift action_59
action_148 (61) = happyShift action_17
action_148 (62) = happyShift action_18
action_148 (63) = happyShift action_19
action_148 (64) = happyShift action_20
action_148 (65) = happyShift action_21
action_148 (67) = happyShift action_107
action_148 (8) = happyGoto action_94
action_148 (13) = happyGoto action_49
action_148 _ = happyReduce_90

action_149 (43) = happyShift action_168
action_149 (48) = happyReduce_79
action_149 (59) = happyShift action_136
action_149 (71) = happyShift action_137
action_149 _ = happyReduce_79

action_150 (30) = happyShift action_50
action_150 (35) = happyShift action_51
action_150 (38) = happyShift action_52
action_150 (41) = happyShift action_53
action_150 (42) = happyShift action_54
action_150 (44) = happyShift action_55
action_150 (46) = happyShift action_95
action_150 (47) = happyShift action_96
action_150 (48) = happyShift action_97
action_150 (49) = happyShift action_98
action_150 (50) = happyShift action_99
action_150 (51) = happyShift action_100
action_150 (52) = happyShift action_101
action_150 (53) = happyShift action_102
action_150 (54) = happyShift action_103
action_150 (55) = happyShift action_104
action_150 (56) = happyShift action_105
action_150 (57) = happyShift action_106
action_150 (58) = happyShift action_57
action_150 (59) = happyShift action_58
action_150 (60) = happyShift action_59
action_150 (61) = happyShift action_17
action_150 (62) = happyShift action_18
action_150 (63) = happyShift action_19
action_150 (64) = happyShift action_20
action_150 (65) = happyShift action_21
action_150 (67) = happyShift action_107
action_150 (68) = happyShift action_108
action_150 (8) = happyGoto action_94
action_150 (13) = happyGoto action_49
action_150 _ = happyReduce_88

action_151 (30) = happyShift action_50
action_151 (35) = happyShift action_51
action_151 (38) = happyShift action_52
action_151 (41) = happyShift action_53
action_151 (42) = happyShift action_54
action_151 (44) = happyShift action_55
action_151 (46) = happyShift action_95
action_151 (47) = happyShift action_96
action_151 (48) = happyShift action_97
action_151 (49) = happyShift action_98
action_151 (50) = happyShift action_99
action_151 (51) = happyShift action_100
action_151 (52) = happyShift action_101
action_151 (53) = happyShift action_102
action_151 (54) = happyShift action_103
action_151 (55) = happyShift action_104
action_151 (56) = happyShift action_105
action_151 (57) = happyShift action_106
action_151 (58) = happyShift action_57
action_151 (59) = happyShift action_58
action_151 (60) = happyShift action_59
action_151 (61) = happyShift action_17
action_151 (62) = happyShift action_18
action_151 (63) = happyShift action_19
action_151 (64) = happyShift action_20
action_151 (65) = happyShift action_21
action_151 (67) = happyShift action_107
action_151 (68) = happyShift action_108
action_151 (8) = happyGoto action_94
action_151 (13) = happyGoto action_49
action_151 _ = happyReduce_43

action_152 (48) = happyReduce_79
action_152 (59) = happyShift action_136
action_152 (71) = happyShift action_167
action_152 _ = happyReduce_79

action_153 (34) = happyShift action_42
action_153 (40) = happyShift action_165
action_153 (67) = happyShift action_44
action_153 (71) = happyShift action_166
action_153 (74) = happyShift action_45
action_153 _ = happyFail (happyExpListPerState 153)

action_154 _ = happyReduce_42

action_155 (30) = happyReduce_77
action_155 (31) = happyReduce_77
action_155 (32) = happyReduce_77
action_155 (35) = happyReduce_77
action_155 (36) = happyReduce_77
action_155 (37) = happyReduce_77
action_155 (38) = happyReduce_77
action_155 (39) = happyReduce_77
action_155 (41) = happyReduce_77
action_155 (42) = happyReduce_77
action_155 (43) = happyReduce_77
action_155 (44) = happyReduce_77
action_155 (45) = happyReduce_77
action_155 (46) = happyReduce_77
action_155 (47) = happyReduce_77
action_155 (48) = happyReduce_77
action_155 (49) = happyReduce_77
action_155 (50) = happyReduce_77
action_155 (51) = happyReduce_77
action_155 (52) = happyReduce_77
action_155 (53) = happyReduce_77
action_155 (54) = happyReduce_77
action_155 (55) = happyReduce_77
action_155 (56) = happyReduce_77
action_155 (57) = happyReduce_77
action_155 (58) = happyReduce_77
action_155 (59) = happyReduce_77
action_155 (60) = happyReduce_77
action_155 (61) = happyReduce_77
action_155 (62) = happyReduce_77
action_155 (63) = happyReduce_77
action_155 (64) = happyReduce_77
action_155 (65) = happyReduce_77
action_155 (66) = happyReduce_77
action_155 (67) = happyReduce_77
action_155 (68) = happyReduce_77
action_155 (69) = happyReduce_77
action_155 (70) = happyReduce_77
action_155 (71) = happyReduce_77
action_155 (74) = happyReduce_77
action_155 (75) = happyReduce_77
action_155 _ = happyReduce_77

action_156 (74) = happyShift action_164
action_156 _ = happyReduce_48

action_157 (42) = happyShift action_13
action_157 (44) = happyShift action_14
action_157 (59) = happyShift action_28
action_157 (60) = happyShift action_16
action_157 (61) = happyShift action_17
action_157 (62) = happyShift action_18
action_157 (63) = happyShift action_19
action_157 (64) = happyShift action_20
action_157 (65) = happyShift action_21
action_157 (72) = happyShift action_22
action_157 (7) = happyGoto action_153
action_157 (10) = happyGoto action_155
action_157 (13) = happyGoto action_10
action_157 (20) = happyGoto action_163
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (30) = happyShift action_50
action_158 (35) = happyShift action_51
action_158 (37) = happyShift action_162
action_158 (38) = happyShift action_52
action_158 (41) = happyShift action_53
action_158 (42) = happyShift action_54
action_158 (44) = happyShift action_55
action_158 (46) = happyShift action_95
action_158 (47) = happyShift action_96
action_158 (48) = happyShift action_97
action_158 (49) = happyShift action_98
action_158 (50) = happyShift action_99
action_158 (51) = happyShift action_100
action_158 (52) = happyShift action_101
action_158 (53) = happyShift action_102
action_158 (54) = happyShift action_103
action_158 (55) = happyShift action_104
action_158 (56) = happyShift action_105
action_158 (57) = happyShift action_106
action_158 (58) = happyShift action_57
action_158 (59) = happyShift action_58
action_158 (60) = happyShift action_59
action_158 (61) = happyShift action_17
action_158 (62) = happyShift action_18
action_158 (63) = happyShift action_19
action_158 (64) = happyShift action_20
action_158 (65) = happyShift action_21
action_158 (67) = happyShift action_107
action_158 (68) = happyShift action_108
action_158 (8) = happyGoto action_94
action_158 (13) = happyGoto action_49
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (30) = happyShift action_50
action_159 (35) = happyShift action_51
action_159 (38) = happyShift action_52
action_159 (41) = happyShift action_53
action_159 (42) = happyShift action_54
action_159 (44) = happyShift action_55
action_159 (46) = happyShift action_95
action_159 (47) = happyShift action_96
action_159 (48) = happyShift action_97
action_159 (49) = happyShift action_98
action_159 (50) = happyShift action_99
action_159 (51) = happyShift action_100
action_159 (52) = happyShift action_101
action_159 (53) = happyShift action_102
action_159 (54) = happyShift action_103
action_159 (55) = happyShift action_104
action_159 (56) = happyShift action_105
action_159 (57) = happyShift action_106
action_159 (58) = happyShift action_57
action_159 (59) = happyShift action_58
action_159 (60) = happyShift action_59
action_159 (61) = happyShift action_17
action_159 (62) = happyShift action_18
action_159 (63) = happyShift action_19
action_159 (64) = happyShift action_20
action_159 (65) = happyShift action_21
action_159 (67) = happyShift action_107
action_159 (8) = happyGoto action_94
action_159 (13) = happyGoto action_49
action_159 _ = happyReduce_45

action_160 (30) = happyShift action_50
action_160 (35) = happyShift action_51
action_160 (38) = happyShift action_52
action_160 (41) = happyShift action_53
action_160 (42) = happyShift action_54
action_160 (44) = happyShift action_55
action_160 (47) = happyShift action_56
action_160 (58) = happyShift action_57
action_160 (59) = happyShift action_58
action_160 (60) = happyShift action_59
action_160 (61) = happyShift action_17
action_160 (62) = happyShift action_18
action_160 (63) = happyShift action_19
action_160 (64) = happyShift action_20
action_160 (65) = happyShift action_21
action_160 (8) = happyGoto action_161
action_160 (13) = happyGoto action_49
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (30) = happyShift action_50
action_161 (35) = happyShift action_51
action_161 (38) = happyShift action_52
action_161 (41) = happyShift action_53
action_161 (42) = happyShift action_54
action_161 (44) = happyShift action_55
action_161 (46) = happyShift action_95
action_161 (47) = happyShift action_96
action_161 (48) = happyShift action_97
action_161 (49) = happyShift action_98
action_161 (50) = happyShift action_99
action_161 (51) = happyShift action_100
action_161 (52) = happyShift action_101
action_161 (53) = happyShift action_102
action_161 (54) = happyShift action_103
action_161 (55) = happyShift action_104
action_161 (56) = happyShift action_105
action_161 (57) = happyShift action_106
action_161 (58) = happyShift action_57
action_161 (59) = happyShift action_58
action_161 (60) = happyShift action_59
action_161 (61) = happyShift action_17
action_161 (62) = happyShift action_18
action_161 (63) = happyShift action_19
action_161 (64) = happyShift action_20
action_161 (65) = happyShift action_21
action_161 (67) = happyShift action_107
action_161 (8) = happyGoto action_94
action_161 (13) = happyGoto action_49
action_161 _ = happyReduce_46

action_162 (30) = happyShift action_50
action_162 (35) = happyShift action_51
action_162 (38) = happyShift action_52
action_162 (41) = happyShift action_53
action_162 (42) = happyShift action_54
action_162 (44) = happyShift action_55
action_162 (47) = happyShift action_56
action_162 (58) = happyShift action_57
action_162 (59) = happyShift action_58
action_162 (60) = happyShift action_59
action_162 (61) = happyShift action_17
action_162 (62) = happyShift action_18
action_162 (63) = happyShift action_19
action_162 (64) = happyShift action_20
action_162 (65) = happyShift action_21
action_162 (8) = happyGoto action_175
action_162 (13) = happyGoto action_49
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_49

action_164 (42) = happyShift action_13
action_164 (44) = happyShift action_14
action_164 (59) = happyShift action_28
action_164 (60) = happyShift action_16
action_164 (61) = happyShift action_17
action_164 (62) = happyShift action_18
action_164 (63) = happyShift action_19
action_164 (64) = happyShift action_20
action_164 (65) = happyShift action_21
action_164 (72) = happyShift action_22
action_164 (7) = happyGoto action_153
action_164 (10) = happyGoto action_174
action_164 (13) = happyGoto action_10
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (30) = happyShift action_50
action_165 (35) = happyShift action_51
action_165 (38) = happyShift action_52
action_165 (41) = happyShift action_53
action_165 (42) = happyShift action_54
action_165 (44) = happyShift action_55
action_165 (47) = happyShift action_56
action_165 (58) = happyShift action_57
action_165 (59) = happyShift action_58
action_165 (60) = happyShift action_59
action_165 (61) = happyShift action_17
action_165 (62) = happyShift action_18
action_165 (63) = happyShift action_19
action_165 (64) = happyShift action_20
action_165 (65) = happyShift action_21
action_165 (8) = happyGoto action_173
action_165 (13) = happyGoto action_49
action_165 _ = happyFail (happyExpListPerState 165)

action_166 (30) = happyShift action_50
action_166 (35) = happyShift action_51
action_166 (38) = happyShift action_52
action_166 (41) = happyShift action_53
action_166 (42) = happyShift action_54
action_166 (44) = happyShift action_55
action_166 (47) = happyShift action_56
action_166 (58) = happyShift action_57
action_166 (59) = happyShift action_58
action_166 (60) = happyShift action_59
action_166 (61) = happyShift action_17
action_166 (62) = happyShift action_18
action_166 (63) = happyShift action_19
action_166 (64) = happyShift action_20
action_166 (65) = happyShift action_21
action_166 (8) = happyGoto action_172
action_166 (13) = happyGoto action_49
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (30) = happyShift action_50
action_167 (35) = happyShift action_51
action_167 (38) = happyShift action_52
action_167 (41) = happyShift action_53
action_167 (42) = happyShift action_170
action_167 (44) = happyShift action_55
action_167 (47) = happyShift action_56
action_167 (58) = happyShift action_57
action_167 (59) = happyShift action_171
action_167 (60) = happyShift action_59
action_167 (61) = happyShift action_17
action_167 (62) = happyShift action_18
action_167 (63) = happyShift action_19
action_167 (64) = happyShift action_20
action_167 (65) = happyShift action_21
action_167 (73) = happyShift action_76
action_167 (8) = happyGoto action_169
action_167 (11) = happyGoto action_147
action_167 (13) = happyGoto action_49
action_167 (21) = happyGoto action_73
action_167 _ = happyFail (happyExpListPerState 167)

action_168 _ = happyReduce_23

action_169 (30) = happyShift action_50
action_169 (35) = happyShift action_51
action_169 (38) = happyShift action_52
action_169 (41) = happyShift action_53
action_169 (42) = happyShift action_54
action_169 (44) = happyShift action_55
action_169 (46) = happyShift action_95
action_169 (47) = happyShift action_96
action_169 (48) = happyShift action_97
action_169 (49) = happyShift action_98
action_169 (50) = happyShift action_99
action_169 (51) = happyShift action_100
action_169 (52) = happyShift action_101
action_169 (53) = happyShift action_102
action_169 (54) = happyShift action_103
action_169 (55) = happyShift action_104
action_169 (56) = happyShift action_105
action_169 (57) = happyShift action_106
action_169 (58) = happyShift action_57
action_169 (59) = happyShift action_58
action_169 (60) = happyShift action_59
action_169 (61) = happyShift action_17
action_169 (62) = happyShift action_18
action_169 (63) = happyShift action_19
action_169 (64) = happyShift action_20
action_169 (65) = happyShift action_21
action_169 (67) = happyShift action_107
action_169 (68) = happyShift action_108
action_169 (8) = happyGoto action_94
action_169 (13) = happyGoto action_49
action_169 _ = happyReduce_44

action_170 (30) = happyShift action_50
action_170 (35) = happyShift action_51
action_170 (38) = happyShift action_52
action_170 (41) = happyShift action_53
action_170 (42) = happyShift action_170
action_170 (44) = happyShift action_55
action_170 (47) = happyShift action_56
action_170 (58) = happyShift action_57
action_170 (59) = happyShift action_171
action_170 (60) = happyShift action_59
action_170 (61) = happyShift action_17
action_170 (62) = happyShift action_18
action_170 (63) = happyShift action_19
action_170 (64) = happyShift action_20
action_170 (65) = happyShift action_21
action_170 (73) = happyShift action_76
action_170 (8) = happyGoto action_86
action_170 (11) = happyGoto action_140
action_170 (13) = happyGoto action_49
action_170 (14) = happyGoto action_87
action_170 (21) = happyGoto action_73
action_170 (25) = happyGoto action_88
action_170 _ = happyReduce_66

action_171 (43) = happyReduce_52
action_171 (48) = happyReduce_52
action_171 (59) = happyReduce_52
action_171 (71) = happyReduce_52
action_171 _ = happyReduce_18

action_172 (30) = happyShift action_50
action_172 (35) = happyShift action_51
action_172 (38) = happyShift action_52
action_172 (41) = happyShift action_53
action_172 (42) = happyShift action_54
action_172 (44) = happyShift action_55
action_172 (46) = happyShift action_95
action_172 (47) = happyShift action_96
action_172 (48) = happyShift action_97
action_172 (49) = happyShift action_98
action_172 (50) = happyShift action_99
action_172 (51) = happyShift action_100
action_172 (52) = happyShift action_101
action_172 (53) = happyShift action_102
action_172 (54) = happyShift action_103
action_172 (55) = happyShift action_104
action_172 (56) = happyShift action_105
action_172 (57) = happyShift action_106
action_172 (58) = happyShift action_57
action_172 (59) = happyShift action_58
action_172 (60) = happyShift action_59
action_172 (61) = happyShift action_17
action_172 (62) = happyShift action_18
action_172 (63) = happyShift action_19
action_172 (64) = happyShift action_20
action_172 (65) = happyShift action_21
action_172 (67) = happyShift action_107
action_172 (68) = happyShift action_108
action_172 (8) = happyGoto action_94
action_172 (13) = happyGoto action_49
action_172 _ = happyReduce_50

action_173 (30) = happyShift action_50
action_173 (35) = happyShift action_51
action_173 (38) = happyShift action_52
action_173 (41) = happyShift action_53
action_173 (42) = happyShift action_54
action_173 (44) = happyShift action_55
action_173 (46) = happyShift action_95
action_173 (47) = happyShift action_96
action_173 (48) = happyShift action_97
action_173 (49) = happyShift action_98
action_173 (50) = happyShift action_99
action_173 (51) = happyShift action_100
action_173 (52) = happyShift action_101
action_173 (53) = happyShift action_102
action_173 (54) = happyShift action_103
action_173 (55) = happyShift action_104
action_173 (56) = happyShift action_105
action_173 (57) = happyShift action_106
action_173 (58) = happyShift action_57
action_173 (59) = happyShift action_58
action_173 (60) = happyShift action_59
action_173 (61) = happyShift action_17
action_173 (62) = happyShift action_18
action_173 (63) = happyShift action_19
action_173 (64) = happyShift action_20
action_173 (65) = happyShift action_21
action_173 (67) = happyShift action_107
action_173 (68) = happyShift action_108
action_173 (71) = happyShift action_176
action_173 (8) = happyGoto action_94
action_173 (13) = happyGoto action_49
action_173 _ = happyFail (happyExpListPerState 173)

action_174 _ = happyReduce_78

action_175 (30) = happyShift action_50
action_175 (35) = happyShift action_51
action_175 (38) = happyShift action_52
action_175 (41) = happyShift action_53
action_175 (42) = happyShift action_54
action_175 (44) = happyShift action_55
action_175 (46) = happyShift action_95
action_175 (47) = happyShift action_96
action_175 (48) = happyShift action_97
action_175 (49) = happyShift action_98
action_175 (50) = happyShift action_99
action_175 (51) = happyShift action_100
action_175 (52) = happyShift action_101
action_175 (53) = happyShift action_102
action_175 (54) = happyShift action_103
action_175 (55) = happyShift action_104
action_175 (56) = happyShift action_105
action_175 (57) = happyShift action_106
action_175 (58) = happyShift action_57
action_175 (59) = happyShift action_58
action_175 (60) = happyShift action_59
action_175 (61) = happyShift action_17
action_175 (62) = happyShift action_18
action_175 (63) = happyShift action_19
action_175 (64) = happyShift action_20
action_175 (65) = happyShift action_21
action_175 (67) = happyShift action_107
action_175 (8) = happyGoto action_94
action_175 (13) = happyGoto action_49
action_175 _ = happyReduce_41

action_176 (30) = happyShift action_50
action_176 (35) = happyShift action_51
action_176 (38) = happyShift action_52
action_176 (41) = happyShift action_53
action_176 (42) = happyShift action_54
action_176 (44) = happyShift action_55
action_176 (47) = happyShift action_56
action_176 (58) = happyShift action_57
action_176 (59) = happyShift action_58
action_176 (60) = happyShift action_59
action_176 (61) = happyShift action_17
action_176 (62) = happyShift action_18
action_176 (63) = happyShift action_19
action_176 (64) = happyShift action_20
action_176 (65) = happyShift action_21
action_176 (8) = happyGoto action_177
action_176 (13) = happyGoto action_49
action_176 _ = happyFail (happyExpListPerState 176)

action_177 (30) = happyShift action_50
action_177 (35) = happyShift action_51
action_177 (38) = happyShift action_52
action_177 (41) = happyShift action_53
action_177 (42) = happyShift action_54
action_177 (44) = happyShift action_55
action_177 (46) = happyShift action_95
action_177 (47) = happyShift action_96
action_177 (48) = happyShift action_97
action_177 (49) = happyShift action_98
action_177 (50) = happyShift action_99
action_177 (51) = happyShift action_100
action_177 (52) = happyShift action_101
action_177 (53) = happyShift action_102
action_177 (54) = happyShift action_103
action_177 (55) = happyShift action_104
action_177 (56) = happyShift action_105
action_177 (57) = happyShift action_106
action_177 (58) = happyShift action_57
action_177 (59) = happyShift action_58
action_177 (60) = happyShift action_59
action_177 (61) = happyShift action_17
action_177 (62) = happyShift action_18
action_177 (63) = happyShift action_19
action_177 (64) = happyShift action_20
action_177 (65) = happyShift action_21
action_177 (67) = happyShift action_107
action_177 (68) = happyShift action_108
action_177 (8) = happyGoto action_94
action_177 (13) = happyGoto action_49
action_177 _ = happyReduce_51

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn4
		 (reverse happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn4
		 (reverse happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (DLet () (reverse happy_var_2)
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn19  happy_var_3)
	_
	_
	 =  HappyAbsSyn5
		 (DLetRec () (reverse happy_var_3)
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (BPattern () happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happyReduce 6 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (BIdType () (getId happy_var_1) happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn7
		 (PVar () (getId happy_var_1)
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn7
		 (PWildcard ()
	)

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 (PConst () happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyTerminal happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (PAs () happy_var_1 (getId happy_var_3)
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 7 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (PType () happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (POr () happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 (HappyAbsSyn23  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn7
		 (PConstructor () (getConstr happy_var_1 ()) happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 _
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn7
		 (PTuple () (reverse happy_var_1)
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (PList () (reverse happy_var_2)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  7 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (PCons () happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  8 happyReduction_18
happyReduction_18 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn8
		 (EVar () (getId happy_var_1)
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  8 happyReduction_19
happyReduction_19 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn8
		 (EConstructor () (getConstr happy_var_1)
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  8 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (EConst () happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  8 happyReduction_21
happyReduction_21 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EApp () happy_var_1 happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  8 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 5 8 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (EType () happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  8 happyReduction_24
happyReduction_24 _
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn8
		 (ETuple () (reverse happy_var_1)
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  8 happyReduction_25
happyReduction_25 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (ECons () happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  8 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (EList () (reverse happy_var_2)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  8 happyReduction_27
happyReduction_27 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (ENegate () happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  8 happyReduction_28
happyReduction_28 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OPlus ()) happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  8 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OMinus ()) happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  8 happyReduction_30
happyReduction_30 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OTimes ()) happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  8 happyReduction_31
happyReduction_31 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (ODivide ()) happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  8 happyReduction_32
happyReduction_32 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OLt ()) happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  8 happyReduction_33
happyReduction_33 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OLe ()) happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  8 happyReduction_34
happyReduction_34 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OEq ()) happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  8 happyReduction_35
happyReduction_35 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (ONeq ()) happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  8 happyReduction_36
happyReduction_36 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OGe ()) happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  8 happyReduction_37
happyReduction_37 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OGt ()) happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  8 happyReduction_38
happyReduction_38 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OAnd ()) happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  8 happyReduction_39
happyReduction_39 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (EBinop () happy_var_1 (OOr ()) happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  8 happyReduction_40
happyReduction_40 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (EUnop () (UNot ()) happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happyReduce 6 8 happyReduction_41
happyReduction_41 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (EIf () happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 4 8 happyReduction_42
happyReduction_42 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (EMatch () happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 4 8 happyReduction_43
happyReduction_43 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ELambda () (reverse happy_var_2) Nothing happy_var_4
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 6 8 happyReduction_44
happyReduction_44 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ELambda () (reverse happy_var_2) (Just happy_var_4) happy_var_6
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 4 8 happyReduction_45
happyReduction_45 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ELet () happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 5 8 happyReduction_46
happyReduction_46 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ELetRec () (reverse happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_3  8 happyReduction_47
happyReduction_47 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (ESeq () happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  9 happyReduction_48
happyReduction_48 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn9
		 (reverse happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  9 happyReduction_49
happyReduction_49 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (reverse happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  10 happyReduction_50
happyReduction_50 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (PatternMatch () happy_var_1 Nothing happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happyReduce 5 10 happyReduction_51
happyReduction_51 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (PatternMatch () happy_var_1 (Just happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_1  11 happyReduction_52
happyReduction_52 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (TType () (getId happy_var_1)
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_2  11 happyReduction_53
happyReduction_53 (HappyTerminal happy_var_2)
	_
	 =  HappyAbsSyn11
		 (TVar () (getId happy_var_2)
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  11 happyReduction_54
happyReduction_54 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  11 happyReduction_55
happyReduction_55 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (TFunc () happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  11 happyReduction_56
happyReduction_56 (HappyTerminal happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (TApp () happy_var_1 (getId happy_var_2)
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  11 happyReduction_57
happyReduction_57 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn11
		 (TTuple () (reverse happy_var_1)
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  12 happyReduction_58
happyReduction_58 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn12
		 (Parameter () (getId happy_var_1) Nothing
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happyReduce 5 12 happyReduction_59
happyReduction_59 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Parameter () (getId happy_var_2) (Just happy_var_4)
	) `HappyStk` happyRest

happyReduce_60 = happySpecReduce_1  13 happyReduction_60
happyReduction_60 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn13
		 (CInt () (getInt happy_var_1)
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  13 happyReduction_61
happyReduction_61 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn13
		 (CFloat () (getFloat happy_var_1)
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  13 happyReduction_62
happyReduction_62 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn13
		 (CString () (getString happy_var_1)
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  13 happyReduction_63
happyReduction_63 _
	 =  HappyAbsSyn13
		 (CTrue ()
	)

happyReduce_64 = happySpecReduce_1  13 happyReduction_64
happyReduction_64 _
	 =  HappyAbsSyn13
		 (CFalse ()
	)

happyReduce_65 = happySpecReduce_1  14 happyReduction_65
happyReduction_65 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_0  14 happyReduction_66
happyReduction_66  =  HappyAbsSyn14
		 ([]
	)

happyReduce_67 = happySpecReduce_1  15 happyReduction_67
happyReduction_67 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_0  15 happyReduction_68
happyReduction_68  =  HappyAbsSyn15
		 ([]
	)

happyReduce_69 = happySpecReduce_1  16 happyReduction_69
happyReduction_69 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_0  16 happyReduction_70
happyReduction_70  =  HappyAbsSyn16
		 ([]
	)

happyReduce_71 = happySpecReduce_1  17 happyReduction_71
happyReduction_71 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_0  17 happyReduction_72
happyReduction_72  =  HappyAbsSyn17
		 ([]
	)

happyReduce_73 = happySpecReduce_1  18 happyReduction_73
happyReduction_73 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  18 happyReduction_74
happyReduction_74 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_3 : happy_var_1
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  19 happyReduction_75
happyReduction_75 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn19
		 ([happy_var_1]
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_3  19 happyReduction_76
happyReduction_76 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_3 : happy_var_1
	)
happyReduction_76 _ _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_1  20 happyReduction_77
happyReduction_77 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn20
		 ([happy_var_1]
	)
happyReduction_77 _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_3  20 happyReduction_78
happyReduction_78 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_3 : happy_var_1
	)
happyReduction_78 _ _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  21 happyReduction_79
happyReduction_79 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn21
		 ([happy_var_1]
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_3  21 happyReduction_80
happyReduction_80 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (happy_var_3 : happy_var_1
	)
happyReduction_80 _ _ _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_1  22 happyReduction_81
happyReduction_81 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happySpecReduce_0  22 happyReduction_82
happyReduction_82  =  HappyAbsSyn22
		 ([]
	)

happyReduce_83 = happySpecReduce_1  23 happyReduction_83
happyReduction_83 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1
	)
happyReduction_83 _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_0  23 happyReduction_84
happyReduction_84  =  HappyAbsSyn23
		 ([]
	)

happyReduce_85 = happySpecReduce_1  24 happyReduction_85
happyReduction_85 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn24
		 ([happy_var_1]
	)
happyReduction_85 _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_2  24 happyReduction_86
happyReduction_86 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_2 : happy_var_1
	)
happyReduction_86 _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_1  25 happyReduction_87
happyReduction_87 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn25
		 ([happy_var_1]
	)
happyReduction_87 _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  25 happyReduction_88
happyReduction_88 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_3 : happy_var_1
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_1  26 happyReduction_89
happyReduction_89 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn26
		 ([happy_var_1]
	)
happyReduction_89 _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  26 happyReduction_90
happyReduction_90 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_3 : happy_var_1
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_1  27 happyReduction_91
happyReduction_91 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn27
		 ([happy_var_1]
	)
happyReduction_91 _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_3  27 happyReduction_92
happyReduction_92 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_3 : happy_var_1
	)
happyReduction_92 _ _ _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_1  28 happyReduction_93
happyReduction_93 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn28
		 ([happy_var_1]
	)
happyReduction_93 _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  28 happyReduction_94
happyReduction_94 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_3 : happy_var_1
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_1  29 happyReduction_95
happyReduction_95 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn29
		 ([happy_var_1]
	)
happyReduction_95 _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_2  29 happyReduction_96
happyReduction_96 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_2 : happy_var_1
	)
happyReduction_96 _ _  = notHappyAtAll 

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	Lex.EOF -> action 75 75 tk (HappyState action) sts stk;
	Lex.Let -> cont 30;
	Lex.In -> cont 31;
	Lex.LetAnd -> cont 32;
	Lex.Rec -> cont 33;
	Lex.As -> cont 34;
	Lex.If -> cont 35;
	Lex.Then -> cont 36;
	Lex.Else -> cont 37;
	Lex.Match -> cont 38;
	Lex.With -> cont 39;
	Lex.When -> cont 40;
	Lex.Fun -> cont 41;
	Lex.LParen -> cont 42;
	Lex.RParen -> cont 43;
	Lex.LBracket -> cont 44;
	Lex.RBracket -> cont 45;
	Lex.Plus -> cont 46;
	Lex.Minus -> cont 47;
	Lex.Times -> cont 48;
	Lex.Divide -> cont 49;
	Lex.Lt -> cont 50;
	Lex.Le -> cont 51;
	Lex.Eq -> cont 52;
	Lex.Neq -> cont 53;
	Lex.Ge -> cont 54;
	Lex.Gt -> cont 55;
	Lex.And -> cont 56;
	Lex.Or -> cont 57;
	Lex.Not -> cont 58;
	Lex.Identifier _ -> cont 59;
	Lex.Constructor _ -> cont 60;
	Lex.Integer _ -> cont 61;
	Lex.Float _ -> cont 62;
	Lex.String _ -> cont 63;
	Lex.TTrue -> cont 64;
	Lex.FFalse -> cont 65;
	Lex.Colon -> cont 66;
	Lex.DoubleColon -> cont 67;
	Lex.Semicolon -> cont 68;
	Lex.DoubleSemi -> cont 69;
	Lex.Comma -> cont 70;
	Lex.Arrow -> cont 71;
	Lex.Underscore -> cont 72;
	Lex.Apostrophe -> cont 73;
	Lex.Pipe -> cont 74;
	_ -> happyError' (tk, [])
	})

happyError_ explist 75 tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Lex.Alex a -> (a -> Lex.Alex b) -> Lex.Alex b
happyThen = (>>=)
happyReturn :: () => a -> Lex.Alex a
happyReturn = (pure)
happyThen1 :: () => Lex.Alex a -> (a -> Lex.Alex b) -> Lex.Alex b
happyThen1 = happyThen
happyReturn1 :: () => a -> Lex.Alex a
happyReturn1 = happyReturn
happyError' :: () => ((Lex.Token), [Prelude.String]) -> Lex.Alex a
happyError' tk = (\(tokens, _) -> parseError tokens) tk
parseMain = happySomeParser where
 happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: Lex.Token -> Lex.Alex a
parseError _ = do
  (Lex.AlexPn _ line col, _, _, _) <- Lex.alexGetInput
  Lex.alexError $ "Parse error at " <> show line <> ":" <> show col

lexer :: (Lex.Token -> Lex.Alex a) -> Lex.Alex a
lexer = (=<< Lex.alexMonadScan)

getId :: Lex.Token -> ByteString
getId (Lex.Identifier id) = id
getId _ = error "Impossible error: Tried to extract an id from a non-id token"

getConstr :: Lex.Token -> a -> Constructor a
getConstr (Lex.Constructor id) info = Constructor info id
getConstr _ _ = error "Impossible error: Tried to extract a constructor from a non-constructor token"

getInt :: Lex.Token -> Integer
getInt (Lex.Integer i) = i
getInt _ = error "Impossible error: Tried to extract an int from a non-int token"

getFloat :: Lex.Token -> Double
getFloat (Lex.Float d) = d
getFloat _ = error "Impossible error: Tried to extract a float from a non-float token"

getString :: Lex.Token -> ByteString
getString (Lex.String bs) = bs
getString _ = error "Impossible error: Tried to extract a string from a non-string token"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
