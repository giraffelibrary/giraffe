(* --------------------------------------------------------------------------
 * Interface conversion (as<InterfaceName> functions)
 * -------------------------------------------------------------------------- *)

fun mkInterfaceConvId interfaceName = "as" ^ toUCC interfaceName


(* Specification *)

fun makeInterfaceConvSpec
  _
  (containerIRef as {namespace = containerNamespace, ...} : interfaceref)
  (interfaceInfo, ((sigIRefs, extIRefs), excls))
  : spec * ((interfaceref list * interfaceref list) * info_excl_hier list) =
  let
    val () = checkDeprecated interfaceInfo

    val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
    val interfaceName = getName interfaceInfo
    val interfaceScope =
      if interfaceNamespace <> containerNamespace
      then GLOBAL
      else LOCALINTERFACEOTHER
    val interfaceTy = CLASS

    val interfaceIRef = {
      namespace = interfaceNamespace,
      name      = interfaceName,
      scope     = interfaceScope,
      ty        = interfaceTy,
      container = NONE
    }

    val interfaceConvId = mkInterfaceConvId interfaceName

    val sigIRefs'1 =
      case interfaceScope of
        GLOBAL             => sigIRefs
   (* | LOCALINTERFACESELF => sigIRefs *) (* unreachable *)
      | _                  => insert (interfaceIRef, sigIRefs)

    (*
     * <containerTy> -> <interfaceTy>
     *)
    val tyVarIdx'0 = 0
    val (containerTy, tyVarIdx'1) =
       makeIRefLocalTypeRef makeRefVarTy (containerIRef, tyVarIdx'0)
    val (interfaceTy, _) =
       makeIRefLocalTypeRef makeRefBaseTy (interfaceIRef, tyVarIdx'1)
    val interfaceConvTy = TyFun (containerTy, interfaceTy)
  in
    (mkValSpec (interfaceConvId, interfaceConvTy), ((sigIRefs'1, extIRefs), excls))
  end


(* Declaration *)

fun makeInterfaceConvStrDec
  _
  rootObjectIRef
  ({namespace = containerNamespace, ...} : interfaceref)
  (interfaceInfo, ((iRefs, structDeps), excls))
  : strdec * ((interfaceref list * struct1 ListDict.t) * info_excl_hier list) =
  let
    val () = checkDeprecated interfaceInfo

    val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
    val interfaceName = getName interfaceInfo
    val interfaceScope =
      if interfaceNamespace <> containerNamespace
      then GLOBAL
      else LOCALINTERFACEOTHER
    val interfaceTy = CLASS

    val interfaceIRef = {
      namespace = interfaceNamespace,
      name      = interfaceName,
      scope     = interfaceScope,
      ty        = interfaceTy,
      container = NONE
    }

    val interfaceConvId = mkInterfaceConvId interfaceName

    val iRefs'1 =
      case interfaceScope of
        GLOBAL             => iRefs
   (* | LOCALINTERFACESELF => iRefs *) (* unreachable *)
      | _                  => insert (interfaceIRef, iRefs)

    (*
     *   <RootObjectNamespace><RootObjectName>Class.FFI.withPtr false
     *)
    val withFunExp =
      ExpApp (
        mkLIdLNameExp (prefixInterfaceStrId rootObjectIRef [ffiStrId, withPtrId]),
        falseExp
      )

    (*
     *   <InterfaceNamespace><InterfaceName>Class.FFI.fromPtr false
     *)
    val fromFunExp =
      ExpApp (
        mkLIdLNameExp (prefixInterfaceStrId interfaceIRef [ffiStrId, fromPtrId]),
        falseExp
      )

    (*
     *   conv (<RootObjectNamespace><RootObjectName>Class.toBase self)
     *)
    val convAppExp =
      ExpApp (
        mkIdLNameExp convId,
        mkParenExp (
          ExpApp (toBaseExp rootObjectIRef, mkIdLNameExp selfId)
        )
      )

    (* 
     *   local
     *     val conv =
     *       <RootObjectNamespace><RootObjectName>Class.FFI.withPtr false
     *         (<InterfaceNamespace><InterfaceName>Class.FFI.fromPtr false)
     *   in
     *     fun as<InterfaceName> self =
     *       <convAppExp>
     *   end
     *)
    val convExp = ExpApp (withFunExp, mkParenExp fromFunExp)
    val functionDec =
      DecLocal (
        mkDecs [mkIdValDec (convId, convExp)],
        mkDecs [mkIdFunDec (interfaceConvId, toList1 [mkIdVarAPat selfId], convAppExp)]
      )
  in
    (
      StrDecDec functionDec,
      ((iRefs'1, structDeps), excls)
    )
  end
