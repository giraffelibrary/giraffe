(* --------------------------------------------------------------------------
 * Interface conversion (as<InterfaceName> functions)
 * -------------------------------------------------------------------------- *)

fun mkInterfaceConvId interfaceName = "as" ^ toUCC interfaceName


(* Specification *)

fun makeInterfaceConvSpec
  _
  (containerIRef as {namespace = containerNamespace, ...} : interfaceref)
  (interfaceInfo, (iRefs, excls))
  : spec * (interfaceref list * info_excl_hier list) =
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
      ty        = interfaceTy
    }

    val interfaceConvId = mkInterfaceConvId interfaceName

    val iRefs'1 =
      case interfaceScope of
        GLOBAL             => iRefs
   (* | LOCALINTERFACESELF => iRefs *) (* unreachable *)
      | _                  => insert (interfaceIRef, iRefs)

    (*
     * <containerTy> -> <interfaceTy>
     *)
    val tyVarIdx'0 = 0
    val (containerTy, tyVarIdx'1) =
       makeIRefLocalTypeRef (makeRefVarTy false) (containerIRef, tyVarIdx'0)
    val (interfaceTy, _) =
       makeIRefLocalTypeRef (makeRefBaseTy false) (interfaceIRef, tyVarIdx'1)
    val interfaceConvTy = TyFun (containerTy, interfaceTy)
  in
    (mkValSpec (interfaceConvId, interfaceConvTy), (iRefs'1, excls))
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
      ty        = interfaceTy
    }

    val interfaceConvId = mkInterfaceConvId interfaceName

    val iRefs'1 =
      case interfaceScope of
        GLOBAL             => iRefs
   (* | LOCALINTERFACESELF => iRefs *) (* unreachable *)
      | _                  => insert (interfaceIRef, iRefs)

    (*
     *   <RootObjectNamespace><RootObjectName>Class.FFI.withPtr
     *)
    val withFunExp =
      mkLIdLNameExp (prefixInterfaceStrId rootObjectIRef [ffiStrId, withPtrId])

    (*
     *   <InterfaceNamespace><InterfaceName>Class.FFI.fromPtr false
     *)
    val fromFunExp =
      ExpApp (
        mkLIdLNameExp (prefixInterfaceStrId interfaceIRef [ffiStrId, fromPtrId]),
        falseExp
      )

    (*
     *   (<RootObjectNamespace><RootObjectName>Class.FFI.withPtr
     *     ---> <InterfaceNamespace><InterfaceName>Class.FFI.fromPtr false)
     *     I
     *     self
     *)
    val functionExp =
      ExpApp (
        ExpApp (
          mkParenExp (mkDDDRExp (withFunExp, fromFunExp)),
          mkIdLNameExp iId
        ),
        mkIdLNameExp selfId
      )
  in
    (
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix
                  (NameId interfaceConvId, toList1 [mkIdVarAPat selfId]),
                NONE,
                functionExp
              )
            ]
          ]
        )
      ),
      ((iRefs'1, structDeps), excls)
    )
  end
