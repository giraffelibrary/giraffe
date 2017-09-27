(* Support for structure identifiers *)

fun mkClassStrNameId name = toUCC name ^ "Class"
fun prefixClassStrNameId name ids = mkClassStrNameId name :: ids

fun mkRecordStrNameId name = toUCC name ^ "Record"
fun prefixRecordStrNameId name ids = mkRecordStrNameId name :: ids

fun mkStrNameId name = toUCC name
fun prefixStrNameId name ids = mkStrNameId name :: ids


(*
 *     <ObjectNamespace><ObjectName>Class
 *)
fun mkClassStrId namespace name = concat [toUCC namespace, toUCC name, "Class"]
fun prefixClassStrId namespace name ids = mkClassStrId namespace name :: ids

(*
 *     <StructNamespace><StructName>Record
 *)
fun mkRecordStrId namespace name =
  concat [toUCC namespace, toUCC name, "Record"]
fun prefixRecordStrId namespace name ids = mkRecordStrId namespace name :: ids

(*
 *     <XNamespace><XName>
 *)
fun mkStrId namespace name = concat [toUCC namespace, toUCC name]
fun prefixStrId namespace name ids = mkStrId namespace name :: ids


(*
 *     <ObjectNamespace>.<ObjectName>Class
 *)
fun prefixClassStrIds namespace name ids =
  toUCC namespace :: concat [toUCC name, "Class"] :: ids

(*
 *     <StructNamespace>.<StructName>Record
 *)
fun prefixRecordStrIds namespace name ids =
  toUCC namespace :: concat [toUCC name, "Record"] :: ids

(*
 *     <XNamespace>.<XName>
 *)
fun prefixStrIds namespace name ids = toUCC namespace :: toUCC name :: ids



(* Support for interface type references *)

datatype interfacetype =
  SIMPLE
| CLASS
| RECORD
| UNION


fun makeNamespaceStrId (ty : interfacetype) : string -> string =
  case ty of
    SIMPLE => mkStrNameId
  | CLASS  => mkClassStrNameId
  | RECORD => mkRecordStrNameId
  | UNION  => mkStrNameId

fun makeInterfaceOtherStrId (ty : interfacetype) : string -> string -> string  =
  case ty of
    SIMPLE => mkStrId
  | CLASS  => mkClassStrId
  | RECORD => mkRecordStrId
  | UNION  => mkStrId


(* `interfacescope` describes the position of an interface reference
 * relative to where the interface type is declared.  The possible values are
 * as follows:
 *
 *   GLOBAL
 *     Referenced interface type is declared in another namespace.
 *
 *   LOCALNAMESPACE
 *     Referenced interface type is declared within this namespace and
 *     reference is at the namespace module level.
 *
 *   LOCALINTERFACEOTHER
 *     Referenced interface type is declared within this namespace and
 *     reference is at the interface module level where the interface
 *     module that references the interface type IS NOT the interface
 *     module that declares it.
 *
 *   LOCALINTERFACESELF
 *     Referenced interface type is declared within this namespace and
 *     reference is at the interface module level where the interface
 *     module that references the interface type IS the interface
 *     module that declares it.
 *
 * It is easiest to understand this by breaking down the names into the
 * following three concepts:
 *
 *   GLOBAL | LOCAL
 *     Indicates whether the reference to an interface type and the
 *     declaration of that interface type occur in different namespaces
 *     (GLOBAL) or in the same namespace (LOCAL).
 *
 *   NAMESPACE | INTERFACE
 *     Indicates whether the reference to an interface type is from a
 *     namespace module (NAMESPACE) or from an interface module (INTERFACE).
 *
 *   OTHER | SELF
 *     Indicates whether the reference to an interface type and the
 *     declaration of that interface type occur in different interface
 *     modules (OTHER) or in the same interface module (SELF).
 *
 *)

datatype interfacescope =
  GLOBAL
| LOCALNAMESPACE
| LOCALINTERFACEOTHER
| LOCALINTERFACESELF


type interfaceref = {
  namespace : string,
  name      : string,
  scope     : interfacescope,
  ty        : interfacetype
}


fun makeLocalInterfaceSelfId ({ty, ...} : interfaceref) : id =
  case ty of
    SIMPLE => "t"
  | CLASS  => "class"
  | RECORD => "t"
  | UNION  => "union"


fun makeLocalInterfaceOtherId (iRef as {name, ...} : interfaceref) : id =
  concat [
    toLCU name,
    "_",
    makeLocalInterfaceSelfId iRef
  ]


fun makeLocalInterfaceId
  (iRef as {scope, ...} : interfaceref)
  : id =
  case scope of
    GLOBAL              => raise Fail "not local interface reference"
  | LOCALNAMESPACE      => raise Fail "not local interface reference"
  | LOCALINTERFACEOTHER => makeLocalInterfaceOtherId iRef
  | LOCALINTERFACESELF  => makeLocalInterfaceSelfId iRef


fun prefixLocalNamespaceIds ({name, ty, ...} : interfaceref) =
  case ty of
    SIMPLE => prefixStrNameId name
  | CLASS  => prefixClassStrNameId name
  | RECORD => prefixRecordStrNameId name
  | UNION  => prefixStrNameId name

fun makeLocalNamespaceIds iRef =
  prefixLocalNamespaceIds iRef [makeLocalInterfaceSelfId iRef]


fun prefixGlobalIds ({namespace, name, ty, ...} : interfaceref) =
  case ty of
    SIMPLE => prefixStrIds namespace name
  | CLASS  => prefixClassStrIds namespace name
  | RECORD => prefixRecordStrIds namespace name
  | UNION  => prefixStrIds namespace name

fun makeGlobalIds iRef =
  prefixGlobalIds iRef [makeLocalInterfaceSelfId iRef]


(* For `iRef as {namespace, name, scope, ty, ...} : interfaceref`,
 * `makeInterfaceRefTyLongId iRef` returns the long id `lid` and
 * `numInterfaceRefTyVars iRef` returns number of type parameters `n`
 * according to the following table:
 *
 *     scope                   ty       | n   lid
 *   ===================================+===================================
 *                             SIMPLE   | 0   t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   class
 *     LOCALINTERFACESELF    -----------+-----------------------------------
 *                             RECORD   | 0   t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   union
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | 0   <name>_t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   <name>_class
 *     LOCALINTERFACEOTHER   -----------+-----------------------------------
 *                             RECORD   | 0   <name>_t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   <name>_union
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | 0   <Name>.t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   <Name>Class.class
 *     LOCALNAMESPACE        -----------+-----------------------------------
 *                             RECORD   | 0   <Name>Record.t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   <Name>.union
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | 0   <Namespace>.<Name>.t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   <Namespace>.<Name>Class.class
 *     GLOBAL                -----------+-----------------------------------
 *                             RECORD   | 0   <Namespace>.<Name>Record.t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   <Namespace>.<Name>.union
 *   -----------------------------------+-----------------------------------
 *)

fun numInterfaceRefTyVars ({ty, ...} : interfaceref) =
  case ty of
    SIMPLE => 0
  | CLASS  => 1
  | RECORD => 0
  | UNION  => 1

fun makeInterfaceRefTyLongId
  (iRef as {scope, ...} : interfaceref)
  : lid =
  toList1 (
    case scope of
      GLOBAL              => makeGlobalIds iRef
    | LOCALNAMESPACE      => makeLocalNamespaceIds iRef
    | LOCALINTERFACEOTHER => [makeLocalInterfaceOtherId iRef]
    | LOCALINTERFACESELF  => [makeLocalInterfaceSelfId iRef]
  )

(*
fun test (namespace, name, scope, ty) =
  makeInterfaceRefTyLongId {
    namespace = namespace,
    name      = name,
    scope     = scope,
    ty        = ty
  };

test ("XNamespace", "XName", GLOBAL,              SIMPLE);
test ("XNamespace", "XName", GLOBAL,              CLASS);
test ("XNamespace", "XName", GLOBAL,              RECORD);
test ("XNamespace", "XName", GLOBAL,              UNION);

test ("XNamespace", "XName", LOCALNAMESPACE,      SIMPLE);
test ("XNamespace", "XName", LOCALNAMESPACE,      CLASS);
test ("XNamespace", "XName", LOCALNAMESPACE,      RECORD);
test ("XNamespace", "XName", LOCALNAMESPACE,      UNION);

test ("XNamespace", "XName", LOCALINTERFACEOTHER, SIMPLE);
test ("XNamespace", "XName", LOCALINTERFACEOTHER, CLASS);
test ("XNamespace", "XName", LOCALINTERFACEOTHER, RECORD);
test ("XNamespace", "XName", LOCALINTERFACEOTHER, UNION);

test ("XNamespace", "XName", LOCALINTERFACESELF,  SIMPLE);
test ("XNamespace", "XName", LOCALINTERFACESELF,  CLASS);
test ("XNamespace", "XName", LOCALINTERFACESELF,  RECORD);
test ("XNamespace", "XName", LOCALINTERFACESELF,  UNION);
*)





fun makeIRefNamespaceStrId ({name, ty, ...} : interfaceref) =
  makeNamespaceStrId ty name


fun makeIRefInterfaceOtherStrId ({namespace, name, ty, ...} : interfaceref) =
  makeInterfaceOtherStrId ty namespace name


(* For `iRef as {namespace, name, scope, ty, ...} : interfaceref`,
 * `prefixInterfaceStrId iRef id` returns the ids `ids` according to
 * the following table:
 *
 *     scope                   ty       | ids
 *   ===================================+===================================
 *                             SIMPLE   | <id>
 *                           -----------+-----------------------------------
 *                             CLASS    | <Namespace><Name>Class.<id>
 *     LOCALINTERFACESELF    -----------+-----------------------------------
 *                             RECORD   | <Namespace><Name>Record.<id>
 *                           -----------+-----------------------------------
 *                             UNION    | <Namespace><Name>.<id>
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | <Namespace><Name>.<id>
 *                           -----------+-----------------------------------
 *                             CLASS    | <Namespace><Name>Class.<id>
 *     _                     -----------+-----------------------------------
 *                             RECORD   | <Namespace><Name>Record.<id>
 *                           -----------+-----------------------------------
 *                             UNION    | <Namespace><Name>.<id>
 *   -----------------------------------+-----------------------------------
 *
 * Note that, in the case of `LOCALINTERFACESELF`, prefixing occurs
 * for objects, structs and unions because these use a separate structure
 * to declare the type.
 *)

fun prefixInterfaceStrId
  (iRef as {namespace, name, scope, ty, ...} : interfaceref)
  (ids : id list)
    : id list =
  case scope of
    GLOBAL              => makeIRefInterfaceOtherStrId iRef :: ids
  | LOCALNAMESPACE      => makeIRefInterfaceOtherStrId iRef :: ids
  | LOCALINTERFACEOTHER => makeIRefInterfaceOtherStrId iRef :: ids
  | LOCALINTERFACESELF  =>
      case ty of
        SIMPLE => ids
      | CLASS  => mkClassStrId namespace name :: ids
      | RECORD => mkRecordStrId namespace name :: ids
      | UNION  => mkStrId namespace name :: ids

(*
fun test (namespace, name, scope, ty) id =
  prefixInterfaceStrId {
    namespace = namespace,
    name      = name,
    scope     = scope,
    ty        = ty
  } id;

test ("XNamespace", "XName", GLOBAL,              SIMPLE) ["id"];
test ("XNamespace", "XName", GLOBAL,              CLASS)  ["id"];
test ("XNamespace", "XName", GLOBAL,              RECORD) ["id"];
test ("XNamespace", "XName", GLOBAL,              UNION)  ["id"];

test ("XNamespace", "XName", LOCALNAMESPACE,      SIMPLE) ["id"];
test ("XNamespace", "XName", LOCALNAMESPACE,      CLASS)  ["id"];
test ("XNamespace", "XName", LOCALNAMESPACE,      RECORD) ["id"];
test ("XNamespace", "XName", LOCALNAMESPACE,      UNION)  ["id"];

test ("XNamespace", "XName", LOCALINTERFACEOTHER, SIMPLE) ["id"];
test ("XNamespace", "XName", LOCALINTERFACEOTHER, CLASS)  ["id"];
test ("XNamespace", "XName", LOCALINTERFACEOTHER, RECORD) ["id"];
test ("XNamespace", "XName", LOCALINTERFACEOTHER, UNION)  ["id"];

test ("XNamespace", "XName", LOCALINTERFACESELF,  SIMPLE) ["id"];
test ("XNamespace", "XName", LOCALINTERFACESELF,  CLASS)  ["id"];
test ("XNamespace", "XName", LOCALINTERFACESELF,  RECORD) ["id"];
test ("XNamespace", "XName", LOCALINTERFACESELF,  UNION)  ["id"];
*)




fun makeErrorIRef namespace optName : interfaceref =
  let
    val errorNamespace = "GLib"
    val errorName = "Error"
    val errorScope =
      if namespace <> errorNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = errorName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val errorTy = RECORD
  in
    {
      namespace = errorNamespace,
      name      = errorName,
      scope     = errorScope,
      ty        = errorTy
    }
  end

fun makeTypeIRef namespace optName : interfaceref =
  let
    val typeNamespace = "GObject"
    val typeName = "Type"
    val typeScope =
      if namespace <> typeNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = typeName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val typeTy = SIMPLE
  in
    {
      namespace = typeNamespace,
      name      = typeName,
      scope     = typeScope,
      ty        = typeTy
    }
  end

fun makeValueIRef namespace optName : interfaceref =
  let
    val valueNamespace = "GObject"
    val valueName = "Value"
    val valueScope =
      if namespace <> valueNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = valueName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val valueTy = RECORD
  in
    {
      namespace = valueNamespace,
      name      = valueName,
      scope     = valueScope,
      ty        = valueTy
    }
  end

fun makeObjectIRef namespace optName : interfaceref =
  let
    val objectNamespace = "GObject"
    val objectName = "Object"
    val objectScope =
      if namespace <> objectNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = objectName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val objectTy = CLASS
  in
    {
      namespace = objectNamespace,
      name      = objectName,
      scope     = objectScope,
      ty        = objectTy
    }
  end

val makeInterfaceRootIRef = makeObjectIRef

fun getRootObjectIRef
  _
  namespace
  optName
  (objectInfo, objectIRef : interfaceref) =
  case ObjectInfo.getParent objectInfo of
    NONE      => objectIRef
  | SOME info =>
      let
        (* In this branch, the root is the parent or ancestor of the parent,
         * so not the same interface module.  Consequently, `scope` is never
         * `LOCALINTERFACESELF`.
         *)
        val rootInfo = Fn.iterate ObjectInfo.getParent info
        val rootObjectName = getName rootInfo
        val rootObjectNamespace = BaseInfo.getNamespace rootInfo
        val rootObjectScope =
          if rootObjectNamespace <> namespace
          then GLOBAL
          else
            case optName of
              NONE   => LOCALNAMESPACE
            | SOME _ => LOCALINTERFACEOTHER
        val rootObjectTy = CLASS
      in
        {
          namespace = rootObjectNamespace,
          name      = rootObjectName,
          scope     = rootObjectScope,
          ty        = rootObjectTy
        }
      end


fun getIRefTy info =
  case InfoType.getType info of
    InfoType.OBJECT _    => CLASS
  | InfoType.INTERFACE _ => CLASS  (* ??? *)
  | InfoType.STRUCT _    => RECORD
  | InfoType.UNION _     => UNION
  | _                    => SIMPLE

(* `updateIRefTy` is used only with GIR files *)
fun updateIRefTy ty {namespace, name, scope, ty = _} : interfaceref =
  {
    namespace = namespace,
    name      = name,
    scope     = scope,
    ty        = ty
  }



local
  val ordA = ord #"a"
  val ordZ = ord #"z"
  val l = ordZ - ordA + 1
in
  fun makeTyVar tyVarIdx : tyvar * int =
    let
      val n = tyVarIdx mod l
      val m = tyVarIdx div l
      val c = chr (ordA + n)
      val s =
        if m = 0
        then str c
        else concat [str c, Int.toString m]
      val tyVar = (false, s)
    in
      (tyVar, tyVarIdx + 1)
    end
end

fun makeVarTy tyVarIdx : ty * int =
  let
    val (tyVar, tyVarIdx') = makeTyVar tyVarIdx
  in
    (TyVar tyVar, tyVarIdx')
  end

fun makeBaseTy tyVarIdx : ty * int = (mkIdTy baseId, tyVarIdx)

fun makeTyList makeTy (nTys, tyVarIdx) =
  let
    fun aux (n, tys, tyVarIdx) =
      if n <= 0
      then (rev tys, tyVarIdx)
      else
        let
          val (ty, tyVarIdx') = makeTy tyVarIdx
        in
          aux (n - 1, ty :: tys, tyVarIdx')
        end
  in
    aux (nTys, [], tyVarIdx)
  end

(*
makeTyList makeTyVar (3, 0);
makeTyList makeTyVar (3, 52);

makeTyList makeVarTy (3, 0);
makeTyList makeVarTy (3, 52);

makeTyList makeBaseTy (3, 0);
*)


fun makeRefVarTy isElem ((nTys, longId), tyVarIdx) =
  let
    val (tys, tyVarIdx') =
      makeTyList (if isElem then makeBaseTy else makeVarTy) (nTys, tyVarIdx)
  in
    (TyRef (tys, longId), tyVarIdx')
  end

fun makeRefBaseTy (_ : bool) ((nTys, longId), tyVarIdx) =
  let
    val (tys, tyVarIdx') = makeTyList makeBaseTy (nTys, tyVarIdx)
  in
    (TyRef (tys, longId), tyVarIdx')
  end



fun makeIRefLocalTypeRef makeRefTy (iRef, tyVarIdx) =
  let
    val tyRef = (
      numInterfaceRefTyVars iRef,
      makeInterfaceRefTyLongId iRef
    )
  in
    makeRefTy (tyRef, tyVarIdx)
  end

fun makeIRefLocalTypeSpec iRef =
  let
    val tyId = makeLocalInterfaceId iRef
    val nTys = numInterfaceRefTyVars iRef
    val (tyVars, _) = makeTyList makeTyVar (nTys, 0)
  in
    mkTypeSpec ((tyVars, tyId), NONE)
  end
