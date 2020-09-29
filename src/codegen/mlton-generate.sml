(* C function wrapper abstract syntax *)

type c_type = string

type c_parameter =
  {
    name          : string,
    arrayDepthRef : (int * bool) option,
      (* NONE indicates scalar with type `elemType`
       * SOME (d, isRef) indicates an array of depth d
       *                  that is a reference iff isRef *)
    elemType      : c_type
  }

type version = string * string * string  (* (major, minor, patch) : version *)

type c_function =
  {
    name       : string,
    since      : version option,
    returnType : c_type,
    parameters : c_parameter list
  }


(* C function wrapper pretty printing *)

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

val mltonPrefix = "mlton_"

fun fmtCFunction
  (cppPrefix : string)
  ({name, since, returnType, parameters} : c_function)
: VTextTree.t =
  let
    open HVTextTree

    (* A formal parameter is formatted as
     *
     *   <elemType> <name>
     *     if arrayDepthRef is NONE
     *
     *   SML_CVECTOR_VAL(<elemType>, <name>)
     *     if arrayDepthRef = SOME (1, false)
     *
     *   SML_CVECTORVECTOR_VAL(<elemType>, <name>)
     *     if arrayDepthRef = SOME (2, false)
     *
     *   SML_CVECTOR_REF(<elemType>, <name>)
     *     if arrayDepthRef = SOME (1, true)
     *
     *   SML_CVECTORVECTOR_REF(<elemType>, <name>)
     *     if arrayDepthRef = SOME (2, true)
     *
     * An actual parameter is formatted as
     *
     *   <name>
     *     if arrayDepthRef is NONE
     *
     *   GET_SML_CVECTOR_VAL(<elemType>, <name>)
     *     if arrayDepthRef = SOME (1, false)
     *
     *   GET_SML_CVECTORVECTOR_VAL(<elemType>, <name>)
     *     if arrayDepthRef = SOME (2, false)
     *
     *   GET_SML_CVECTOR_REF(<elemType>, <name>)
     *     if arrayDepthRef = SOME (1, true)
     *
     *   GET_SML_CVECTORVECTOR_REF(<elemType>, <name>)
     *     if arrayDepthRef = SOME (2, true)
     *)
    fun fmtScalarParam isActual (elemType, name) =
      if isActual
      then H.str name
      else H.seq [H.str elemType, H.sp 1, H.str name]

    fun fmtArrayParam isActual (depth, isRef) (elemType, name) =
      H.seq [
        if isActual then H.str "GET_" else H.empty,
        H.str "SML_C",
        H.seq (List.tabulate (depth, fn _ => H.str "VECTOR")),
        H.str (if isRef then "_REF(" else "_VAL("),
        H.str elemType,
        H.str ",", H.sp 1,
        H.str name,
        H.str ")"
      ]

    fun fmtParam isActual hLast {name, arrayDepthRef, elemType} =
      H.seq [
        case arrayDepthRef of
          NONE          => fmtScalarParam isActual (elemType, name)
        | SOME depthRef => fmtArrayParam isActual depthRef (elemType, name),
        hLast
      ]
    val fmtFormalParam = fmtParam false
    val fmtActualParam = fmtParam true

    fun fmtFunDecl (name, params) =
      let
        val start = H.seq [H.str mltonPrefix, H.str name, H.sp 1, H.str "("]
        val indent = H.sp (H.size start)
        val formals =
          case params of
            [] => H (H.str ")")
          | _  => V (V.concat (fmtSeq (H.str ",", H.str ")") fmtFormalParam params))
      in
        indentWith1 (start, indent) formals
      end

    fun fmtFunCall (name, returnType, params) =
      let
        val return = if returnType = "void" then H.empty else H.seq [H.str "return", H.sp 1]
        val start = H.seq [return, H.str name, H.sp 1, H.str "("]
        val indent = H.sp (H.size start)
        val actuals =
          case params of
            []  => H (H.str ");")
          | _   => V (V.concat (fmtSeq (H.str ",", H.str ");") fmtActualParam params))
      in
        indentWith1 (start, indent) actuals
      end

    val funDecl = fmtFunDecl (name, parameters)
    val funCall = fmtFunCall (name, returnType, parameters)
    val funDef = 
      V.seq [
        V.str returnType,
        toV funDecl,
        V.str "{",
        V.indentWith (H.sp 2) true (toV funCall),
        V.str "}"
      ]
  in
    case since of
      SOME (major, minor, patch) =>
        V.seq [
          V.line (
            H.concat [
              "#if ", cppPrefix, "_CHECK_VERSION(", major, ", ", minor, ", ", patch, ")"
            ]
          ),
          funDef,
          V.str "#endif"
        ]
    | NONE                       => funDef
  end


(* Failures *)

type info_id = string * string option  (* info type and optional name *)

datatype info_excl =
  IEMsg of string
| IEGrp of info_excl_hier list

withtype info_excl_hier = info_id * info_excl


exception InfoExcl of info_excl

fun infoExcl msg = raise InfoExcl (IEMsg msg)


fun revFoldInfosWithExcls getInfoId f (xs, (acc, excls)) =
  let
    fun aux (acc, excls) xs =
      case xs of
        []       => (acc, excls : info_excl_hier list)
      | x :: xs' =>
          let
            val (acc', excls') =
              let
                val (acc', fExcls) = f (x, (acc, [] : info_excl_hier list))
                val excls' =
                  case fExcls of
                    []     => excls
                  | _ :: _ => (getInfoId x, IEGrp fExcls) :: excls
              in
                (acc', excls')
              end
                handle
                  InfoExcl ie =>
                    (acc, (getInfoId x, ie) :: excls)
          in
            aux (acc', excls') xs'
          end
  in
    aux (acc, excls) xs
  end


(* Utilities *)

fun repeat (n : int) (f : 'a -> 'a option) (x : 'a) : 'a option =
  if n > 0
  then
    case f x of
      SOME x' => repeat (n - 1) f x'
    | NONE    => NONE
  else
    SOME x

fun dropStarR (ss'0 : substring) : substring option =
  let
    open Substring
    val ss'1 = dropr (fn c => c <> #"*") ss'0
    val last = size ss'1 - 1
  in
    SOME (slice (ss'1, 0, SOME last))
  end
    handle Subscript => NONE

fun writeFile (dir, file) v =
  let
    val dirFile = OS.Path.concat (dir, file)

    val ostream = TextIO.openAppend dirFile
    val writer = (
      fn () => TextIO.output1 (ostream, #"\n"),
      fn s => TextIO.output (ostream, s)
    )
  in
    HVTextTree.V.app writer v
      handle
        e => (TextIO.closeOut ostream; raise e);
    TextIO.closeOut ostream
  end



open GirAbstractSyntaxTree


val getName =
  fn
    SOME name => name
  | NONE      => infoExcl "attribute \"name\" not specified"

val getCTypeStr =
  fn
    SOME s => s
  | NONE   => infoExcl "attribute \"c:type\" not specified"

fun getGenCType (elemName, optName) cType =
  getCTypeStr cType
    handle
      InfoExcl ie => raise InfoExcl (IEGrp [((elemName, optName), ie)])

fun getCType (type_ : type_) : c_type =
  case type_ of
    TYPEARRAY ({name, cType, ...}, _) => getGenCType ("array", name) cType
  | TYPENAMED ({name, cType, ...}, _) => getGenCType ("type", name) cType
  | TYPECALLBACK {name, cType, ...}   => getGenCType ("callback", SOME name) cType
  | TYPEVARARGS                       => infoExcl "varargs not supported"

val rec getArrayDepth =
  fn
    TYPEARRAY (_, type_)                         => 1 + getArrayDepth type_
  | TYPENAMED ({name = SOME "utf8", ...}, _)     => 1
  | TYPENAMED ({name = SOME "filename", ...}, _) => 1
  | _                                            => 0

fun getCElemType indirectionLevel : c_type -> c_type option =
  Option.map Substring.string o repeat indirectionLevel dropStarR o Substring.full

fun addArrayDepth (parameter as {name, type_, ...}) =
  (parameter, getArrayDepth type_)
    handle
      InfoExcl ie =>
        raise InfoExcl (IEGrp [(("parameter", name), ie)])

fun getCParameter
  (
    {name, direction, callerAllocates, type_, ...} : parameter,
    depth : int
  )
    : c_parameter =
  let
    val name = getName name
    val cType = getCType type_
  in
    if depth = 0
    then (* not an array type *)
      {
        name          = name,
        arrayDepthRef = NONE,
        elemType      = cType
      }
    else
      let
        val () =
          if depth <= 2
          then ()
          else infoExcl "C array type has depth greater than 2"

        val refDepth =
          case direction of
            NONE         => 0
          | SOME "in"    => 0
          | SOME "out"   => (
              case callerAllocates of
                NONE     => 1
              | SOME "0" => 1
              | SOME "1" =>
                  infoExcl ("C array caller-allocates out parameter not supported")
              | SOME s   =>
                  infoExcl ("attribute \"callerAllocates\" has invalid value \""
                                                     ^ String.toString s ^ "\"")
            )
          | SOME "inout" => 1
          | SOME s       =>
              infoExcl ("attribute \"direction\" has invalid value \""
                                                     ^ String.toString s ^ "\"")
        val arrayDepthRef = SOME (depth, refDepth > 0)
        val elemType =
          case getCElemType (depth + refDepth) cType of
            SOME cElemType => cElemType
          | NONE           =>
              infoExcl (          
                String.concat (
                  ["C type does not have sufficient indirection for "]
                   @ (if refDepth > 0 then ["reference to "] else [])
                   @ ["array of depth ", Int.toString depth]
                )
              )
      in
        {
          name          = name,
          arrayDepthRef = arrayDepthRef,
          elemType      = elemType
        }
      end
  end
    handle
      InfoExcl ie =>
        raise InfoExcl (IEGrp [(("parameter", name), ie)])

val errorCParameter : c_parameter =
  {
    name          = "error",
    arrayDepthRef = NONE,
    elemType      = "GError**"
  }

fun getFunctionElemName functionElem =
  case functionElem of
    FECONSTRUCTOR => "constructor"
  | FEFUNCTION    => "function"
  | FEMETHOD      => "method"

fun addCFunction
  (
    {config, callable, cIdentifier, shadowedBy, movedTo, throws, ...} : function,
    (cFunctions, excls)
  ) =
  let
    open ListExtras

    val {returnValue, parameters = {instance, others}} = callable
    val parameters = case instance of SOME p => p :: others | _ => others
    val revParametersWithArrayDepth = revMap addArrayDepth parameters

    val () =
      case #introspectable config of
        NONE     => ()
      | SOME "1" => ()
      | SOME "0" => infoExcl ("not introspectable")
      | SOME s   => infoExcl ("attribute \"introspectable\" has invalid value \""
                                                       ^ String.toString s ^ "\"")

    val () =
      case movedTo of
        SOME name => infoExcl ("moved to " ^ name)
      | NONE      => ()

    (* ignore functions that have no array parameters *)
    val () =
      if List.all (fn (_, depth) => depth = 0) revParametersWithArrayDepth
      then infoExcl "no array parameters"
      else ()

    val name =
      case shadowedBy of
        SOME name => infoExcl ("shadowed by " ^ name)
      | NONE      => cIdentifier

    val since =
      case #version config of
        NONE   => NONE
      | SOME s =>
          case String.fields (fn c => c = #".") s of
            [major, minor]        => SOME (major, minor, "0")
          | [major, minor, patch] => SOME (major, minor, patch)
          | _                     =>
              infoExcl ("attribute \"version\" has invalid value \""
                                                       ^ String.toString s ^ "\"")

    val returnType =
      getCType (#type_ returnValue)
        handle
          InfoExcl ie => raise InfoExcl (IEGrp [(("return-value", NONE), ie)])

    val parameters'0 =
      case throws of
        NONE     => []
      | SOME "0" => []
      | SOME "1" => [errorCParameter] 
      | SOME s   => infoExcl ("attribute \"throws\" has invalid value \""
                                                       ^ String.toString s ^ "\"")
    val parameters =
      revMapAppend getCParameter (revParametersWithArrayDepth, parameters'0)

    val cFunction =
      {
        name       = name,
        since      = since,
        returnType = returnType,
        parameters = parameters
      }
  in
    (cFunction :: cFunctions, excls)
  end

fun getFunctionInfoId {elem, name, ...} = (getFunctionElemName elem, SOME name)

fun addClassMethods ({method, ...} : class) (cFunctions, excls) =
  revFoldInfosWithExcls getFunctionInfoId addCFunction (method, (cFunctions, excls))

fun addInterfaceMethods ({method, ...} : interface) (cFunctions, excls) =
  revFoldInfosWithExcls getFunctionInfoId addCFunction (method, (cFunctions, excls))

fun addRecordMethods ({method, ...} : record) (cFunctions, excls) =
  revFoldInfosWithExcls getFunctionInfoId addCFunction (method, (cFunctions, excls))

fun addUnionMethods ({method, ...} : union) (cFunctions, excls) =
  revFoldInfosWithExcls getFunctionInfoId addCFunction (method, (cFunctions, excls))

fun addEnumMethods ({method, ...} : enum) (cFunctions, excls) =
  revFoldInfosWithExcls getFunctionInfoId addCFunction (method, (cFunctions, excls))

fun addNamespaceElem ({elem, ...}, (cFunctions, excls)) =
  case elem of
    ALIAS _             => (cFunctions, excls)
  | CLASS class         => addClassMethods class (cFunctions, excls)
  | INTERFACE interface => addInterfaceMethods interface (cFunctions, excls)
  | RECORD record       => addRecordMethods record (cFunctions, excls)
  | UNION union         => addUnionMethods union (cFunctions, excls)
  | BITFIELD enum       => addEnumMethods enum (cFunctions, excls)
  | ENUMERATION enum    => addEnumMethods enum (cFunctions, excls)
  | CALLBACK _          => (cFunctions, excls)
  | CONSTANT _          => (cFunctions, excls)
  | FUNCTION function   => addCFunction (function, (cFunctions, excls))

fun getNamespaceElemInfoId {elem, ...} =
  case elem of
    ALIAS {name, ...}       => ("alias",       SOME name)
  | CLASS {name, ...}       => ("class",       SOME name)
  | INTERFACE {name, ...}   => ("interface",   SOME name)
  | RECORD {name, ...}      => ("record",      SOME name)
  | UNION {name, ...}       => ("union",       SOME name)
  | BITFIELD {name, ...}    => ("bitfield",    SOME name)
  | ENUMERATION {name, ...} => ("enumeration", SOME name)
  | CALLBACK {name, ...}    => ("callback",    SOME name)
  | CONSTANT {name, ...}    => ("constant",    SOME name)
  | FUNCTION function       => getFunctionInfoId function


fun mkNamespaceDep (namespace, version) =
  String.concat [namespace, "-", version]

fun mkNamespaceFile namespaceDep = String.map Char.toLower namespaceDep

fun generate outDir path (namespace_, version, cppPrefix) =
  let
    val {namespace, ...} = GirReader.readRepo path (namespace_, version)
    val {elems, ...} = namespace
    val (revCFunctions, excls) =
      revFoldInfosWithExcls
        getNamespaceElemInfoId
        addNamespaceElem
        (elems, ([], []))

    val lib = mkNamespaceFile (mkNamespaceDep (namespace_, version))
    val file = String.concat ["giraffe-", lib, "-mlton.c"]

    open HVTextTree
    val header =
      V.seq [
        V.line (H.str "#include \"cvector.h\""),
        V.line (H.str "#include \"cvectorvector.h\""),
        V.line H.empty
      ]
    val fmtCFunction1 = fmtCFunction cppPrefix
    fun prefixCFunction (cf, v) = V.seq [fmtCFunction1 cf, V.line H.empty, v]
    val text =
      case revCFunctions of
        cf :: cfs => V.seq [header, foldl prefixCFunction (fmtCFunction1 cf) cfs]
      | []        => V.empty

    val () = writeFile (outDir, file) text
  in
    excls
  end


(* Write excluded log file *)

local
  open ListExtras
  open HVTextTree

  val indent = V.indentWith (H.str "  ") true

  local
    val startTag = "<tree style=\"lines\">"
    val endTag = "</tree>"
  in
    fun makeTree v = V.seq [V.str startTag, indent v, V.str endTag]
  end

  local
    val startTag = "<item>"
    val endTag = "</item>"
  in
    fun makeHItem h = H.seq [H.str startTag, h, H.str endTag]
    fun makeVItem v = V.seq [V.str startTag, indent v, V.str endTag]
  end

  fun fmtInfoExclHier ((ty, optName), infoExcl) =
    let
      val h = 
        H.seq [
          H.str ty,
          case optName of
            SOME name => H.seq [H.sp 1, H.str name]
          | NONE      => H.empty,
          case infoExcl of
            IEMsg msg => H.seq [H.str ": ", H.str msg]
          | IEGrp _   => H.empty
        ]
    in
      case infoExcl of
        IEMsg _     => V.line (makeHItem h)
      | IEGrp excls => makeVItem (
          V.seq [
            V.line h,
            V.seq (map fmtInfoExclHier excls)
          ]
        )
    end

  fun fmtLogVersion namespace (version, excls) =
    makeVItem (
      V.seq [
        V.str (mkNamespaceDep (namespace, version)),
        V.seq (map fmtInfoExclHier excls)
      ]
    )

  fun fmtLogNamespace (namespace, versionDict) =
    V.seq (revMap (fmtLogVersion namespace) (ListDict.toList versionDict))

  val pageStartTag = "<page xmlns=\"http://projectmallard.org/1.0/\">"
  val pageEndTag = "</page>"

  val file = "excluded-log.page"
in
  fun writeLogFile dir (excludedLog : info_excl_hier list ListDict.t ListDict.t) =
    let
      val text =
        V.seq [
          V.str pageStartTag,
          makeTree (V.seq (revMap fmtLogNamespace (ListDict.toList excludedLog))),
          V.str pageEndTag
        ]
    in
      writeFile (dir, file) text
    end
end
