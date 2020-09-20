(* --------------------------------------------------------------------------
 * Alias
 * -------------------------------------------------------------------------- *)


(* Signature *)

fun makeAliasSig
  (repo           : 'a RepositoryClass.class)
  (vers           : Repository.typelibvers_t)
  (aliasNamespace : string)
  (aliasInfo      : 'b AliasInfoClass.class)
  (excls'0        : info_excl_hier list)
  : id * program * interfaceref list * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated aliasInfo

    val aliasName = getName aliasInfo
    val () = checkAliasName (aliasNamespace, SOME aliasName)

    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")

    fun makeSourceSigIRef {name, namespace, ty} =
      let
        val scope =
          if namespace <> aliasNamespace
          then GLOBAL
          else LOCALNAMESPACE
      in
        {
          namespace = namespace,
          name      = name,
          scope     = scope,
          ty        = ty,
          container = NONE
        }
      end

    open TypeTag

    fun scalarSigIRef optSourceRef _ =
      case optSourceRef of
        SOME sourceRef => makeSourceSigIRef sourceRef
      | NONE           =>
          {
            namespace = "",
            name      = "C_SCALAR",
            scope     = GLOBAL,
            ty        = SIMPLE,
            container = NONE
          }

    fun utf8SigIRef optSourceRef =
      case optSourceRef of
        SOME sourceRef => makeSourceSigIRef sourceRef
      | NONE           =>
          {
            namespace = "",
            name      = "UTF8",
            scope     = GLOBAL,
            ty        = SIMPLE,
            container = NONE
          }

    fun resolveType optSourceRef typeInfo =
      let
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        => notSupported "GTYPE"
        | ARRAY        => notSupported "ARRAY"
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => scalarSigIRef optSourceRef STBOOLEAN
        | CHAR         => scalarSigIRef optSourceRef STCHAR
        | UCHAR        => scalarSigIRef optSourceRef STUCHAR
        | INT          => scalarSigIRef optSourceRef STINT
        | UINT         => scalarSigIRef optSourceRef STUINT
        | SHORT        => scalarSigIRef optSourceRef STSHORT
        | USHORT       => scalarSigIRef optSourceRef STUSHORT
        | LONG         => scalarSigIRef optSourceRef STLONG
        | ULONG        => scalarSigIRef optSourceRef STULONG
        | INT8         => scalarSigIRef optSourceRef STINT8
        | UINT8        => scalarSigIRef optSourceRef STUINT8
        | INT16        => scalarSigIRef optSourceRef STINT16
        | UINT16       => scalarSigIRef optSourceRef STUINT16
        | INT32        => scalarSigIRef optSourceRef STINT32
        | UINT32       => scalarSigIRef optSourceRef STUINT32
        | INT64        => scalarSigIRef optSourceRef STINT64
        | UINT64       => scalarSigIRef optSourceRef STUINT64
        | FLOAT        => scalarSigIRef optSourceRef STFLOAT
        | DOUBLE       => scalarSigIRef optSourceRef STDOUBLE
        | SIZE         => scalarSigIRef optSourceRef STSIZE
        | SSIZE        => scalarSigIRef optSourceRef STSSIZE
        | OFFSET       => notSupported "OFFSET"
        | INTPTR       => notSupported "INTPTR"
        | UINTPTR      => notSupported "UINTPTR"
        | FILENAME     => utf8SigIRef optSourceRef
        | UTF8         => utf8SigIRef optSourceRef
        | UNICHAR      => scalarSigIRef optSourceRef STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType repo vers interfaceInfo

              val sourceTy = getIRefTy interfaceInfo
              val sourceRef =
                case optSourceRef of
                  SOME {name, namespace, ...} =>
                    {
                      name      = name,
                      namespace = namespace,
                      ty        = sourceTy
                    }
                | NONE        =>
                    let
                      val sourceName = getName interfaceInfo
                      val sourceNamespace =
                        BaseInfo.getNamespace interfaceInfo
                    in
                      {
                        namespace = sourceNamespace,
                        name      = sourceName,
                        ty        = sourceTy
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                ALIAS aliasInfo
                  => resolveType (SOME sourceRef) (AliasInfo.getType aliasInfo)
              | _ => makeSourceSigIRef sourceRef
            end
      end

    val typeInfo = AliasInfo.getType aliasInfo
    val sourceSigIRef as {scope, ty = sourceTy, container, ...} = resolveType NONE typeInfo
    val sourceSigId = toUCU (makeIRefInterfaceOtherStrId sourceSigIRef)
    val sigIRefs =
      case scope of
        GLOBAL             => []
      | _                  => [sourceSigIRef]
    val extIRefs =
      case container of
        NONE => []
      | _    => [sourceSigIRef]

    val aliasIRef =
      {
        namespace = aliasNamespace,
        name      = aliasName,
        scope     = LOCALNAMESPACE, (* not used *)
        ty        = sourceTy,
        container = NONE
      }

    val aliasStrId = makeIRefInterfaceOtherStrId aliasIRef
    val aliasSigId = toUCU aliasStrId

    val sig1 = SigName sourceSigId
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(aliasSigId, qSig)]
    val program = [ModuleDecSig sigDec]
  in
    (mkSigFile aliasSigId, Portable program, sigIRefs, extIRefs, excls'0)
  end


(* Structure *)

fun makeAliasStr
  (repo           : 'a RepositoryClass.class)
  (vers           : Repository.typelibvers_t)
  (aliasNamespace : string)
  (aliasInfo      : 'b AliasInfoClass.class)
  (excls'0        : info_excl_hier list)
  : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated aliasInfo

    val aliasName = getName aliasInfo
    val () = checkAliasName (aliasNamespace, SOME aliasName)

    (* module *)
    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")

    fun makeSourceRefStr {name, namespace, ty} =
      let
        val strIds1 = toList1 [makeInterfaceOtherStrId ty namespace name]
        val iRefs =
          if namespace <> aliasNamespace
          then []
          else
            [
              {
                namespace = namespace,
                name      = name,
                scope     = LOCALINTERFACEOTHER,
                ty        = ty,
                container = NONE
              }
            ]
      in
        (strIds1, ty, iRefs)
      end

    fun scalarStrIds optSourceRef ty =
      case optSourceRef of
        SOME sourceRef => makeSourceRefStr sourceRef
      | NONE           => ((gStrId ^ scalarStrId ty, []), SIMPLE, [])

    fun utf8StrIds optSourceRef =
      case optSourceRef of
        SOME sourceRef => makeSourceRefStr sourceRef
      | NONE           => (("Utf8", []), SIMPLE, [])

    fun resolveType optSourceRef typeInfo =
      let
        open TypeTag
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        => notSupported "GTYPE"
        | ARRAY        => notSupported "ARRAY"
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => scalarStrIds optSourceRef STBOOLEAN
        | CHAR         => scalarStrIds optSourceRef STCHAR
        | UCHAR        => scalarStrIds optSourceRef STUCHAR
        | INT          => scalarStrIds optSourceRef STINT
        | UINT         => scalarStrIds optSourceRef STUINT
        | SHORT        => scalarStrIds optSourceRef STSHORT
        | USHORT       => scalarStrIds optSourceRef STUSHORT
        | LONG         => scalarStrIds optSourceRef STLONG
        | ULONG        => scalarStrIds optSourceRef STULONG
        | INT8         => scalarStrIds optSourceRef STINT8
        | UINT8        => scalarStrIds optSourceRef STUINT8
        | INT16        => scalarStrIds optSourceRef STINT16
        | UINT16       => scalarStrIds optSourceRef STUINT16
        | INT32        => scalarStrIds optSourceRef STINT32
        | UINT32       => scalarStrIds optSourceRef STUINT32
        | INT64        => scalarStrIds optSourceRef STINT64
        | UINT64       => scalarStrIds optSourceRef STUINT64
        | FLOAT        => scalarStrIds optSourceRef STFLOAT
        | DOUBLE       => scalarStrIds optSourceRef STDOUBLE
        | SIZE         => scalarStrIds optSourceRef STSIZE
        | SSIZE        => scalarStrIds optSourceRef STSSIZE
        | OFFSET       => notSupported "OFFSET"
        | INTPTR       => notSupported "INTPTR"
        | UINTPTR      => notSupported "UINTPTR"
        | FILENAME     => utf8StrIds optSourceRef
        | UTF8         => utf8StrIds optSourceRef
        | UNICHAR      => scalarStrIds optSourceRef STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType repo vers interfaceInfo

              val sourceTy = getIRefTy interfaceInfo
              val sourceRef =
                case optSourceRef of
                  SOME {name, namespace, ...} =>
                    {
                      name      = name,
                      namespace = namespace,
                      ty        = sourceTy
                    }
                | NONE                        =>
                    let
                      val sourceName = getName interfaceInfo
                      val sourceNamespace =
                        BaseInfo.getNamespace interfaceInfo
                    in
                      {
                        namespace = sourceNamespace,
                        name      = sourceName,
                        ty        = sourceTy
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                ALIAS aliasInfo
                  => resolveType (SOME sourceRef) (AliasInfo.getType aliasInfo)
              | _ => makeSourceRefStr sourceRef
            end
      end

    val typeInfo = AliasInfo.getType aliasInfo
    val (sourceStrIds1, sourceTy, iRefs) = resolveType NONE typeInfo

    val aliasIRef =
      {
        namespace = aliasNamespace,
        name      = aliasName,
        scope     = LOCALNAMESPACE, (* not used *)
        ty        = sourceTy,
        container = NONE
      }

    val aliasStrId = makeIRefInterfaceOtherStrId aliasIRef
    val aliasSigId = toUCU aliasStrId

    val aliasStrNameId = makeIRefNamespaceStrId aliasIRef

    (** sig **)
    (* No signature to ensure PolyML substructure is not hidden
    val sig1 = SigName aliasSigId
    val qSig : qsig = (sig1, [])
     *)

    (** strdec **)
    val struct1 = StructName sourceStrIds1
    val structDec = toList1 [(aliasStrId, NONE, struct1)]
    val strDec = StrDecStruct structDec

    val program = [ModuleDecStr strDec]

    (* namespace spec *)
    val aliasSpec =
      let
        (* sig *)
        val sig1 = SigName aliasSigId
        val qSig : qsig = (sig1, [])
      in
        (* spec *)
        SpecStruct (toList1 [(aliasStrNameId, qSig)])
      end
    val aliasSpecs = [aliasSpec]

    (* namespace strdec *)
    val aliasStrDec =
      StrDecStruct (
        toList1 [
          (aliasStrNameId, NONE, StructName (toList1 [aliasStrId]))
        ]
      )
    val aliasStrDecs = [aliasStrDec]
  in
    (
      mkStrFile aliasStrId,
      (aliasSpecs, aliasStrDecs),
      Specific {mlton = program, polyml = program},
      iRefs,
      excls'0
    )
  end
