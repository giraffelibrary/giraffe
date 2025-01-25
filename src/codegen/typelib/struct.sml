(* --------------------------------------------------------------------------
 * Struct
 * -------------------------------------------------------------------------- *)

(* Record signature *)

local
in
  fun makeStructRecordSig
    (repo            : 'a RepositoryClass.class)
    (vers            : Repository.typelibvers_t)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.class)
    : id * program * interfaceref list * interfaceref list =
    let
      val () = checkDeprecated structInfo
      val () = checkNonClassStruct structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val structType = getStructType repo vers structInfo

      val tTy = mkIdTy tId

      val specs'0 = []
      val specs'1 =
        addAccessorSpecs
          structInfo
          tTy
          true
          specs'0

      val recordSigId =
        toUCU (
          case structType of
            ValueRecord _ => valueStrId ^ recordStrId
          | _             => recordStrId
        )

      val specs'2 =
        case structType of
          UnionRecord (parentUnionNamespace, parentUnionName, fieldName) =>
            let
              val fieldNameTypeId = toLCU fieldName

              val parentUnionScope =
                if parentUnionNamespace <> structNamespace
                then GLOBAL
                else LOCALINTERFACEOTHER
              val parentUnionTy = UNION

              val parentUnionIRef = {
                namespace = parentUnionNamespace,
                name      = parentUnionName,
                scope     = parentUnionScope,
                ty        = parentUnionTy,
                container = NONE
              }

              (*
               *     type <field_name>
               *                                           -.
               *     type 'a <parent_union_name>_union      | StructNamespace
               *     include RECORD                         |  = ParentUnionNamespace
               *       where type t = <field_name> <parent_union_name>_union
               *                                           -'
               *                                           -.
               *     include RECORD                         | StructNamespace
               *       where                                |  <> ParentUnionNamespace
               *         type t =                           |
               *           <field_name> <ParentUnionNamespace><ParentUnionName>.union
               *                                           -'
               *)
              val parentUnionTypeLId = makeInterfaceRefTyLongId parentUnionIRef
              val recordInclSpec =
                SpecIncl (
                  SigName recordSigId,
                  [
                    toList1 [
                      (
                        tTyLName,
                        TyRef (
                          [TyRef ([], toList1 [fieldNameTypeId])],
                          parentUnionTypeLId
                        )
                      )
                    ]
                  ]
                )

              (* parentUnionTypeLId is (_, [])
               *  <=> parentUnionNamespace = structNamespace *)
              val specs'2 =
                case parentUnionTypeLId of
                  (id, []) => mkTypeSpec (([aTyVar], id), NONE) :: recordInclSpec :: specs'1
                | _        => recordInclSpec :: specs'1
              val specs'3 = mkTypeSpec (([], fieldNameTypeId), NONE) :: specs'2
            in
              specs'3
            end
        | _                                                              =>
            let
              val recordInclSpec = SpecIncl (SigName recordSigId, [])
              val specs'2 = recordInclSpec :: specs'1
            in
              specs'2
            end

      val sig1 = mkSigSpec specs'2
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(structRecordSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigIRefs = []
      val extIRefs = []
    in
      (mkSigFile structRecordSigId, Portable program, sigIRefs, extIRefs)
    end
end


(* Record structure *)

local
  (*
   *     structure Pointer = CPointer(GMemory)
   *     type opt = Pointer.opt
   *     type non_opt = Pointer.non_opt
   *     type 'a p = 'a Pointer.p
   *)
  fun addPointerStrDecs strDecs =
    mkStructStrDec (pointerStrId, mkInstStruct (cPointerStrId, mkNameStruct [gMemoryStrId]))
     :: StrDecDec (mkTypeDec (optTyName, prefixOptTy [pointerStrId]))
     :: StrDecDec (mkTypeDec (nonOptTyName, prefixNonOptTy [pointerStrId]))
     :: StrDecDec (mkTypeDec (ptrTyName aTyVar, prefixPtrTy [pointerStrId] aVarTy))
     :: strDecs

  val cPtrTy = makeLowLevelTy false [] (PTR {optDir = NONE, isOpt = false})
  val gsizeTy = makeLowLevelTy false ["GSize", ffiStrId] VAL

  (* `callStrDecLowLevelMLton (name, symbol, attrIds, parTys, retTy)` constructs
   * a MLton low-level function call expression as follows:
   *
   *     val <name> =
   *       fn x1 & ... & x<N> =>
   *         (_import "<symbol>" <attrs> : <parTys[1]> * ... * <parTys[N]> -> <retTy>;)
   *         (x1, ..., x<N>)
   *
   *       if N > 1
   *
   *     val <name> =
   *       _import "<symbol>" <attrs> : <parTys[1]> -> <retTy>;
   *
   *       if N = 1
   *
   *     val <name> =
   *       _import "<symbol>" <attrs> : unit -> <retTy>;
   *
   *       if N = 0
   *
   *   where
   *
   *     N = length parTys
   *
   *
   *     A = length attrIds
   *
   *
   *     attrs = <attrIds[1]> ... <attrIds[A]>
   *)
  fun callStrDecLowLevelMLton (name, symbol, attrIds, parTys, retTy) =
    StrDecDec (
      mkIdValDec (name, callMLtonFFIExp (symbol, attrIds) (parTys, retTy))
    )

  (*
   *     val memcpy_ =
   *       fn x1 & x2 & x3 =>
   *         (_import "memcpy"
   *           : non_opt p * non_opt p * GSize.FFI.val_ -> unit;)
   *         (x1, x2, x3)
   *)
  val memcpyStrDecMLton =
    callStrDecLowLevelMLton (memcpyUId, memcpyId, [], [cPtrTy, cPtrTy, gsizeTy], unitTy)

  (*
   *     val copy_ =
   *       fn src & dest =>
   *         memcpy_ (dest & src & size_ ())
   *)
  val defaultCopyStrDec =
    let
      val srcId = "src"
      val destId = "dest"
      val pat = mkAPat (mkIdVarPat srcId, mkIdVarPat destId)
      val sizeExp = ExpApp (mkIdLNameExp sizeUId, ExpConst ConstUnit)
      val exp =
        ExpApp (
          mkIdLNameExp memcpyUId,
          mkParenExp (
            foldl mkAExp sizeExp (map mkIdLNameExp [srcId, destId])
          )
        )
    in
      StrDecDec (mkIdValDec (copyUId, ExpFn (toList1 [(pat, exp)])))
    end

  (*
   *     val clear_ = Fn.ignore
   *)
  val defaultClearStrDec =
    StrDecDec (mkIdValDec (clearUId, mkLIdLNameExp [fnStrId, ignoreId]))

  (*
   * `<funExp>` is declared outside the function to ensure that it can be
   * evaluated at compile time.  This is needed for Poly/ML where `<funExp>`
   * may evaluate `PolyMLFFI.externalFunctionSymbol`, which must be evauated
   * at compile time.
   *
   *     let
   *       val boxedFun_ = <funExp>
   *     in
   *       fn x1 => boxedFun_ (getType_ () & x1)
   *     end
   *)
  fun callBoxedFunExp funExp =
    let
      val boxedFunUId : id = "boxedFun_"
      val boxedFunDec = mkIdValDec (boxedFunUId, funExp)
      val boxedFunExp = mkIdLNameExp boxedFunUId
      val xId = "x1"
      val xPat = mkIdVarPat xId
      val xExp = mkIdLNameExp xId
      val getTypeExp = ExpApp (mkIdLNameExp getTypeUId, unitExp)
      val exp =
        ExpApp (
          boxedFunExp,
          mkParenExp (mkAExp (getTypeExp, xExp))
        )
      val fnExp = ExpFn (toList1 [(xPat, exp)])
    in
      ExpLet (mkDecs [boxedFunDec], toList1 [fnExp])
    end

  fun boxedTypeForNonRegisteredType (structNamespace, structName) =
    concat [
      "record ",
      structNamespace, ".", structName,
      " is not a registered type but is configured as a boxed type"
    ]

  fun boxedTypeForInternalType (structNamespace, structName) =
    concat [
      "record ",
      structNamespace, ".", structName,
      " is an internal type but is configured as a boxed type"
    ]

  fun addStrDecsLowLevelMLton
    structInfo
    structNamespace
    structName
    structType
    optGetTypeSymbol
    strDecs
  =
    let
      fun nonRegisteredType () = boxedTypeForNonRegisteredType (structNamespace, structName)
      fun internalType () = boxedTypeForInternalType (structNamespace, structName)

      val strDecs'1 =
        case structType of
          ValueRecord funcs =>
            let
              val pat = mkConstPat ConstUnit
              val exp = mkIntConstExp (StructInfo.getSize structInfo)
              val sizeExp = ExpFn (toList1 [(pat, exp)])
            in
              (*
               *     val size_ = fn () => <structSize>
               *)
              StrDecDec (mkIdValDec (sizeUId, sizeExp)) :: (
                case funcs of
                  Deep {copy, clear} =>
                    (*
                     *     val copy_ =
                     *       fn x1 & x2 =>
                     *         (_import "<copy>" : non_opt p * non_opt p -> unit;)
                     *         (x1, x2)
                     *
                     *     val clear_ =
                     *       _import "<clear>" : non_opt p -> unit;
                     *) 
                    callStrDecLowLevelMLton (copyUId,  copy,  [], [cPtrTy, cPtrTy], unitTy) ::
                    callStrDecLowLevelMLton (clearUId, clear, [], [cPtrTy],         unitTy) ::
                    strDecs
                | Flat               =>
                    (*
                     *     val memcpy_ =
                     *       fn x1 & x2 & x3 =>
                     *         (_import "memcpy"
                     *           : non_opt p * non_opt p * GSize.FFI.val_ -> unit;)
                     *         (x1, x2, x3)
                     *
                     *     val copy_ =
                     *       fn src & dest =>
                     *         memcpy_ (dest & src & size_ ())
                     *
                     *     val clear_ = Fn.ignore
                     *) 
                    memcpyStrDecMLton ::
                    defaultCopyStrDec ::
                    defaultClearStrDec ::
                    strDecs
              )
            end
        | Record funcs      => (
            case (funcs, optGetTypeSymbol) of
              (Boxed, NONE)               => raise Fail (nonRegisteredType ())
            | (Boxed, SOME "intern")      => raise Fail (internalType ())
            | (Boxed, SOME _)             =>
                (*
                 *     val dup_ =
                 *       let
                 *         val boxedFun_ =
                 *           fn x1 & x2 =>
                 *             (_import "g_boxed_copy" :
                 *               GObjectType.FFI.val_ * non_opt p -> non_opt p;)
                 *               (x1, x2)
                 *       in
                 *         fn x1 => boxedFun_ (getType_ () & x1)
                 *       end
                 *
                 *     val free_ =
                 *       let
                 *         val boxedFun_ =
                 *           fn x1 & x2 =>
                 *             (_import "g_boxed_free" reentrant :
                 *               GObjectType.FFI.val_ * non_opt p -> non_opt p;)
                 *               (x1, x2)
                 *       in
                 *         fn x1 => boxedFun_ (getType_ () & x1)
                 *       end
                 *)
                let
                  val typeIRef = makeTypeIRef structNamespace NONE
                  val typeTy = mkLIdTy (prefixInterfaceStrId typeIRef [ffiStrId, valId])

                  val callBoxedCopyExp =
                    callBoxedFunExp (
                      callMLtonFFIExp
                        (boxedCopySymbol, [])
                        ([typeTy, cPtrTy], cPtrTy)
                    )

                  val callBoxedFreeExp =
                    callBoxedFunExp (
                      callMLtonFFIExp
                        (boxedFreeSymbol, ["reentrant"])
                        ([typeTy, cPtrTy], unitTy)
                    )
                in
                  StrDecDec (mkIdValDec (dupUId, callBoxedCopyExp)) ::
                  StrDecDec (mkIdValDec (freeUId, callBoxedFreeExp)) ::
                  strDecs
                end
            | (NonBoxed {dup, free}, _)   =>
                (* 
                 *     val dup_ = _import "<dup>" : non_opt p -> non_opt p;
                 * 
                 *     val free_ = _import "<free>" : non_opt p -> unit;
                 *)
                callStrDecLowLevelMLton (dupUId,  dup,  [], [cPtrTy], cPtrTy) ::
                callStrDecLowLevelMLton (freeUId, free, [], [cPtrTy], unitTy) ::
                strDecs
          )
        | DisguisedRecord   => strDecs
        | UnionRecord _     => strDecs
    in
      strDecs'1
    end

  (* `callStrDecLowLevelPolyML (name, symbol, parConvs, retConv)`
   * constructs a Poly/ML low-level function call expression as follows:
   *
   *     val <name> =
   *       call
   *         (getSymbol "<symbol>")
   *         (<parConvs[1]> &&> ... &&> <parConvs[N]> --> <retConv>)
   *
   *       if N > 0
   *
   *     val <name> =
   *       call
   *         (getSymbol "<symbol>")
   *         (cVoidConv --> <retConv>)
   *
   *       if N = 0
   *
   *   where
   *
   *     N = length parConvs
   *)
  fun callStrDecLowLevelPolyML (name, symbol, parConvs, retConv) =
    let
      val parConv =
        case rev parConvs of
          []      => cVoidConv
        | c :: cs => foldl mkAARExp c cs
    in
      StrDecDec (
        mkIdValDec (name, callPolyMLFFIExp symbol (parConv, retConv))
      )
    end

  val cPtrLowLevelSpec = PTR {optDir = NONE, isOpt = false}

  (*
   *     val cPtr = Pointer.PolyML.cVal
   *)
  val cPtrStrDec =
    StrDecDec (
      mkIdValDec (
        makeConvId cPtrLowLevelSpec,
        makeConv [pointerStrId, polyMLStrId] VAL
      )
    )

  val cPtrConv = makeConv [] cPtrLowLevelSpec
  val gsizeConv = makeConv ["GSize", polyMLStrId] VAL

  (*
   *     val memcpy_ =
   *       call
   *         (getSymbol "memcpy")
   *         (cPtr &&> cPtr &&> GSize.FFI.cVal --> cVoid)
   *)
  val memcpyStrDecPolyML =
    callStrDecLowLevelPolyML (memcpyUId, memcpyId, [cPtrConv, cPtrConv, gsizeConv], cVoidConv)

  fun addStrDecsLowLevelPolyML
    structInfo
    structNamespace
    structName
    structType
    optGetTypeSymbol
    strDecs
  =
    let
      fun nonRegisteredType () = boxedTypeForNonRegisteredType (structNamespace, structName)
      fun internalType () = boxedTypeForInternalType (structNamespace, structName)

      val localStrDecs'1 =
        case structType of
          ValueRecord funcs =>
            let
              val pat = mkConstPat ConstUnit
              val exp = mkIntConstExp (StructInfo.getSize structInfo)
              val sizeExp = ExpFn (toList1 [(pat, exp)])
            in
              (*
               *     val size_ = fn () => <structSize>
               *)
              StrDecDec (mkIdValDec (sizeUId, sizeExp)) :: (
                case funcs of
                  Deep {copy, clear} =>
                    (*
                     *     val copy_ =
                     *       call
                     *         (getSymbol "<copy>")
                     *         (cPtr &&> cPtr --> cVoid)
                     *
                     *     val clear_ =
                     *       call
                     *         (getSymbol "<clear>")
                     *         (cPtr --> cVoid)
                     *) 
                    callStrDecLowLevelPolyML (copyUId,  copy,  [cPtrConv, cPtrConv], cVoidConv) ::
                    callStrDecLowLevelPolyML (clearUId, clear, [cPtrConv],           cVoidConv) ::
                    []
                | Flat               =>
                    (*
                     *     val memcpy_ =
                     *       call
                     *         (getSymbol "memcpy")
                     *         (cPtr &&> cPtr &&> GSize.FFI.cVal --> cVoid)
                     *
                     *     val copy_ =
                     *       fn src & dest =>
                     *         memcpy_ (dest & src & size_ ())
                     *
                     *     val clear_ = Fn.ignore
                     *) 
                    memcpyStrDecPolyML ::
                    defaultCopyStrDec ::
                    defaultClearStrDec ::
                    []
              )
            end
        | Record funcs      => (
            case (funcs, optGetTypeSymbol) of
              (Boxed, NONE)               => raise Fail (nonRegisteredType ())
            | (Boxed, SOME "intern")      => raise Fail (internalType ())
            | (Boxed, SOME _)             =>
                (*
                 *     val dup_ =
                 *       let
                 *         val boxedFun_ =
                 *           call
                 *             (getSymbol "g_boxed_copy")
                 *             (GObjectType.PolyML.cVal &&> cPtr --> cPtr)
                 *       in
                 *         fn x1 => boxedFun_ (getType_ () & x1)
                 *       end
                 *
                 *     val free_ =
                 *       let
                 *         val boxedFun_ =
                 *           call
                 *             (getSymbol "g_boxed_free")
                 *             (GObjectType.PolyML.cVal &&> cPtr --> cVoid)
                 *       in
                 *         fn x1 => boxedFun_ (getType_ () & x1)
                 *       end
                 *)
                let
                  val typeIRef = makeTypeIRef structNamespace NONE
                  val typeConv = makeConv (prefixInterfaceStrId typeIRef [polyMLStrId]) VAL

                  val callBoxedCopyExp =
                    callBoxedFunExp (
                      callPolyMLFFIExp
                        boxedCopySymbol
                        (mkAARExp (typeConv, cPtrConv), cPtrConv)
                    )

                  val callBoxedFreeExp =
                    callBoxedFunExp (
                      callPolyMLFFIExp
                        boxedFreeSymbol
                        (mkAARExp (typeConv, cPtrConv), cVoidConv)
                    )
                in
                  [
                    StrDecDec (mkIdValDec (dupUId, callBoxedCopyExp)),
                    StrDecDec (mkIdValDec (freeUId, callBoxedFreeExp))
                  ]
                end
            | (NonBoxed {dup, free}, _)   =>
                (*
                 *     val dup_ =
                 *       call
                 *         (getSymbol "<dup>")
                 *         (cPtr --> cPtr)
                 *
                 *     val free_ =
                 *       call
                 *         (getSymbol "<free>")
                 *         (cPtr --> cVoid)
                 *)
                [
                  callStrDecLowLevelPolyML (dupUId,  dup,  [cPtrConv], cPtrConv),
                  callStrDecLowLevelPolyML (freeUId, free, [cPtrConv], cVoidConv)
                ]
          )
        | DisguisedRecord   => []
        | UnionRecord _     => []

      val strDecs'1 =
        case localStrDecs'1 of
          [] => strDecs
        | _  => mkPolyMLFFILocalStrDec localStrDecs'1 :: strDecs
    in
      strDecs'1
    end

  fun addStrDecsLowLevel isPolyML =
    if isPolyML
    then addStrDecsLowLevelPolyML
    else addStrDecsLowLevelMLton

  (*
   *     structure Record =
   *       BoxedValueRecord(
   *         structure Pointer = Pointer
   *         type opt = opt
   *         type non_opt = non_opt
   *         type 'a p = 'a p
   *         val copy_ = copy_
   *         val clear_ = clear_
   *         val size_ = size_
   *         val getTypeName = <getTypeNameExp>
   *       )
   *)
  fun structValueRecordStrDec getTypeNameExp =
    mkStructStrDec (
      recordStrId,
      StructInst (
        "BoxedValueRecord",
        mkStrDecsFunArg [
          mkStructStrDec (pointerStrId, mkNameStruct [pointerStrId]),
          StrDecDec (mkTypeDec (optTyName, optTy)),
          StrDecDec (mkTypeDec (nonOptTyName, nonOptTy)),
          StrDecDec (mkTypeDec (ptrTyName aTyVar, ptrTy aVarTy)),
          StrDecDec (mkIdValDec (copyUId, mkIdLNameExp copyUId)),
          StrDecDec (mkIdValDec (clearUId, mkIdLNameExp clearUId)),
          StrDecDec (mkIdValDec (sizeUId, mkIdLNameExp sizeUId)),
          StrDecDec (mkIdValDec (getTypeNameId, getTypeNameExp))
        ]
      )
    )

  (*
   *     structure Record =
   *       BoxedRecord(
   *         structure Pointer = Pointer
   *         type opt = opt
   *         type non_opt = non_opt
   *         type 'a p = 'a p
   *         val dup_ = dup_
   *         val take_ = ignore
   *         val free_ = free_
   *         val getTypeName = <getTypeNameExp>
   *       )
   *)
  fun structRecordStrDec getTypeNameExp =
    mkStructStrDec (
      recordStrId,
      StructInst (
        "BoxedRecord",
        mkStrDecsFunArg [
          mkStructStrDec (pointerStrId, mkNameStruct [pointerStrId]),
          StrDecDec (mkTypeDec (optTyName, optTy)),
          StrDecDec (mkTypeDec (nonOptTyName, nonOptTy)),
          StrDecDec (mkTypeDec (ptrTyName aTyVar, ptrTy aVarTy)),
          StrDecDec (mkIdValDec (dupUId, mkIdLNameExp dupUId)),
          StrDecDec (mkIdValDec (takeUId, mkIdLNameExp ignoreId)),
          StrDecDec (mkIdValDec (freeUId, mkIdLNameExp freeUId)),
          StrDecDec (mkIdValDec (getTypeNameId, getTypeNameExp))
        ]
      )
    )

  (*
   *     structure Record =
   *       PointerRecord(
   *         val name = "<StructNamespace>.<StructName>"
   *       )
   *)
  fun structDisguisedRecordStrDec (structNamespaceStrId, structNameStrId) =
    let
      val s = String.concat [structNamespaceStrId, ".", structNameStrId]
    in
      mkStructStrDec (
        recordStrId,
        StructInst (
          "PointerRecord",
          mkStrDecsFunArg [
            StrDecDec (mkIdValDec ("name", ExpConst (ConstString s))
            )
          ]
        )
      )
    end    

  (*
   *     structure Record = <ParentUnionNamespace><ParentUnionName>
   *)
  fun structUnionRecordStrDec (parentUnionNamespace, parentUnionName, _) =
    let
      val id = String.concat [parentUnionNamespace, parentUnionName]
    in
      mkStructStrDec (
        recordStrId,
        StructName (toList1 [id])
      )
    end

  (*
   *     open Record
   *)
  val openRecordStrDec =
    StrDecDec (DecOpen (toList1 [toList1 [recordStrId]]))
in
  fun makeStructRecordStr
    (repo            : 'a RepositoryClass.class)
    (vers            : Repository.typelibvers_t)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.class)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated structInfo
      val () = checkNonClassStruct structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val structRecordStrNameId = mkRecordStrNameId structName

      val structType = getStructType repo vers structInfo

      (* module *)
      val strDecs'0 = []
      val iRefs'0 = []

      val (iRefs'1, revParentUnionLocalTypes, parentUnionQuals, parentUnionStrDecs) =
        case structType of
          UnionRecord (parentUnionNamespace, parentUnionName, fieldName) =>
            let
              val fieldNameTypeId = toLCU fieldName
              val fieldNameTy = mkIdTy fieldNameTypeId

              val parentUnionScope =
                if parentUnionNamespace <> structNamespace
                then GLOBAL
                else LOCALINTERFACEOTHER
              val parentUnionTy = UNION

              val parentUnionIRef = {
                namespace = parentUnionNamespace,
                name      = parentUnionName,
                scope     = parentUnionScope,
                ty        = parentUnionTy,
                container = NONE
              }

              val iRefs'1 = parentUnionIRef :: iRefs'0

              val isParentNamespace = parentUnionScope <> GLOBAL

              (*
               *                                           -.
               *     where                                  | isParentNamespace
               *       type 'a <parent_union_name>_union =  |
               *         'a <ParentUnionNamespace><ParentUnionName>.union
               *                                           -'
               *)
              val revParentUnionLocalTypes =
                if isParentNamespace
                then [makeIRefLocalType parentUnionIRef]
                else []

              (* <ParentUnionNamespace><ParentUnionName> *)
              val parentUnionStrId = makeIRefInterfaceOtherStrId parentUnionIRef

              (*
               *     type <field_name> = unit                                                                                     |
               *     type t = <field_name> <ParentUnionNamespace><ParentUnionName>.union                                          |
               *)
              val parentUnionLId =
                toList1 (
                  if isParentNamespace
                  then [parentUnionStrId, unionId]
                  else prefixInterfaceStrId parentUnionIRef [unionId]
                )
              val parentUnionStrDecs =
                [
                  StrDecDec (mkTypeDec (([], fieldNameTypeId), unitTy)),
                  StrDecDec (mkTypeDec (tTyName, TyRef ([fieldNameTy], parentUnionLId)))
                ]

              (*
               *     where type C.opt =
               *       <ParentUnionNamespace><ParentUnionName>.C.opt
               *     where type C.non_opt =
               *       <ParentUnionNamespace><ParentUnionName>.C.non_opt
               *     where type 'a C.p =
               *       'a <ParentUnionNamespace><ParentUnionName>.C.p
               *)
              val cOptQual =
                toList1 [
                  (([], cOptLId), TyRef ([], cons1 (parentUnionStrId, cOptLId)))
                ]
              val cNonOptQual =
                toList1 [
                  (([], cNonOptLId), TyRef ([], cons1 (parentUnionStrId, cNonOptLId)))
                ]
              val cPtrQual =
                toList1 [
                  (
                    ([aTyVar], cPtrLId),
                    TyRef ([aVarTy], cons1 (parentUnionStrId, cPtrLId))
                  )
                ]

              val parentUnionQuals : qual list = [cOptQual, cNonOptQual, cPtrQual]
            in
              (
                iRefs'1,
                revParentUnionLocalTypes,
                parentUnionQuals,
                parentUnionStrDecs
              )
            end
        | _                                                              =>
            (iRefs'0, [], [], [])

      val getValueType =
        fn
          ("GLib", "Variant") => "variant"
        | _                   => "boxed"

      val (addGetTypeStrDecs, addAccessorStrDecs, addAccessorIRefs, revAccessorLocalTypes) =
        addAccessorRootStrDecs (structNamespace, structName) getValueType structInfo

      val iRefs'2 = addAccessorIRefs iRefs'1

(*
      val strDecs'1 = structTypeStrDec :: openTypeStrDec :: strDecs'0
*)

      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

      (* `getTypeName ()` is
       *                                       -.
       *       GObjectType.name o getType       | optGetTypeSymbol is SOME _
       *                                       -'
       *                                       -.
       *       fn () => "<StructCType>"         | optGetTypeSymbol is NONE
       *                                       -' optStructCType is SOME StructCType
       *                                       -.
       *       <raise Fail>                     | optGetTypeSymbol is NONE
       *                                       -' optStructCType is NONE
       *)
      fun getTypeName () =
        case optGetTypeSymbol of
          SOME _ =>
            ExpInfixApp (
              mkLIdLNameExp ["GObjectType", "name"],
              oId,
              mkIdLNameExp getTypeId
            )
        | NONE   =>
            let
              val typeName = concat [structNamespace, ".", structName]
            in
              ExpFn (
                toList1 [(mkConstPat ConstUnit, ExpConst (ConstString typeName))]
              )
            end

      fun mkModule isPolyML =
        let
          val strDecs'1 = addAccessorStrDecs true isPolyML strDecs'0
          val strDecs'2 = (
            case structType of
              ValueRecord _   => structValueRecordStrDec (getTypeName ())
            | Record _        => structRecordStrDec (getTypeName ())
            | DisguisedRecord =>
                structDisguisedRecordStrDec (structNamespace, structName)
            | UnionRecord x   => structUnionRecordStrDec x
          ) :: openRecordStrDec :: strDecs'1

          val strDecs'3 =
            addStrDecsLowLevel isPolyML
              structInfo
              structNamespace
              structName
              structType
              optGetTypeSymbol
              strDecs'2

          val strDecs'4 = addGetTypeStrDecs isPolyML strDecs'3
          val strDecs'5 =
            case structType of
              DisguisedRecord => strDecs'4
            | UnionRecord _   => parentUnionStrDecs @ strDecs'4
            | _               =>
                addPointerStrDecs
                  (
                    if isPolyML
                    then cPtrStrDec :: strDecs'4
                    else strDecs'4
                  )

          val strDecs'6 =
            revMapAppend makeLocalTypeStrDec (revParentUnionLocalTypes, strDecs'5)

          val struct1 = mkBodyStruct strDecs'6
          (* sig *)
          val sig1 = SigName structRecordSigId
          val sigQual'1 : qual list = parentUnionQuals
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual
              (revAccessorLocalTypes, sigQual'1)
          val sigQual'3 =
            revMapAppend makeLocalTypeStrModuleQual
              (revParentUnionLocalTypes, sigQual'2)
          val qSig : qsig = (sig1, sigQual'3)

          (* strdec *)
          val structDec = toList1 [(structRecordStrId, SOME (true, qSig), struct1)]
          val strDec = StrDecStruct structDec
        in
          [ModuleDecStr strDec]
        end

      val programMLton = mkModule false
      val programPolyML = mkModule true

      (* namespace spec *)
      val structRecordSpec =
        let
          (* sig *)
          val sig1 = SigName structRecordSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revParentUnionLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(structRecordStrNameId, qSig)])
        end
      val structRecordSpecs = [structRecordSpec]

      (* namespace strdec *)
      val structRecordStrDec =
        StrDecStruct (
          toList1 [
            (
              structRecordStrNameId,
              NONE,
              StructName (toList1 [structRecordStrId])
            )
          ]
        )
      val structRecordStrDecs = [structRecordStrDec]
    in
      (
        mkStrFile structRecordStrId,
        (structRecordSpecs, structRecordStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        iRefs'2
      )
    end
end


(* Struct signature *)

fun isInfoNameNew info = getName info = "new"

fun existsStructMethodInfo info =
  existsInfo StructInfo.getNMethods StructInfo.getMethod info

fun addStructFieldSpecs structIRef (optFieldInfos, acc) =
  revFold (Option.fold (addFieldAccessorSpec structIRef)) (optFieldInfos, acc)

fun addNewFunctionSpec fieldInfos acc =
  let
    val newSpec =
      let
        val tyVarIdx = 0
        val (idTys, _) = foldmapl (mkFieldIdTy false) (fieldInfos, tyVarIdx)
        val tTy = mkIdTy tId
      in
        mkValSpec (newId, TyFun (TyRec idTys, tTy))
      end

    val (specs, (sigIRefs, extIRefs), excls) = acc
    val specs' = newSpec :: specs
  in
    (specs', (sigIRefs, extIRefs), excls)
  end

fun addStructNewFunctionSpec optFieldInfos structType structInfo =
  case structType of
    ValueRecord _ => (
      if existsStructMethodInfo isInfoNameNew structInfo
      then I
      else addNewFunctionSpec (map valOf optFieldInfos) handle Option => I
    )
  | _             => I

fun addStructMethodSpecs repo vers structIRef =
  revFoldMapInfosWithExcls
    optCons
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionSpec repo vers (SOME structIRef))

fun makeStructSig
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
  (optFieldInfos   : field_info option list)
  (excls'0         : info_excl_hier list)
  : id * program * interfaceref list * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD,
      container = NONE
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val structType = getStructType repo vers structInfo

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val addStructGetTypeFunctionSpec =
      case optGetTypeSymbol of
        SOME getTypeSymbol => addGetTypeFunctionSpec getTypeSymbol
      | NONE               => K I

    val acc'0
      : spec list
         * (interfaceref list * interfaceref list)
         * info_excl_hier list =
      ([], ([], []), excls'0)
    val acc'1 = addStructMethodSpecs repo vers structIRef (structInfo, acc'0)
    val acc'2 = addStructNewFunctionSpec optFieldInfos structType structInfo acc'1
    val acc'3 = addStructGetTypeFunctionSpec typeIRef acc'2
    val acc'4 = addStructFieldSpecs structIRef (optFieldInfos, acc'3)
    val (specs'1, (sigIRefs'1, extIRefs'1), excls'1) = acc'4

    val sigIRefs'2 =
      structIRef :: sigIRefs'1  (* `structIRef` for record structure dependence *)

    (*
     *     type t
     *
     *     type <varlist[1]> <local_name[1]>
     *
     *     ...
     *
     *     type <varlist[N]> <local_name[N]>
     *)
    val specs'2 = revMapAppend makeIRefLocalTypeSpec (rev sigIRefs'2, specs'1)

    val sig1 = mkSigSpec specs'2
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(structSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigIRefs = []
  in
    (mkSigFile structSigId, Portable program, sigIRefs, extIRefs'1, excls'1)
  end


(* Struct structure *)

(*
 *     fun new
 *       {
 *         <fieldId[1]>,
 *         ...
 *         <fieldId[F]>
 *       } =
 *       let
 *         fun init_ p =
 *           let
 *             val () = <FieldName[1]>Field.C.set <fieldId[1]> p
 *             ...
 *             val () = <FieldName[F]>Field.C.set <fieldId[F]> p
 *           in
 *             ()
 *           end
 *         val retVal & () =
 *           (
 *             <StructNamespace><StructName>Record.FFI.withNewPtr
 *              ---> <StructNamespace><StructName>Record.FFI.fromPtr true && I
 *           )
 *             init_
 *             ()
 *       in
 *         retVal
 *       end
 *)
fun newStrDecHighLevel structIRef (fieldInfos : field_info list) =
  let
    val fieldIdFPats = map (mkIdAsFPat o #id) fieldInfos
    val fieldIdsRecAPat = APatRec fieldIdFPats
    val initUId = initId ^ "_"
    val initUDec =
      let
        fun makeFieldSetDec {name, id, ...} =
          let
            val exp =
              foldL ExpApp (
                mkLIdLNameExp [toUCC name ^ fieldStrId, cStrId, setId],
                [mkIdLNameExp id, mkIdLNameExp ptrId]
              )
          in
            DecVal (toList1 [([], false, unitPat, exp)])
          end
        val fieldSetDecs = map makeFieldSetDec fieldInfos
        val exp = ExpLet (mkDecs fieldSetDecs, toList1 [unitExp])
      in
        mkIdFunDec (initUId, toList1 [mkIdVarAPat ptrId], exp)
      end

    val retValDec =
      let
        val prefixIds = prefixInterfaceStrId structIRef [ffiStrId]
        val ffiExp =
          mkParenExp (
            mkDDDRExp (
              withFunExp prefixIds {
                isRef = false,
                isDup = false,
                isNew = true,
                isOpt = false,
                isPtr = true,
                xfer  = XferNone
              },
              mkAAExp (
                fromFunExp prefixIds {
                  isOpt = false,
                  xfer  = XferFlag true
                },
                iExp
              )
            )
          )
        val exp = foldL ExpApp (ffiExp, [mkIdLNameExp initUId, unitExp])
      in
        DecVal (toList1 [([], false, mkAPat (retValIdPat, unitPat), exp)])
      end

    val funExp = ExpLet (mkDecs [initUDec, retValDec], toList1 [retValIdExp])
  in
    StrDecDec (mkIdFunDec (newId, toList1 [fieldIdsRecAPat], funExp))
  end

fun addStructFieldStructureStrDecs structIRef (optFieldInfos, acc) =
  let
    fun reportMissingOrCyclicFieldDependencies m =
      let
        val () = reportUnsortable m
      in
        raise Fail (
          concat [
            "fields of ",
            #namespace structIRef, ".", #name structIRef,
            " have missing or cyclic dependencies"
          ]
        )
      end

    fun addDeps (fieldInfo as {id, info, ...}) =
      (
        id,
        (
          fieldInfo,
          case info of
            IARRAY {lengths = (ArrayLengthParam (lenId, _), _), ...} => [lenId]
          | _                                                        => []
        )
      )
    fun removeDeps (_, (fieldInfo, _)) = fieldInfo

    val revSortedFieldInfos =
      revSortMap reportMissingOrCyclicFieldDependencies removeDeps
        (List.mapPartial (Option.map addDeps) optFieldInfos)
  in
    fold (addFieldStructureStrDec structIRef)
      (revSortedFieldInfos, acc)
  end

fun addStructFieldAccessorStrDecs (optFieldInfos, acc) =
  revFold (Option.fold addFieldAccessorStrDec) (optFieldInfos, acc)

fun addNewFunctionStrDecHighLevel structIRef fieldInfos
  (strDecs, (iRefs, structDeps), excls) =
  let
    val strDecs' = newStrDecHighLevel structIRef fieldInfos :: strDecs
  in
    (strDecs', (iRefs, structDeps), excls)
  end

fun addStructNewFunctionStrDecHighLevel
  optFieldInfos
  structType
  structIRef
  structInfo =
  case structType of
    ValueRecord _ => (
      if existsStructMethodInfo isInfoNameNew structInfo
      then I
      else
        addNewFunctionStrDecHighLevel structIRef (map valOf optFieldInfos)
          handle
            Option => I
    )
  | _             => I

fun addStructMethodStrDecsLowLevel
  isPolyML
  repo
  vers
  addInitStrDecs
  structIRef
  optFieldInfos =
  addFunctionStrDecsLowLevel
    (StructInfo.getNMethods, StructInfo.getMethod)
    isPolyML
    repo
    vers
    addInitStrDecs
    #2
    (SOME structIRef)
    optFieldInfos

fun addStructMethodStrDecsHighLevel repo vers (structInfo, structIRef) =
  revFoldMapInfosWithExcls
    optCons
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionStrDecHighLevel repo vers (SOME (structInfo, structIRef)))

fun makeStructStr
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
  (optFieldInfos   : field_info option list)
  (excls'0         : info_excl_hier list)
  : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD,
      container = NONE
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val structStrNameId = mkStrNameId structName

    val structType = getStructType repo vers structInfo

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val addStructGetTypeFunctionStrDecLowLevel =
      case optGetTypeSymbol of
        SOME getTypeSymbol => addGetTypeFunctionStrDecLowLevel getTypeSymbol
      | NONE               => K I

    val addStructGetTypeFunctionStrDecHighLevel =
      case optGetTypeSymbol of
        SOME getTypeSymbol => addGetTypeFunctionStrDecHighLevel getTypeSymbol
      | NONE               => K I

    (* module *)
    val acc'0
      : strdec list
         * (interfaceref list * struct1 ListDict.t)
         * info_excl_hier list =
      ([], ([], ListDict.empty), excls'0)
    val acc'1 =
      addStructMethodStrDecsHighLevel
        repo
        vers
        (structInfo, structIRef)
        (structInfo, acc'0)
    val acc'2 =
      addStructNewFunctionStrDecHighLevel
        optFieldInfos
        structType
        structIRef
        structInfo
        acc'1
    val acc'3 = addStructGetTypeFunctionStrDecHighLevel typeIRef acc'2
    val acc'4 = addStructFieldAccessorStrDecs (optFieldInfos, acc'3)
    val acc'5 = addStructFieldStructureStrDecs structIRef (optFieldInfos, acc'4)
    val (strDecs'2, (iRefs'2, structDeps'2), excls'2) = acc'5

    val strIRefs =
      structIRef :: iRefs'2  (* `structIRef` for record structure dependence *)

    (*
     *     type t = <StructNamespace><StructName>Record.t
     * 
     *     type <varlist[1]> <local_name[1]> =
     *       <varlist[1]> <StructNamespace><TypeName[1]>.<t[1]>
     * 
     *     ...
     * 
     *     type <varlist[N]> <local_name[N]> =
     *       <varlist[N]> <StructNamespace><TypeName[N]>.<t[N]>
     *)
    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

    fun mkModule isPolyML =
      let
        val (strDecs'4, _) =
          addStructMethodStrDecsLowLevel
            isPolyML
            repo
            vers
            addStructGetTypeFunctionStrDecLowLevel
            structIRef
            optFieldInfos
            (structInfo, (strDecs'3, excls'2))

        val strDecs'5 =
          revMapAppend mkStructStrDec (ListDict.toList structDeps'2, strDecs'4)

        val struct1 = mkBodyStruct strDecs'5

        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrModuleQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)

        (* strdec *)
        val structDec = toList1 [(structStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val structSpec =
      let
        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrSpecQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)
      in
        (* spec *)
        SpecStruct (toList1 [(structStrNameId, qSig)])
      end

    (* namespace strdec *)
    val structStrDec =
      StrDecStruct (
        toList1 [
          (structStrNameId, NONE, StructName (toList1 [structStrId]))
        ]
      )
  in
    (
      mkStrFile structStrId,
      ([structSpec], [structStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      excls'2
    )
  end
