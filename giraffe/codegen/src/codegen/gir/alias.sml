(* --------------------------------------------------------------------------
 * Alias
 * -------------------------------------------------------------------------- *)


(* Signature *)

fun makeAliasSig
  (_              : 'a RepositoryClass.class)
  (aliasNamespace : string)
  (aliasInfo      : 'b AliasInfoClass.class)
  (errs'0         : infoerrorhier list)
  : id * program * id list * infoerrorhier list =
  let
    val () = checkDeprecated aliasInfo

    val aliasName = getName aliasInfo
    val () = checkAliasName (aliasNamespace, SOME aliasName)

    fun notExpected s = infoError ("type " ^ s ^ " not expected")
    fun notSupported s = infoError ("type " ^ s ^ " not supported")

    fun makeSourceRefSig {name, namespace, ty} =
      let
        val sigId = toUCU (makeInterfaceOtherStrId ty namespace name)
        val sigDeps =
          if namespace <> aliasNamespace
          then []
          else [sigId]
      in
        (sigId, ty, sigDeps)
      end

    open TypeTag

    fun scalarSigId optSourceRef _ =
      case optSourceRef of
        SOME sourceRef => makeSourceRefSig sourceRef
      | NONE           => ("F_F_I_SCALAR", SIMPLE, [])

    fun utf8SigId optSourceRef =
      case optSourceRef of
        SOME sourceRef => makeSourceRefSig sourceRef
      | NONE           => ("F_F_I_STRING", SIMPLE, [])

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
        | BOOLEAN      => scalarSigId optSourceRef STBOOLEAN
        | CHAR         => scalarSigId optSourceRef STCHAR
        | UCHAR        => scalarSigId optSourceRef STUCHAR
        | INT          => scalarSigId optSourceRef STINT
        | UINT         => scalarSigId optSourceRef STUINT
        | SHORT        => scalarSigId optSourceRef STSHORT
        | USHORT       => scalarSigId optSourceRef STUSHORT
        | LONG         => scalarSigId optSourceRef STLONG
        | ULONG        => scalarSigId optSourceRef STULONG
        | INT8         => scalarSigId optSourceRef STINT8
        | UINT8        => scalarSigId optSourceRef STUINT8
        | INT16        => scalarSigId optSourceRef STINT16
        | UINT16       => scalarSigId optSourceRef STUINT16
        | INT32        => scalarSigId optSourceRef STINT32
        | UINT32       => scalarSigId optSourceRef STUINT32
        | INT64        => scalarSigId optSourceRef STINT64
        | UINT64       => scalarSigId optSourceRef STUINT64
        | FLOAT        => scalarSigId optSourceRef STFLOAT
        | DOUBLE       => scalarSigId optSourceRef STDOUBLE
        | SIZE         => scalarSigId optSourceRef STSIZE
        | SSIZE        => scalarSigId optSourceRef STSSIZE
        | OFFSET       => notSupported "OFFSET"
        | INTPTR       => notSupported "INTPTR"
        | UINTPTR      => notSupported "UINTPTR"
        | FILENAME     => utf8SigId optSourceRef
        | UTF8         => utf8SigId optSourceRef
        | UNICHAR      => scalarSigId optSourceRef STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo

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
              | _ => makeSourceRefSig sourceRef
            end
      end

    val typeInfo = AliasInfo.getType aliasInfo
    val (sourceSigId, sourceTy, sigDeps) = resolveType NONE typeInfo

    val aliasIRef =
      {
        namespace = aliasNamespace,
        name      = aliasName,
        scope     = LOCALNAMESPACE, (* not used *)
        ty        = sourceTy
      }

    val aliasStrId = makeIRefInterfaceOtherStrId aliasIRef
    val aliasSigId = toUCU aliasStrId

    val sig1 = SigName sourceSigId
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(aliasSigId, qSig)]
    val program = [ModuleDecSig sigDec]
  in
    (aliasSigId, Portable program, sigDeps, errs'0)
  end


(* Structure *)

fun makeAliasStr
  (_              : 'a RepositoryClass.class)
  (aliasNamespace : string)
  (aliasInfo      : 'b AliasInfoClass.class)
  (errs'0         : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated aliasInfo

    val aliasName = getName aliasInfo
    val () = checkAliasName (aliasNamespace, SOME aliasName)

    (* module *)
    fun notExpected s = infoError ("type " ^ s ^ " not expected")
    fun notSupported s = infoError ("type " ^ s ^ " not supported")

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
                ty        = ty
              }
            ]
      in
        (strIds1, ty, iRefs)
      end

    fun scalarStrIds optSourceRef ty =
      case optSourceRef of
        SOME sourceRef => makeSourceRefStr sourceRef
      | NONE           => (("FFI", [scalarStrId ty]), SIMPLE, [])

    fun utf8StrIds optSourceRef =
      case optSourceRef of
        SOME sourceRef => makeSourceRefStr sourceRef
      | NONE           => (("FFI", ["String"]), SIMPLE, [])

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
        ty        = sourceTy
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
      aliasStrId,
      (aliasSpecs, aliasStrDecs),
      Specific {mlton = program, polyml = program},
      iRefs,
      errs'0
    )
  end
