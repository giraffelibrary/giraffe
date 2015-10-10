fun printLine s = (print s; print "\n")

fun test1 fmt = String.concat o HTextTree.toStrings o fmt
fun test2 fmt = app printLine o map String.concat o VTextTree.toStrings o fmt
fun test3 fmt = app printLine o map String.concat o VTextTree.toStrings o toV o fmt





val test_const_real_1_val = ConstReal (0, 0, NONE)
val test_const_real_2_val = ConstReal (0, 2, NONE)
val test_const_real_3_val = ConstReal (123456, 0, NONE)
val test_const_real_4_val = ConstReal (123456, 1, NONE)
val test_const_real_5_val = ConstReal (123456, 2, NONE)
val test_const_real_6_val = ConstReal (123456, ~1, NONE)
val test_const_real_7_val = ConstReal (~123456, 0, NONE)
val test_const_real_8_val = ConstReal (~123456, 1, NONE)
val test_const_real_9_val = ConstReal (123456, 9, NONE)
val test_const_real_10_val = ConstReal (~123456, 9, NONE)
val test_const_real_11_val = ConstReal (0, 0, SOME 0)
val test_const_real_12_val = ConstReal (0, 0, SOME 234)
val test_const_real_13_val = ConstReal (0, 2, SOME ~234)
val test_const_real_14_val = ConstReal (123456, 0, SOME 0)
val test_const_real_15_val = ConstReal (123456, 1, SOME ~1)
;

test1 fmtConst test_const_real_1_val = "0.0";
test1 fmtConst test_const_real_2_val = "0.00";
test1 fmtConst test_const_real_3_val = "123456.0";
test1 fmtConst test_const_real_4_val = "12345.6";
test1 fmtConst test_const_real_5_val = "1234.56";
(test1 fmtConst test_const_real_6_val; false) handle Fail _ => true;
test1 fmtConst test_const_real_7_val = "~123456.0";
test1 fmtConst test_const_real_8_val = "~12345.6";
test1 fmtConst test_const_real_9_val = "0.000123456";
test1 fmtConst test_const_real_10_val = "~0.000123456";
test1 fmtConst test_const_real_11_val = "0.0E0";
test1 fmtConst test_const_real_12_val = "0.0E234";
test1 fmtConst test_const_real_13_val = "0.00E~234";
test1 fmtConst test_const_real_14_val = "123456.0E0";
test1 fmtConst test_const_real_15_val = "12345.6E~1";




val test_tyname_1_val : tyname = (NONE, "sometype")
val test_tyname_2_val : tyname = (SOME ((false, "a"), []), "sometype")
val test_tyname_3_val : tyname =
  (
    SOME ((false, "a"), [(true,  "b")]),
    "sometype"
  )
val test_tyname_4_val : tyname =
  (
    SOME ((false, "a"), [(true,  "b"), (false, "c")]),
    "sometype"
  )
val test_tyname_5_val : tyname =
  (
    SOME ((false, "aaaaaaaa"), [(true,  "bbbbbbbb"), (false, "cccccccc")]),
    "sometype"
  )
;


test1 fmtTyName test_tyname_1_val;
test1 fmtTyName test_tyname_2_val;
test1 fmtTyName test_tyname_3_val;
test1 fmtTyName test_tyname_4_val;
test1 fmtTyName test_tyname_5_val;



val test_tylname_5_val : tylname =
  (
    SOME ((false, "aaaaaaaa"), [(true,  "bbbbbbbb"), (false, "cccccccc")]),
    ("some", ["type"])
  )
;

test1 fmtTyLName test_tylname_5_val;







val test_ty_tyfun_1_val = 
  TyFun (
    TyVar (false, "aaaaaaaaaa"),
    TyFun (TyVar (false, "bbbbbbbbbb"), TyVar (false, "cccccccccc"))
  )

val test_ty_tyfun_2_val = 
  TyFun (
    TyFun (TyVar (false, "bbbbbbbbbb"), TyVar (false, "cccccccccc")),
    TyVar (false, "aaaaaaaaaa")
  )

val test_ty_tyfun_3_val = 
  TyFun (
    TyParen (
      TyFun (TyVar (false, "bbbbbbbbbb"), TyVar (false, "cccccccccc"))
    ),
    TyVar (false, "aaaaaaaaaa")
  )

val test_ty_tyfun_4_val = 
  TyFun (
    TyParen (
      TyFun (
        TyVar (false, "bbbbbbbbbb"),
        TyFun (TyVar (false, "cccccccccc"), TyVar (false, "cccccccccc"))
      )
    ),
    TyVar (false, "aaaaaaaaaa")
  )

val test_ty_tyfun_5_val = 
  TyFun (
    TyVar (false, "aaaaaaaaaa"),
    TyFun (
      TyFun (TyVar (false, "bbbbbbbbbb"), TyVar (false, "cccccccccc")),
      TyVar (false, "aaaaaaaaaa")
    )
  )

val test_ty_tyfun_6_val = 
  TyFun (
    TyVar (false, "aaaaaaaaaa"),
    TyFun (
      TyParen (
        TyFun (TyVar (false, "bbbbbbbbbb"), TyVar (false, "cccccccccc"))
      ),
      TyVar (false, "aaaaaaaaaa")
    )
  )

val test_ty_tyfun_7_val = 
  TyFun (
    TyVar (false, "aaaaaaaaaa"),
    TyFun (
      TyParen (
        TyFun (
          TyVar (false, "bbbbbbbbbb"),
          TyFun (TyVar (false, "cccccccccc"), TyVar (false, "cccccccccc"))
        )
      ),
      TyVar (false, "aaaaaaaaaa")
    )
  )

val test_ty_tyfun_8_val = 
  TyFun (
    TyVar (false, "aaaaaaaaaa"),
    TyFun (
      TyRef (
        [TyVar (false, "aaaaaaaa"),
         TyVar (true,  "bbbbbbbb"),
         TyVar (false, "cccccccc")],
        ("sometype", [])
      ),
      TyVar (false, "aaaaaaaaaa")
    )
  )

val test_ty_tyfun_9_val = 
  TyFun (
    TyVar (false, "aaaaaaaaaa"),
    TyFun (
      TyVar (false, "aaaaaaaaaa"),
      TyRef (
        [TyVar (false, "aaaaaaaa"),
         TyVar (true,  "bbbbbbbb"),
         TyVar (false, "cccccccc")],
        ("sometype", [])
      )
    )
  )
;

test3 (fmtTy H.empty) test_ty_tyfun_1_val;
test3 (fmtTy H.empty) test_ty_tyfun_2_val;
test3 (fmtTy H.empty) test_ty_tyfun_3_val;
test3 (fmtTy H.empty) test_ty_tyfun_4_val;
test3 (fmtTy H.empty) test_ty_tyfun_5_val;
test3 (fmtTy H.empty) test_ty_tyfun_6_val;
test3 (fmtTy H.empty) test_ty_tyfun_7_val;
test3 (fmtTy H.empty) test_ty_tyfun_8_val;
test3 (fmtTy H.empty) test_ty_tyfun_9_val;










val test_ty_typrod_1_val =
  TyProd (
    TyVar (false, "aaaaaaaaaaaa"),
    (
      TyVar (false, "bbbbbbbbbbbb"),
      []
    )
  )

val test_ty_typrod_2_val =
  TyProd (
    TyVar (false, "aaaaaaaaaaaa"),
    (
      TyVar (false, "bbbbbbbbbbbb"),
      [TyVar (false, "cccccccccccc")]
    )
  )

val test_ty_typrod_3_val =
  TyProd (
    TyVar (false, "aaaaaaaaaaaa"),
    (
      TyVar (false, "bbbbbbbbbbbb"),
      [
        TyVar (false, "cccccccccccc"),
        TyVar (false, "dddddddddddd")
      ]
    )
  )

(* not a valid syntax tree: needs parentheses *)
val test_ty_typrod_4_val =
  TyProd (
    test_ty_typrod_2_val,
    (
      TyVar (false, "bbbbbbbbbbbb"),
      [TyVar (false, "cccccccccccc")]
    )
  )

(* not a valid syntax tree: needs parentheses *)
val test_ty_typrod_5_val =
  TyProd (
    TyVar (false, "aaaaaaaaaaaa"),
    (
      test_ty_typrod_2_val,
      [TyVar (false, "cccccccccccc")]
    )
  )

(* not a valid syntax tree: needs parentheses *)
val test_ty_typrod_6_val =
  TyProd (
    TyVar (false, "aaaaaaaaaaaa"),
    (
      TyVar (false, "bbbbbbbbbbbb"),
      [test_ty_typrod_2_val]
    )
  )




val test_ty_typrod_11_val = TyParen test_ty_typrod_1_val

val test_ty_typrod_12_val = TyParen test_ty_typrod_2_val



(* not a valid syntax tree: needs parentheses *)
val test_ty_typrod_21_val =
  TyProd (
    TyVar (false, "aaaaaaaaaaaa"),
    (
      TyFun (TyVar (false, "bbbbbbbbbb"), TyVar (false, "cccccccccc")),
      [TyVar (false, "cccccccccccc")]
    )
  )

val test_ty_typrod_22_val =
  TyProd (
    TyVar (false, "aaaaaaaaaaaa"),
    (
      TyParen (
        TyFun (TyVar (false, "bbbbbbbbbb"), TyVar (false, "cccccccccc"))
      ),
      [TyVar (false, "cccccccccccc")]
    )
  )

val test_ty_typrod_23_val =
  TyFun (
    TyProd (TyVar (false, "aaaaaaaaaaaa"), (TyVar (false, "bbbbbbbbbb"), [])),
    TyProd (TyVar (false, "cccccccccccc"), (TyVar (false, "dddddddddd"), []))
  )
;

test3 (fmtTy H.empty) test_ty_typrod_1_val;
test3 (fmtTy H.empty) test_ty_typrod_2_val;
test3 (fmtTy H.empty) test_ty_typrod_3_val;
test3 (fmtTy H.empty) test_ty_typrod_4_val;
test3 (fmtTy H.empty) test_ty_typrod_5_val;
test3 (fmtTy H.empty) test_ty_typrod_6_val;

test3 (fmtTy H.empty) test_ty_typrod_11_val;
test3 (fmtTy H.empty) test_ty_typrod_12_val;

test3 (fmtTy H.empty) test_ty_typrod_21_val;
test3 (fmtTy H.empty) test_ty_typrod_22_val;







val test_ty_tyref_1_val =
  TyRef (
    [],
    ("some", ["type"])
  )

val test_ty_tyref_2_val =
  TyRef (
    [
      TyVar (false, "aaaaaaaaaaaa")
    ],
    ("some", ["type"])
  )

val test_ty_tyref_3_val =
  TyRef (
    [
      TyVar (false, "aaaaaaaaaaaa"),
      TyVar (false, "bbbbbbbbbbbb")
    ],
    ("some", ["type"])
  )

val test_ty_tyref_11_val =
  TyRef (
    [
      TyParen test_ty_typrod_1_val
    ],
    ("some", ["type"])
  )

val test_ty_tyref_12_val =
  TyRef (
    [
      test_ty_typrod_1_val,
      test_ty_typrod_1_val
    ],
    ("some", ["type"])
  )

;


test3 (fmtTy H.empty) test_ty_tyref_1_val;
test3 (fmtTy H.empty) test_ty_tyref_2_val;
test3 (fmtTy H.empty) test_ty_tyref_3_val;

test3 (fmtTy H.empty) test_ty_tyref_11_val;
test3 (fmtTy H.empty) test_ty_tyref_12_val;





val test_fundec_exp_1 : exp = ExpLName (LNameId ("Some", ["value"]))
val test_fundec_exp_2 : exp =
  ExpList
    [
      ExpConst (ConstLName (LNameId ("true", []))),
      ExpConst (ConstLName (LNameId ("false", []))),
      ExpConst (ConstLName (LNameId ("Some", ["b"])))
    ]


val test_fundec_apat_1 : apat = APatU
val test_fundec_pat_1 : pat = PatA test_fundec_apat_1

val test_fundec_apat_2 : apat = APatParen (PatA APatU, [PatA APatU])
val test_fundec_pat_2 : pat = PatA test_fundec_apat_2

val test_fundec_apat_3 : apat =
  APatList [test_fundec_pat_1, test_fundec_pat_1, test_fundec_pat_1]
val test_fundec_pat_3 : pat = PatA test_fundec_apat_3







val tyvars_1 : tyvars =
  (
    (false, "a"),
    [
      (true,  "b"),
      (false, "c")
    ]
  )

val test_fundec_1 : fundec =
  (
    NONE,
    (
      (
        (
          FunHeadPrefix
            (
              "testfun1",
              (
                test_fundec_apat_1,
                [test_fundec_apat_2]
              )
            ),
          NONE,
          test_fundec_exp_1
        ),
        []
      ) : exp funbind,
      []
    )
  )

val test_fundec_2 : fundec =
  (
    SOME tyvars_1,
    (
      (
        (
          FunHeadPrefix
            (
              "testfun2",
              (
                test_fundec_apat_1,
                [test_fundec_apat_2]
              )
            ),
          SOME test_ty_typrod_1_val,
          test_fundec_exp_1
        ),
        []
      ) : exp funbind,
      []
    )
  )

val test_fundec_3 : fundec =
  (
    NONE,
    (
      (
        (
          FunHeadPrefix
            (
              "testfun3",
              (
                test_fundec_apat_1,
                [test_fundec_apat_2]
              )
            ),
          NONE,
          test_fundec_exp_2
        ),
        []
      ) : exp funbind,
      []
    )
  )

val test_fundec_4 : fundec =
  (
    SOME tyvars_1,
    (
      (
        (
          FunHeadPrefix
            (
              "testfun4",
              (
                test_fundec_apat_1,
                [test_fundec_apat_2]
              )
            ),
          SOME test_ty_typrod_1_val,
          test_fundec_exp_2
        ),
        []
      ) : exp funbind,
      []
    )
  )

val test_fundec_5 : fundec =
  (
    NONE,
    (
      (
        (
          FunHeadPrefix
            (
              "testfun5",
              (
                test_fundec_apat_1,
                [test_fundec_apat_3]
              )
            ),
          NONE,
          test_fundec_exp_2
        ),
        []
      ) : exp funbind,
      []
    )
  )

val test_fundec_6 : fundec =
  (
    SOME tyvars_1,
    (
      (
        (
          FunHeadPrefix
            (
              "testfun6",
              (
                test_fundec_apat_1,
                [test_fundec_apat_3]
              )
            ),
          SOME test_ty_typrod_1_val,
          test_fundec_exp_2
        ),
        []
      ) : exp funbind,
      []
    )
  )


val test_fundec_11_clause_1 =
  (
    FunHeadPrefix
      (
        "testfun11",
        (
          test_fundec_apat_1,
          [test_fundec_apat_1]
        )
      ),
    NONE,
    test_fundec_exp_1
  )

val test_fundec_11_clause_2 =
  (
    FunHeadPrefix
      (
        "testfun11",
        (
          test_fundec_apat_1,
          [test_fundec_apat_1]
        )
      ),
    NONE,
    test_fundec_exp_2
  )

val test_fundec_11_clause_3 =
  (
    FunHeadPrefix
      (
        "testfun11",
        (
          test_fundec_apat_1,
          [test_fundec_apat_3]
        )
      ),
    NONE,
    test_fundec_exp_1
  )

val test_fundec_11 : fundec =
  (
    NONE,
    (
      (
        test_fundec_11_clause_1,
        [test_fundec_11_clause_2, test_fundec_11_clause_3]
      ) : exp funbind,
      []
    )
  )


val test_fundec_12_clause_1 =
  (
    FunHeadPrefix
      (
        "testfun12",
        (
          test_fundec_apat_1,
          [test_fundec_apat_1]
        )
      ),
    SOME test_ty_typrod_1_val,
    test_fundec_exp_1
  )

val test_fundec_12_clause_2 =
  (
    FunHeadPrefix
      (
        "testfun12",
        (
          test_fundec_apat_1,
          [test_fundec_apat_1]
        )
      ),
    SOME test_ty_typrod_1_val,
    test_fundec_exp_2
  )

val test_fundec_12_clause_3 =
  (
    FunHeadPrefix
      (
        "testfun12",
        (
          test_fundec_apat_1,
          [test_fundec_apat_1]
        )
      ),
    SOME test_ty_typrod_2_val,
    test_fundec_exp_1
  )

val test_fundec_12_clause_4 =
  (
    FunHeadPrefix
      (
        "testfun12",
        (
          test_fundec_apat_1,
          [test_fundec_apat_3]
        )
      ),
    SOME test_ty_typrod_2_val,
    test_fundec_exp_2
  )

val test_fundec_12 : fundec =
  (
    SOME tyvars_1,
    (
      (
        test_fundec_12_clause_1,
        [
          test_fundec_12_clause_2,
          test_fundec_12_clause_3,
          test_fundec_12_clause_4
        ]
      ) : exp funbind,
      []
    )
  )
;


test2 (fmtFunDec (H.str ";")) test_fundec_1;
test2 (fmtFunDec (H.str ";")) test_fundec_2;
test2 (fmtFunDec (H.str ";")) test_fundec_3;
test2 (fmtFunDec (H.str ";")) test_fundec_4;
test2 (fmtFunDec (H.str ";")) test_fundec_5;
test2 (fmtFunDec (H.str ";")) test_fundec_6;

test2 (fmtFunDec (H.str ";")) test_fundec_11;
test2 (fmtFunDec (H.str ";")) test_fundec_12;















val test_strdec_dec_valdec_1 =
  StrDecDec (
    DecVal (
      (
        NONE,
        false,
        PatA (
          APatList [PatA (APatId "x"), PatA (APatId "y")]
        ),
        ExpList [
          ExpConst (ConstInt (2, NONE)),
          ExpConst (ConstInt (3, NONE))
        ]
      ),
      []
    )
  )
;

val test_strdec_dec_valdec_2 =
  StrDecDec (
    DecVal (
      (
        NONE,
        false,
        PatA (
          APatList [PatA (APatId "x"), PatA (APatId "y"), PatA (APatId "z")]
        ),
        ExpList [
          ExpConst (ConstInt (2, NONE)),
          ExpConst (ConstInt (3, NONE)),
          ExpConst (ConstInt (5, NONE))
        ]
      ),
      []
    )
  )
;

test2 (fmtStrDec (H.str ";")) test_strdec_dec_valdec_1;
test2 (fmtStrDec (H.str ";")) test_strdec_dec_valdec_2;








val test_sigdec_1_qsig_1 : qsig =
  (
    SigSpec
      [
        (
          SpecType (
            false,
            ((test_tyname_2_val, NONE), [(test_tyname_4_val, NONE)])
          ),
          false
        ),
        (
          SpecType (
            false,
            (
              (
                test_tyname_2_val,
                SOME test_ty_tyfun_6_val
              ),
              [(test_tyname_4_val, SOME test_ty_tyfun_9_val)]
            )
          ),
          false
        ),
        (
          SpecVal (
            (
              (
                "someval",
                test_ty_tyfun_2_val
              ),
              [("anotherval", test_ty_tyfun_9_val)]
            )
          ),
          true
        ),
        (
          SpecExn (
            (
              (
                "Error1",
                SOME test_ty_tyfun_2_val
              ),
              [
                ("Error2", NONE),
                ("Error3", SOME test_ty_tyfun_6_val),
                ("Fail2", SOME test_ty_tyfun_9_val)
              ]
            )
          ),
          true
        )
      ],
    []
  )

val test_sigdec_1_qsig_2 : qsig =
  (
    SigSpec
      [
        (
          SpecDatatype (
            (
              (
                test_tyname_2_val,
                (
                  (
                    "A1",
                    NONE
                  ),
                  []
                )
              ),
              [
              ]
            ),
            NONE
          ),
          true
        ),
        (
          SpecDatatype (
            (
              (
                test_tyname_2_val,
                (
                  (
                    "A1",
                    NONE
                  ),
                  []
                )
              ),
              [
                (
                  test_tyname_2_val,
                  (
                    (
                      "B1",
                      NONE
                    ),
                    [
                      (
                        "B2",
                        SOME (TyRef ([], ("Int", ["int"])))
                      )
                    ]
                  )
                )
              ]
            ),
            NONE
          ),
          false
        ),
        (
          SpecDatatype (
            (
              (
                test_tyname_2_val,
                (
                  (
                    "C1",
                    NONE
                  ),
                  [
                    (
                      "C2",
                      SOME test_ty_tyfun_6_val
                    )
                  ]
                )
              ),
              [
                (
                  test_tyname_3_val,
                  (
                    (
                      "D1",
                      SOME test_ty_tyfun_3_val
                    ),
                    [
                      (
                        "D2",
                        SOME test_ty_tyfun_9_val
                      )
                    ]
                  )
                )
              ]
            ),
            NONE
          ),
          true
        ),
        (
          SpecDatatypeEq
            (
              "t",
              ("some", ["other_t"])
            ),
          true
        )
      ],
    []
  )





val test_sigdec_1 : sigdec =
  (
    (
      "TEST_1",
      test_sigdec_1_qsig_1
    ),
    [
      (
        "TEST_2",
        test_sigdec_1_qsig_2
      ),
      (
        "TEST_3",
        (
          SigSpec
            [],
          []
        )
      ),
      (
        "TEST_4",
        (
          SigName "SOME_OTHER_4",
          []
        )
      )
    ]
  )
;

test2 (fmtSigDec (H.str ";")) test_sigdec_1;









val test_functdec_1_qsig_1 : qsig =
  (
    SigName "TEST_11",
    []
  )

val test_functdec_1_qsig_2 : qsig =
  (
    SigName "TEST_12",
    []
  )


val test_functdec_1 : functdec =
  (
    (
      "TestFunctor1",
      FunctParamSig ("T", test_functdec_1_qsig_1),
      SOME (true, test_functdec_1_qsig_2),
      StructName ("Test", ["Struct1"])
    ),
    []
  )

val test_functdec_2 : functdec =
  (
    (
      "TestFunctor2",
      FunctParamSig ("T", test_functdec_1_qsig_1),
      SOME (true, test_functdec_1_qsig_2),
      StructBody
        [
          (test_strdec_dec_valdec_1, true),
          (test_strdec_dec_valdec_2, false)
        ]
    ),
    []
  )

val test_functdec_3 : functdec =
  (
    (
      "TestFunctor3",
      FunctParamSig ("T", test_functdec_1_qsig_1),
      SOME (true, test_sigdec_1_qsig_2),
      StructBody
        [
          (test_strdec_dec_valdec_1, true),
          (test_strdec_dec_valdec_2, false)
        ]
    ),
    []
  )

val test_functdec_4 : functdec =
  (
    (
      "TestFunctor4",
      FunctParamSig ("T", test_sigdec_1_qsig_1),
      SOME (true, test_sigdec_1_qsig_2),
      StructBody
        [
          (test_strdec_dec_valdec_1, true),
          (test_strdec_dec_valdec_2, false)
        ]
    ),
    []
  )
;





test2 (fmtFunctDec (H.str ";")) test_functdec_1;
test2 (fmtFunctDec (H.str ";")) test_functdec_2;
test2 (fmtFunctDec (H.str ";")) test_functdec_3;
test2 (fmtFunctDec (H.str ";")) test_functdec_4;



