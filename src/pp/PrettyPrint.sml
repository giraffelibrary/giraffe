(*
 * A formatting function comes in one of three flavours according to whether
 * it produces
 *
 *   - a horizontal text fragment with return type `h`; such a text
 *     fragment can be concatenated horizontally or converted to a single
 *     line vertical text fragment;
 *
 *   - a vertical text fragment with return type `v`; such a text
 *     fragment can be concatenated vertically only;
 *
 *   - either a vertical or a horizontal text fragment with return type `t`.
 *
 * Typically, type `t` is returned when a text fragment should be
 * concatenated horizontally if horizontal.  A text fragment that should be
 * concatenated vertically only should be returned using type `v`.
 *
 *
 * Given a vertical block of text, there is no operation to append to the
 * last line: such an operation would be inefficient in general due to the
 * extent to which text trees must be rebuilt.  Therefore, by convention,
 * formatting functions that can produce vertical text have a parameter for
 * trailing horizontal text, where required.
 *
 *
 * Pretty printing support not yet implemented for
 *   SpecSharing
 *   FunHeadInfixPar
 *   FunHeadInfix
 *   ExpWhile
 *   DecAbstype
 *   DecInfix
 *   DecNonfix
 *)

structure PrettyPrint :>
  PRETTY_PRINT
    where type h = HVTextTree.H.t
    where type v = HVTextTree.V.t
    where type t = HVTextTree.t =
  struct
    structure CST = ConcreteSyntaxTree

    open CST
    open HVTextTree

    type h = H.t
    type v = V.t


    infixr :::
    fun (x ::: xs1) = (x, op :: xs1)

    val sp1 = H.sp 1
    val indent = V.indentWith (H.sp 2) true

    fun fmtHLast fmtX hLast x = H.seq [fmtX x, hLast]


    fun vJoin indent (v1, v2) : v = V.seq [v1, indent v2]

    fun join (sep, indent) =
      fn
        (H h1, H h2) => H (H.seq [h1, sep, h2])
      | (t1,   t2)   => V (vJoin indent (toV t1, toV t2))


    (* General purpose formatters *)

    fun fmtSeq (separator, terminator) fmtX xs =
      let
        val rec aux =
          fn
            []      => []
          | x :: [] => fmtX terminator x :: []
          | x :: xs => fmtX separator x :: aux xs
      in
        aux xs
      end


    (* Common pattern formatters *)

    (* `fmtKwXSymY` is a general formatter for the common pattern
     *
     *   <kw> X <sym> Y
     *
     * e.g.
     *
     *    type t = int
     *    val x : real
     *
     * where X is horizontal text and Y is either horizontal or vertical
     * text.  If Y is vertical text, a new line is inserted before Y and
     * Y is indented.  The oritentation of the result is the same as the
     * orientation of Y.  The result of
     *
     *   fmtKwXSymY (kw, sym) (fmtX, fmtY) hLast (x, y)
     *
     * is
     *
     *   case <fmtY hLast y> of
     *
     *     .   .      .                         .
     *     | h |  =>  | <kw> <fmtX x> <sym> <h> |
     *     `   '      `                         '
     *
     *     .---.      .---------------------.
     *       v    =>    <kw> <fmtX x> <sym>
     *     `---'          <v>
     *                `---------------------'
     *)

    fun fmtXSymY sym (fmtX, fmtY) hLast (x, y) : t =
      let
        val h = H.seq [fmtX x, sp1, H.str sym]
      in
        join (sp1, indent) (H h, fmtY hLast y)
      end

    fun fmtKwXSymY (kw, sym) (fmtX, fmtY) hLast (x, y) : t =
      let
        val h = H.seq [H.str kw, sp1, fmtX x, sp1, H.str sym]
      in
        join (sp1, indent) (H h, fmtY hLast y)
      end


    (* Support for formatting list, tuple and record literals.
     * Used for patterns and expressions.
     *)

    local
      fun fmtV (openStr, closeStr) hLast vs =
        V.seq [
          V.str openStr,
          indent (V.seq vs),
          V.line (H.seq [H.str closeStr, hLast])
        ]
      fun fmtDisplay hLenMax (openStr, closeStr) fmtX hLast xs =
        case fromList (fmtSeq (H.str ",", H.empty) fmtX xs) of
          HList hs =>
            if length hs < hLenMax
            then H (H.seq [H.str openStr, H.seqWith sp1 I hs, H.str closeStr, hLast])
            else V (fmtV (openStr, closeStr) hLast (map V.line hs))
        | VList vs => V (fmtV (openStr, closeStr) hLast vs)
    in
      fun fmtList fmtX = fmtDisplay 3 ("[", "]") fmtX
      fun fmtTuple fmtX = fmtDisplay 3 ("(", ")") fmtX
      fun fmtRecord fmtX = fmtDisplay 2 ("{", "}") fmtX
    end


    (* Support for formatting |-separated clauses.
     * Used for datatype/abstype and matches (case/handle/fn expressions).
     *)

    fun fmtClause sym =
      let
        val h = H.seq [sp1, H.str sym]
      in
        fn (fmtX, fmtY) => fn hLast => fn (x, y) =>
          join (sp1, indent) (fmtX h x, fmtY hLast y)
      end

    local
      val n = 2
      val s = "|"
      val sp = H.sp n
      val bar = H.seq [H.str s, H.sp (n - size s)]
    in
      fun indentClause isFirst fmtX hLast =
        toV o indentWith1 (if isFirst then sp else bar, sp) o fmtX hLast
    end

    fun fmtClauses sym (fmtX, fmtY) hLast (xy1, xys) : v =
      let
        val fmt = fmtClause sym (fmtX, fmtY)
      in
        V.seq [
          indentClause true fmt (case xys of [] => hLast | _ => H.empty) xy1,
          V.seq (fmtSeq (H.empty, hLast) (indentClause false fmt) xys)
        ]
      end

    fun fmtOptClauses sym (fmtX, fmtY) hLast (xy1, xys) : v =
      let
        fun fmt hLast =
          fn
            (x, SOME y) => fmtClause sym (fmtX, fmtY) hLast (x, y)
          | (x, NONE)   => fmtX hLast x
      in
        V.seq [
          indentClause true fmt (case xys of [] => hLast | _ => H.empty) xy1,
          V.seq (fmtSeq (H.empty, hLast) (indentClause false fmt) xys)
        ]
      end


    (* Support for formatting spines of infix operators in expressions and
     * infix constructors in patterns.
     *
     * `fmtInfixList` returns horizontal text, if possible, for spines of length 2
     * and vertical text for spines of length 3 or more.
     *)

    fun fmtInfixList sym fmtX hLast (x1, (x2, xs)) : t =
      let
        val n = 2
        val head = H.seq [sp1, H.str sym, sp1]
        val rest = H.sp (H.size head)
        fun fmtRest hLast = indentWith1 (head, rest) o fmtX hLast
      in
        case
          fromList (fmtX H.empty x1 :: fmtSeq (H.empty, hLast) fmtRest (x2 :: xs))
        of
          HList hs =>
            if length hs <= n
            then H (H.seq hs)
            else V (V.concat hs)
        | VList vs => V (V.seq vs)
      end

    val rec unfoldTyFun =
      fn
        TyFun (tyA, tyB) => tyA ::: unfoldTyFun tyB
      | ty               => (ty, [])

    fun unfoldInfixPat id pat =
      case pat of
        PatInfix (pat1, id', pat2) =>
          if id = id'
          then pat1 ::: unfoldInfixPat id pat2
          else (pat, [])
      | _                          => (pat, [])

    fun unfoldInfixApp id exp =
      case exp of
        ExpInfixApp (exp1, id', exp2) =>
          if id = id'
          then exp1 ::: unfoldInfixApp id exp2
          else (exp, [])
      | _                            => (exp, [])

    fun unfoldLogOp logOp exp =
      case exp of
        ExpLogOp (exp1, logOp', exp2) =>
          if logOp = logOp'
          then exp1 ::: unfoldLogOp logOp exp2
          else (exp, [])
      | _                             => (exp, [])


    (* Support for formatting and-separated syntactic entities *)

    fun fmtAndList kw fmtX hLast (x, xs) : v =
      V.seq [
        fmtX kw (case xs of [] => hLast | _ => H.empty) x,
        V.seq (fmtSeq (H.empty, hLast) (fmtX "and") xs)
      ]



    (* ---- Identifiers and literals ---- *)

    val fmtId : id -> h = H.str
    val fmtAlphId : alphid -> h = H.str
    val fmtLabel : label -> h = H.str

    fun fmtTyVar (isEqType, alphid) : h =
      H.seq [H.str (if isEqType then "''" else "'"), fmtAlphId alphid]

    fun fmtInfixOp infixOp : h = H.seq [H.str "op", sp1, fmtId infixOp]

    val fmtName : name -> h =
      fn
        NameId id      => fmtId id
      | NameOp infixOp => fmtInfixOp infixOp

    fun fmtLid (id, ids) : h = H.concatWith "." (id :: ids)

    val fmtLName : lname -> h =
      fn
        LNameId lid     => fmtLid lid
      | LNameOp infixOp => fmtInfixOp infixOp


    (* const *)

    fun fmtConstInt (d, optE) =
      H.seq [
        H.str (IntInf.fmt StringCvt.DEC d),
        case optE of
          NONE   => H.empty
        | SOME e => H.concat ["E", IntInf.fmt StringCvt.DEC e]
      ]

    fun fmtConstWord (d, optE) =
      if d < 0
      then raise Fail "fmtConstWord: word literal is negative"
      else
        H.seq [
          H.concat ["0w", IntInf.fmt StringCvt.DEC d],
          case optE of
            NONE   => H.empty
          | SOME e => H.concat ["E", IntInf.fmt StringCvt.DEC e]
        ]

    fun fmtConstReal (d, p, optE) =
      if p < 0
      then raise Fail "fmtConstReal: decimal point position is negative"
      else
        let
          val (s, m) = if d < 0 then ("~", ~ d) else ("", d)
          val numDigits = IntInfMath.log10 m + 1 handle Domain => 1
          val numZeros = Int.max (p - numDigits, 0)
          val (whole, fraction) = IntInf.divMod (m, IntInf.pow (10, p))
        in
          H.seq [
            H.concat [
              s,
              IntInf.fmt StringCvt.DEC whole,
              ".",
              CharVector.tabulate (numZeros, fn _ => #"0"),
              IntInf.fmt StringCvt.DEC fraction
            ],
            case optE of
              NONE   => H.empty
            | SOME e => H.concat ["E", IntInf.fmt StringCvt.DEC e]
          ]
        end

    val fmtConst =
      fn
        ConstInt (d, optE)       => fmtConstInt (d, optE)
      | ConstWord (d, optE)      => fmtConstWord (d, optE)
      | ConstReal (d, p, optE)   => fmtConstReal (d, p, optE)
      | ConstChar c              => H.seq [H.str "#\"", H.chr c, H.str "\""]
      | ConstString s            => H.concat ["\"", String.toString s, "\""]
      | ConstUnit                => H.str "()"
      | ConstLName (LNameId lid) => fmtLid lid
      | ConstLName (LNameOp iop) => H.concat ["op ", iop]



    (* ---- Types ---- *)

    (* ty *)

    fun fmtTyRef hLast (tys, lid) : t =
      case tys of
        []   => H (H.seq [fmtLid lid, hLast])
      | [ty] =>
          let
            val h2 = H.seq [fmtLid lid, hLast]
            val t1 = fmtTy H.empty ty
          in
            case t1 of
              H h1 => H (H.seqWith sp1 I [h1, h2])
            | V v1 => V (V.seq [v1, indent (V.line h2)])
          end
      | _    =>
          let
            val h1 = H.str "("
            val h2 = H.seq [H.str ")", sp1, fmtLid lid, hLast]
            val ts = fmtSeq (H.str ",", H.empty) fmtTy tys
          in
            case fromList ts of
              HList hs => H (H.seq [h1, H.seqWith sp1 I hs, h2])
            | VList vs => V (V.seq [V.line h1, indent (V.seq vs), V.line h2])
          end

    and fmtTyRecField hLast labelTy =
      fmtXSymY ":" (fmtLabel, fmtTy) hLast labelTy

    and fmtTy hLast : ty -> t =
      fn
        TyVar tyVar       => H (fmtHLast fmtTyVar hLast tyVar)
      | TyRef tyRef       => fmtTyRef hLast tyRef
      | TyProd (ty, tys1) => fmtInfixList "*" fmtTy hLast (ty, tys1)
      | TyFun (tyA, tyB)  => fmtInfixList "->" fmtTy hLast (tyA, unfoldTyFun tyB)
      | TyRec labelTys    => fmtRecord fmtTyRecField hLast labelTys
      | TyParen ty        =>
          indentWith1 (H.str "(", sp1) (fmtTy (H.seq [H.str ")", hLast]) ty)

    fun fmtXEqTy kw fmtX = fmtKwXSymY (kw, "=") (fmtX, fmtTy)



    (* ---- Patterns ---- *)

    (* apat *)

    fun fmtAPat hLast : apat -> t =
      fn
        APatU                 => H (H.seq [H.str "_", hLast])
      | APatVar name          => H (fmtHLast fmtName hLast name)
      | APatConst const       => H (fmtHLast fmtConst hLast const)
      | APatParen (pat, pats) => fmtTuple fmtPat hLast (pat :: pats)
      | APatList pats         => fmtList fmtPat hLast pats
      | APatRec fpats         => fmtRecord fmtFPat hLast fpats


    (* fpat *)

    and fmtFPat hLast : fpat -> t =
      fn
        FPatEq labelPat       => fmtXSymY "=" (fmtLabel, fmtPat) hLast labelPat
      | FPatAs (id, SOME pat) => fmtXSymY "as" (fmtId, fmtPat) hLast (id, pat)
      | FPatAs (id, NONE)     => H (fmtHLast fmtId hLast id)


    (* pat *)

    and fmtPat hLast : pat -> t =
      fn
        PatA apat                 => fmtAPat hLast apat
      | PatPrefix (lid, pat)      => fmtPrefixPat hLast (lid, pat)
      | PatInfix (pat1, id, pat2) => fmtInfixPat hLast (pat1, id, pat2)
      | PatTy (pat, ty)           => fmtTyPat hLast (pat, ty)
      | PatVarAs (name, pat)      => fmtXSymY "as" (fmtName, fmtPat) hLast (name, pat)

    and fmtInfixPat hLast (pat1, id, pat2) =
      fmtInfixList id fmtPat hLast (pat1, unfoldInfixPat id pat2)

    and fmtPrefixPat hLast (lid, pat) =
      join (sp1, indent) (H (fmtLid lid), fmtPat hLast pat)

    and fmtTyPat hLast (pat, ty) =
      join (sp1, indent) (
        fmtPat (H.seq [sp1, H.str ":"]) pat,
        fmtTy hLast ty
      )



    (* ---- Declarations ---- *)

    (* tyvars *)

    fun fmtTyVars (tyVar, tyVars) : h =
      case tyVars of
        [] => fmtTyVar tyVar
      | _  =>
          H.seq [
            H.str "(",
            H.seq (
              fmtSeq
                (H.seq [H.str ",", sp1], H.empty)
                (fmtHLast fmtTyVar)
                (tyVar :: tyVars)
            ),
            H.str ")"
          ]


    (* tyname, tylname *)

    fun fmtTyGenName fmtX (tyVars, x) : h =
      case tyVars of
        []            => fmtX x
      | op :: tyVars1 => H.seq [fmtTyVars tyVars1, sp1, fmtX x]

    val fmtTyName : tyname -> h = fmtTyGenName fmtId
    val fmtTyLName : tylname -> h = fmtTyGenName fmtLid


    (* typebinds *)

    fun fmtTyBind1 kw hLast : tyname * ty -> v =
      toV o fmtXEqTy kw fmtTyName hLast

    fun fmtTyBinds kw hLast : typebinds -> v = fmtAndList kw fmtTyBind1 hLast


    (* datatypebinds *)

    val fmtDatatypeClauses : h -> (name * ty option) list1 -> v =
      fmtOptClauses "of" (fn hLast => H o fmtHLast fmtName hLast, fmtTy)

    fun fmtDatatypeBind1 kw hLast (tyName, clauses1) : v =
      V.seq [
        V.line (H.seq [H.str kw, sp1, fmtTyName tyName, sp1, H.str "="]),
        fmtDatatypeClauses hLast clauses1
      ]

    fun fmtDatatypeBinds hLast : datatypebinds -> v =
      fmtAndList "datatype" fmtDatatypeBind1 hLast


    (* funhead *)

    fun fmtFunHead hLast : funhead -> t =
      fn
        FunHeadPrefix (name, apats1) =>
          let
            val hName = fmtName name
            val ts = fmtSeq (H.empty, hLast) fmtAPat (op :: apats1)
          in
            case fromList ts of
              HList hs => H (H.seqWith sp1 I (hName :: hs))
            | VList vs => V (V.seq [V.line hName, indent (V.seq vs)])
          end
      | FunHeadInfixPar              => raise Fail "FunHeadInfixPar"
      | FunHeadInfix                 => raise Fail "FunHeadInfix"

    fun fmtFunHeadOptTy hLast (funHead, optTy) : t =
      case optTy of
        NONE    => fmtFunHead hLast funHead
      | SOME ty =>
          join (sp1, indent) (
            fmtFunHead H.empty funHead,
            indentWith1 (H.seq [H.str ":", sp1], H.sp 2) (fmtTy hLast ty)
          )


    (* typedec *)

    val fmtTyDec : h -> typedec -> v = fmtTyBinds "type"


    (* datatypedec *)

    fun fmtDatatypeDec hLast : datatypedec -> v =
      fn
        (dtbinds, NONE)        => fmtDatatypeBinds hLast dtbinds
      | (dtbinds, SOME tbinds) =>
          V.seq [
            fmtDatatypeBinds H.empty dtbinds,
            fmtTyBinds "withtype" hLast tbinds
          ]


    (* eqdatatypedec *)

    fun fmtEqDatatypeDec hLast (id, lid) : v =
      V.line (
        H.seq [
          H.str "datatype", sp1,
          fmtId id, sp1,
          H.str "=", sp1,
          H.str "datatype", sp1,
          fmtLid lid, hLast
        ]
      )


    (* exndec *)

    fun fmtExnDecTypeOf kw hLast : name * ty option -> v =
      fn
        (name, NONE)    => V.line (H.seq [H.str kw, sp1, fmtName name, hLast])
      | (name, SOME ty) =>
          toV (fmtKwXSymY (kw, "of") (fmtName, fmtTy) hLast (name, ty))

    fun fmtExnDec1 kw hLast : name * exndectype -> v =
      fn
        (name, ExnDecTypeOf optTy) => fmtExnDecTypeOf kw hLast (name, optTy)
      | (name, ExnDecTypeEq lname) =>
          V.line (
            H.seq [
              H.str kw, sp1,
              fmtName name, sp1,
              H.str "=", sp1,
              fmtLName lname, hLast
            ]
          )

    fun fmtExnDec hLast : exndec -> v =
      fmtAndList "exception" fmtExnDec1 hLast


    (* dec *)

    fun fmtOpenDec hLast (lid, lids) : v =
      V.line (H.seq [H.str "open", sp1, H.seqWith sp1 fmtLid (lid :: lids), hLast])

    fun fmtDec hLast : dec -> v =
      fn
        DecVal valDec               => fmtValDec hLast valDec
      | DecFun funDec               => fmtFunDec hLast funDec
      | DecType typeDec             => fmtTyDec hLast typeDec
      | DecDatatype datatypeDec     => fmtDatatypeDec hLast datatypeDec
      | DecDatatypeEq eqDatatypeDec => fmtEqDatatypeDec hLast eqDatatypeDec
      | DecAbstype                  => raise Fail "DecAbstype"
      | DecExn exnDec               => fmtExnDec hLast exnDec
      | DecLocal (decs1, decs2)     => fmtLocalDec hLast (decs1, decs2)
      | DecOpen lids1               => fmtOpenDec hLast lids1
      | DecInfix                    => raise Fail "DecInfix"
      | DecNonfix                   => raise Fail "DecNonfix"

    and fmtLocalDec hLast (decs1, decs2) =
      V.seq [
        V.line (H.str "local"),
        indent (fmtDecs decs1),
        V.line (H.str "in"),
        indent (fmtDecs decs2),
        V.line (H.seq [H.str "end", hLast])
      ]


    (* decs *)

    and fmtDecs decs : v =
      let
        fun fmt (dec, semi) = fmtDec (if semi then H.str ";" else H.empty) dec
      in
        V.seq (map fmt decs)
      end


    (* valdec *)

    and fmtValDec1 kw hLast (tyVars, isRec, pat, exp) : v =
      let
        val hTyVars =
          case tyVars of
            []            => H.empty
          | op :: tyVars1 => fmtHLast fmtTyVars sp1 tyVars1
        val hRec = if isRec then H.seq [H.str "rec", sp1] else H.empty

        val h1 = H.seq [H.str kw, sp1, hTyVars, hRec]
        val h2 = H.seq [sp1, H.str "="]
      in
        toV (
          join (sp1, indent) (
            indentWith1 (h1, H.empty) (fmtPat h2 pat),
            fmtExp hLast exp
          )
        )
      end

    and fmtValDec hLast : valdec -> v = fmtAndList "val" fmtValDec1 hLast


    (* fundec
     *
     * Single clause
     *
     *   fun id hapat hapat = hexp
     *
     *   fun tyvars id hapat hapat : hty = hexp
     *
     *   fun id hapat hapat =
     *     vexp
     *
     *   fun tyvars id hapat hapat : hty =
     *     vexp
     *
     *   fun tyvars id
     *     vapat
     *     vapat =
     *     exp
     *
     *   fun tyvars id
     *     vapat
     *     vapat
     *     : ty
     *       ty =
     *     exp
     *
     *
     * Multi-clause
     *
     *   fun
     *     id hapat hapat = hexp
     *   | id hapat hapat =
     *       vexp
     *   | id
     *       vpat
     *       vpat =
     *       exp
     *
     *   fun tyvars
     *     id hapat hapat : hty = hexp
     *   | id hapat hapat : hty =
     *       vexp
     *   | id hapat hapat
     *       : vty
     *         vty =
     *       exp
     *   | id
     *       vapat
     *       vapat
     *       : vty
     *         vty =
     *       exp
     *)

    and fmtFunDec1 tyVars kw hLast (funBind, funBinds) : v =
      let
        val h =
          case tyVars of
            []            => H.str kw
          | op :: tyVars1 => H.seq [H.str kw, sp1, fmtTyVars tyVars1]

        fun aux (a, b, c) = ((a, b), c)
        val x = aux funBind
      in
        case funBinds of
          []     =>
            toV (
              indentWith1 (H.seq [h, sp1], H.empty) (
                fmtClause "=" (fmtFunHeadOptTy, fmtExp) hLast x
              )
            )
        | _ :: _ =>
            let
              val xs = map aux funBinds
            in
                V.seq [
                  V.line h,
                  fmtClauses "=" (fmtFunHeadOptTy, fmtExp) hLast (x, xs)
                ]
            end
      end

    and fmtFunDec hLast (tyVars, funBinds1) : v =
      fmtAndList "fun" (fmtFunDec1 tyVars) hLast funBinds1



    (* ---- Expressions ---- *)

    (* exp *)

    and fmtExp hLast : exp -> t =
      fn
        ExpLName lname               => H (H.seq [fmtLName lname, hLast])
      | ExpConst const               => H (H.seq [fmtConst const, hLast])
      | ExpTy (exp, ty)              => fmtTyExp hLast (exp, ty)
      | ExpParen (exp, exps)         => fmtTuple fmtExp hLast (exp :: exps)
      | ExpList exps                 => fmtList fmtExp hLast exps
      | ExpRec labelExps             => fmtRecord fmtExpRecField hLast labelExps
      | ExpLabel label               => fmtLabelExp hLast label
      | ExpSeq (exp, exps1)          => fmtSeqExp hLast (exp, exps1)
      | ExpLet (decs, exps1)         => fmtLetExp hLast (decs, exps1)
      | ExpApp (exp1, exp2)          => fmtAppExp hLast (exp1, exp2)
      | ExpInfixApp (exp1, id, exp2) => fmtInfixAppExp hLast (exp1, id, exp2)
      | ExpLogOp (exp1, logOp, exp2) => fmtLogOpExp hLast (exp1, logOp, exp2)
      | ExpHandle (exp, mat)         => fmtHandleExp hLast (exp, mat)
      | ExpRaise exp                 => fmtRaiseExp hLast exp
      | ExpCond (expC, expA, expB)   => fmtCond hLast (expC, expA, expB)
      | ExpWhile                     => raise Fail "ExpWhile"
      | ExpCase (exp, mat)           => fmtCaseExp hLast (exp, mat)
      | ExpFn mat                    => fmtFnExp hLast mat
      | ExpMLtonImport (sym, ids, ty)
                                     => fmtMLtonImportExp hLast (sym, ids, ty)

    and fmtExps hLast exps : v =
      V.seq (fmtSeq (H.str ";", hLast) (fn hLast => toV o fmtExp hLast) exps)

    and fmtTyExp hLast (exp, ty) =
      join (sp1, indent) (
        fmtExp (H.seq [sp1, H.str ":"]) exp,
        fmtTy hLast ty
      )

    and fmtExpRecField hLast labelExp =
      fmtXSymY "=" (fmtLabel, fmtExp) hLast labelExp

    and fmtLabelExp hLast label = H (H.seq [H.str "#", fmtLabel label, hLast])

    and fmtSeqExp hLast (exp, exps1) =
      V (
        V.seq [
          V.str "(",
          indent (fmtExps H.empty (exp :: op :: exps1)),
          V.line (H.seq [H.str ")", hLast])
        ]
      )

    and fmtLetExp hLast (decs, exps1) =
      V (
        V.seq [
          V.str "let",
          indent (fmtDecs decs),
          V.str "in",
          indent (fmtExps H.empty (op :: exps1)),
          V.line (H.seq [H.str "end", hLast])
        ]
      )

    and fmtAppExp hLast (exp1, exp2) =
      join (sp1, indent) (fmtExp H.empty exp1, fmtExp hLast exp2)

    and fmtInfixAppExp hLast (exp1, id, exp2) =
      fmtInfixList id fmtExp hLast (exp1, unfoldInfixApp id exp2)

    and fmtLogOpExp hLast (exp1, logOp, exp2) =
      fmtInfixList (logOpKw logOp) fmtExp hLast (exp1, unfoldLogOp logOp exp2)

    and logOpKw logOp =
      case logOp of
        LogOpAndAlso => "andalso"
      | LogOpOrElse  => "orelse"

    and fmtHandleExp hLast (exp, mat) =
      join (sp1, indent) (
        fmtExp H.empty exp,
        join (sp1, I) (H (H.str "handle"), fmtMatch hLast mat)
      )

    and fmtRaiseExp hLast exp =
      join (sp1, indent) (H (H.str "raise"), fmtExp hLast exp)

    and fmtCond hLast (expC, expA, expB) =
      join (sp1, I) (
        join (sp1, I) (
          join (sp1, indent) (H (H.str "if"), fmtExp H.empty expC),
          join (sp1, indent) (H (H.str "then"), fmtExp H.empty expA)
        ),
        join (sp1, indent) (H (H.str "else"), fmtExp hLast expB)
      )

    and fmtCaseExp hLast (exp, mat) =
      join (sp1, I) (
        join (sp1, I) (
          join (sp1, indent) (H (H.str "case"), fmtExp H.empty exp),
          H (H.str "of")
        ),
        fmtMatch hLast mat
      )

    and fmtFnExp hLast mat =
      join (sp1, I) (H (H.str "fn"), fmtMatch hLast mat)

    and fmtMLtonImportExp hLast (sym, ids, ty) =
      join (sp1, indent) (
        H (
          H.seq [
            H.str "_import",
            sp1,
            fmtConst (ConstString sym),
            sp1,
            H.seq (fmtSeq (sp1, sp1) (fmtHLast fmtId) ids),
            H.str ":"
          ]
        ),
        fmtTy (H.seq [H.str ";", hLast]) ty
      )



    (* ---- Matches ---- *)

    (* match *)

    and fmtMatch hLast patExps1 : t =
      case patExps1 of
        (patExp, [])   => (
          case fmtClause "=>" (fmtPat, fmtExp) hLast patExp of
            V v => V (indent v)
          | t   => t
        )
      | (_,      _::_) =>
          V (fmtClauses "=>" (fmtPat, fmtExp) hLast patExps1)



    (* ---- Modules ---- *)

    (* valspec *)

    fun fmtValSpec1 kw hLast : id * ty -> v =
      toV o fmtKwXSymY (kw, ":") (fmtId, fmtTy) hLast

    fun fmtValSpec hLast : valspec -> v = fmtAndList "val" fmtValSpec1 hLast


    (* typespec *)

    fun fmtTySpec1 kw hLast : tyname * ty option -> v =
      fn
        (tyname, SOME ty) => toV (fmtXEqTy kw fmtTyName hLast (tyname, ty))
      | (tyname, NONE)    =>
          V.line (H.seq [H.str kw, sp1, fmtTyName tyname, hLast])

    fun fmtTySpec hLast (isEqType, tySpecs1) : v =
      fmtAndList (if isEqType then "eqtype" else "type") fmtTySpec1 hLast tySpecs1


    (* datatypespec *)

    val fmtDatatypeSpec = fmtDatatypeDec


    (* eqdatatypespec *)

    val fmtEqDatatypeSpec = fmtEqDatatypeDec


    (* exnspec *)

    fun fmtExnSpec1 kw hLast (id, optTy) =
      fmtExnDecTypeOf kw hLast (NameId id, optTy)

    fun fmtExnSpec hLast : exnspec -> v =
      fmtAndList "exception" fmtExnSpec1 hLast


    (* sharingspec *)

    fun fmtSharingSpec hLast (isTy, (x1, (x2, xs))) : v =
      let
        val h = H.seq [H.str "sharing", sp1]
        val h0 = if isTy then H.seq [h, H.str "type", sp1] else h

        fun fmtRest hLast lid = H.seq [sp1, H.str "=", sp1, fmtLid lid, hLast]
        val h1 = fmtLid x1
        val hs = fmtSeq (H.empty, hLast) fmtRest (x2 :: xs)

        val n = 2
      in
        if length hs + 1 <= n
        then V.line (H.seq (h0 :: h1 :: hs))
        else V.concat (H.seq [h0, h1] :: hs)
      end


    (* qual *)

    fun fmtQual1 kw hLast eq : v =	
      toV (
        join (sp1, indent) (H (H.str kw), fmtXEqTy "type" fmtTyLName hLast eq)
      )

    val fmtQual : h -> qual -> v = fmtAndList "where" fmtQual1


    (* spec *)

    fun fmtInclListSpec hLast (id, ids) : v =
      V.line (
        H.seq [H.str "include", sp1, H.seqWith sp1 fmtId (id :: ids), hLast]
      )

    fun fmtInclSpec hLast qsig : v =
      toV (join (sp1, indent) (H (H.str "include"), fmtQSig hLast qsig))

    and fmtSpec hLast : spec -> v =
      fn
        SpecVal valSpec                => fmtValSpec hLast valSpec
      | SpecType tySpec                => fmtTySpec hLast tySpec
      | SpecDatatype datatypeSpec      => fmtDatatypeSpec hLast datatypeSpec
      | SpecDatatypeEq eqDatatypeSpec  => fmtEqDatatypeSpec hLast eqDatatypeSpec
      | SpecExn exnSpec                => fmtExnSpec hLast exnSpec
      | SpecStruct structSpec          => fmtStructSpec hLast structSpec
      | SpecSharing sharingSpec        => fmtSharingSpec hLast sharingSpec
      | SpecInclList ids1              => fmtInclListSpec hLast ids1
      | SpecIncl qsig                  => fmtInclSpec hLast qsig


    (* structspec *)

    and fmtStructSpec1 kw hLast (id, qsig) : v =
      toV (
        join (sp1, indent) (
          H (H.seq [H.str kw, sp1, H.str id, sp1, H.str ":"]),
          fmtQSig hLast qsig
        )
      )

    and fmtStructSpec hLast : structspec -> v =
      fmtAndList "structure" fmtStructSpec1 hLast


    (* specs *)

    and fmtSpecs specs : v =
      let
        fun fmt (spec, semi) =
          fmtSpec (if semi then H.str ";" else H.empty) spec
      in
        V.seq (map fmt specs)
      end


    (* sig1 *)

    and fmtSig1 hLast : sig1 -> t =
      fn
        SigSpec specs =>
          V (
            V.seq [
              V.str "sig",
              indent (fmtSpecs specs),
              V.line (H.seq [H.str "end", hLast])
            ]
          )
      | SigName id    => H (H.seq [fmtId id, hLast])


    (* qsig
     *
     * Note that `fmtQSig` can return horizontal text only when `quals` is `[]`.
     *)

    and fmtQSig hLast (sig1, quals) : t =
      let
        val t = fmtSig1 (case quals of [] => hLast | _ => H.empty) sig1
      in
        case fmtSeq (H.empty, hLast) fmtQual quals of
          [] => t
        | vs => V (vJoin indent (toV t, V.seq vs))
      end


    (* strdec *)

    fun fmtStrDec hLast : strdec -> v =
      fn
        StrDecDec dec           => fmtDec hLast dec
      | StrDecLocal strDecsPair => fmtLocalStrDec hLast strDecsPair
      | StrDecStruct structDec  => fmtStructDec hLast structDec

    and fmtLocalStrDec hLast (strDecs1, strDecs2) =
      V.seq [
        V.line (H.str "local"),
        indent (fmtStrDecs strDecs1),
        V.line (H.str "in"),
        indent (fmtStrDecs strDecs2),
        V.line (H.seq [H.str "end", hLast])
      ]


    (* strdecs *)

    and fmtStrDecs strDecs : v =
      let
        fun fmt (strDec, semi) =
          fmtStrDec (if semi then H.str ";" else H.empty) strDec
      in
        V.seq (map fmt strDecs)
      end


    (* struct1 *)

    and fmtStruct1 hLast : struct1 -> t =
      fn
        StructBody strDecs      =>
          V (
            V.seq [
              V.str "struct",
              indent (fmtStrDecs strDecs),
              V.line (H.seq [H.str "end", hLast])
            ]
          )
      | StructInst (id, funArg) => (
          case fmtFunArg funArg of
            H h => H (H.seq [fmtId id, H.str "(", h, H.str ")", hLast])
          | V v => V (
              V.seq [
                V.line (H.seq [fmtId id, H.str "("]),
                indent v,
                V.line (H.seq [H.str ")", hLast])
              ]
            )
        )
      | StructName lid          => H (fmtHLast fmtLid hLast lid)


    (* funarg *)

    and fmtFunArg funArg : t =
      case funArg of
        FunArgStrDec strDecs => V (fmtStrDecs strDecs)
      | FunArgStruct struct1 => fmtStruct1 H.empty struct1


    (* structdec, c.f. functdec *)

    and fmtStructDec1 kw hLast (id, optQSig, struct1) : v =
      let
        val hEq = H.seq [sp1, H.str "="]
        fun fmtHead hLast = H (H.seq [H.str kw, sp1, H.str id, hLast])
      in
        toV (
          join (sp1, indent) (
            case optQSig of
              NONE                  => fmtHead hEq
            | SOME (isOpaque, qsig) =>
                join (sp1, indent) (
                  fmtHead (H.seq [sp1, H.str (if isOpaque then ":>" else ":")]),
                  fmtQSig hEq qsig
                ),
            fmtStruct1 hLast struct1
          )
        )
      end

    and fmtStructDec hLast : structdec -> v =
      fmtAndList "structure" fmtStructDec1 hLast


    (* sigdec *)

    fun fmtSigDec1 kw hLast (id, qsig) : v =
      let
        val h1 = H.seq [H.str kw, sp1, fmtId id, sp1, H.str "="]
      in
        toV (join (sp1, indent) (H h1, fmtQSig hLast qsig))
      end

    val fmtSigDec : h -> sigdec -> v = fmtAndList "signature" fmtSigDec1


    (* functparam *)

    val fmtFunctParam : functparam -> t =
      fn
        FunctParamSig (id, qsig) =>
          join (sp1, indent) (
            H (H.seq [H.str id, sp1, H.str ":"]),
            fmtQSig H.empty qsig
          )
      | FunctParamSpec specs     => V (fmtSpecs specs)


    (* functdec, c.f. structdec *)

    fun fmtFunctDec1 kw hLast (id, functParam, optQSig, struct1) : v =
      let
        val hEq = H.seq [sp1, H.str "="]
        fun fmtHead hLast =
          join (H.empty, I) (
            join (H.empty, indent) (
              H (H.seq [H.str kw, sp1, H.str id, sp1, H.str "("]),
              fmtFunctParam functParam
            ),
            H (H.seq [H.str ")", hLast])
          )
      in
        toV (
          join (sp1, indent) (
            case optQSig of
              NONE                  => fmtHead hEq
            | SOME (isOpaque, qsig) =>
                join (sp1, indent) (
                  fmtHead (H.seq [sp1, H.str (if isOpaque then ":>" else ":")]),
                  fmtQSig hEq qsig
                ),
            fmtStruct1 hLast struct1
          )
        )
      end

    val fmtFunctDec : h -> functdec -> v = fmtAndList "functor" fmtFunctDec1


    (* module *)

    fun fmtModule hLast : module -> v =
      fn
        ModuleDecStr strDec     => fmtStrDec hLast strDec
      | ModuleDecSig sigDec     => fmtSigDec hLast sigDec
      | ModuleDecFunct functDec => fmtFunctDec hLast functDec


    (* topleveldec *)

    val fmtTopLevelDec : topleveldec -> v =
      let
        fun fmt fmtX (x, semi) =
          fmtX (if semi then H.str ";" else H.empty) x
      in
        fn
          TopLevelDecExp exp           => toV (fmtExp (H.str ";") exp)
        | TopLevelDecDec decSemi       => fmt fmtDec decSemi
        | TopLevelDecModule moduleSemi => fmt fmtModule moduleSemi
      end


    (* program *)

    val fmtProgram : program -> v = V.seq o map fmtTopLevelDec

  end
