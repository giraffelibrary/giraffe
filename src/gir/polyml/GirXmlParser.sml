structure GirXmlParser = struct

open ListExtras


(* --------------------------------------------------------------------------
 * Support for parsing XML
 * -------------------------------------------------------------------------- *)

(* Failures *)

exception XMLFail of HText.t list

fun xmlFail s = raise XMLFail [HText.string s]


(* Attributes *)

val getOptAttr = XML.getattr

fun getAttr attrs s =
  case getOptAttr attrs s of
    SOME x => x
  | NONE   => raise XMLFail [HText.concat ["attribute \"", s, "\" not found"]]


(* Elements
 *
 * The contents of an XML element is a list `ts` where each item is either
 * inline text or an XML element.  The items `ts` can be processed either in
 * an ordered or unordered manner depending on the how the data should be
 * interpreted.
 *
 *
 * Ordered elements
 *
 * To get an ordered list of XML elements in `ts`, use
 *
 *   List.mapPartial getElem ts
 *
 * To get the result of applying a partial function `f` to an ordered list of
 * XML elements in `ts`, use
 *
 *   List.mapPartial (getElemWith f) ts
 *
 *
 * Unordered elements
 *
 * To get elements in `ts` by element type, preserving the order for each
 * element type, use
 *
 *   val elemDict = splitElems ts
 *
 * and then lookup an element type `name` with
 *
 *   lookupElems elemDict name
 *)

val getElem =
  fn
    XML.Elem ((name, attrs), ts) => SOME (name, (attrs, ts)) 
  | XML.Text _                   => NONE

fun getElemWith f = Option.composePartial (f, getElem)

fun splitElems ts =
  let
    fun singleton x = [x]
  in
    foldl (Dict.insertMap singleton (op ::))
      Dict.empty
      (revMapPartial getElem ts)
  end

fun lookupElems elemDict name =
  case Dict.lookup elemDict name of
    SOME xs => xs
  | NONE    => []





(* parsing functions for GIR files *)


(* supporting functions *)

(*
fun readIRefName name =
  case String.fields (fn c => c = #".") name of
    [name]            => (NONE, name)
  | [namespace, name] => (SOME namespace, name)
  | _                 =>
      raise
        XMLFail [HText.string "interface reference has more than two fields"]
*)


(* parsing functions *)

open GirAbstractSyntaxTree



(* --------------------------------------------------------------------------
 * common configuration attributes
 * -------------------------------------------------------------------------- *)

fun getConfig attrs : config =
  let
    val version = getOptAttr attrs "version"
    val introspectable = getOptAttr attrs "introspectable"
    val deprecated = getOptAttr attrs "deprecated"
    val deprecatedVersion = getOptAttr attrs "deprecated-version"
  in
    {
      version           = version,
      introspectable    = introspectable,
      deprecated        = deprecated,
      deprecatedVersion = deprecatedVersion
    }
  end


(* --------------------------------------------------------------------------
 * element "docsection"
 * -------------------------------------------------------------------------- *)

fun parseDocsection (attrs, _) : docsection =
  let
    val elemName = "docsection"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
    in
      {
        name   = name,
        config = config
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "function-macro"
 * -------------------------------------------------------------------------- *)

fun parseFunctionMacro (attrs, _) : function_macro =
  let
    val elemName = "constant"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cIdentifier = getAttr attrs "c:identifier"
    in
      {
        name        = name,
        config      = config,
        cIdentifier = cIdentifier
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * elements "type", "array", "callback" and "varargs"
 * -------------------------------------------------------------------------- *)

fun parseTypeAny (name, e) : type_ =
  case name of
    "type"     => parseTypeType e
  | "array"    => parseTypeArray e
  | "callback" => parseTypeCallback e
  | _          =>
      raise XMLFail [HText.concat ["element \"", name, "\" is not a valid type"]]

and parseTypeType (attrs, ts) : type_ =
  let
    val elemName = "type"
    val name = getOptAttr attrs "name"
    val cType = getOptAttr attrs "c:type"

    val data = {name = name, cType = cType}
    val elemList = revMapPartial getElem ts
  in
    TYPENAMED (data, revMap parseTypeAny elemList)
      handle XMLFail ms =>
        raise XMLFail (
          HText.seq [
            HText.concat ["element \"", elemName, "\""],
            case name of
              SOME n => HText.concat [" with name attribute \"", n, "\""]
            | NONE   => HText.concat [" without name attribute"]
          ]
           :: ms
        )
  end

and parseTypeArray (attrs, ts) : type_ =
  let
    val elemName = "array"
    val name = getOptAttr attrs "name"
    val length = getOptAttr attrs "length"
    val fixedSize = getOptAttr attrs "fixed-size"
    val zeroTerminated = getOptAttr attrs "zero-terminated"
    val cType = getOptAttr attrs "c:type"
    val data =
      {
        name           = name,
        length         = length,
        fixedSize      = fixedSize,
        zeroTerminated = zeroTerminated,
        cType          = cType
      }
    val elemList = revMapPartial getElem ts
  in
    (
      case elemList of
        []      => xmlFail "element \"array\" cannot contain no elements"
      | e :: [] => TYPEARRAY (data, parseTypeAny e)
      | _ :: _  => xmlFail "element \"array\" cannot contain multiple elements"
    )
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\""
          ]
           :: ms
        )
  end

and parseTypeCallback (attrs, ts) : type_ =
  TYPECALLBACK (parseCallback (attrs, ts))

and parseCallback (attrs, ts) : callback =
  let
    val elemName = "callback"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cType = getOptAttr attrs "c:type"

      val elemDict = splitElems ts
      val callable = parseCallable elemDict
    in
      {
        name     = name,
        config   = config,
        cType    = cType,
        callable = callable
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end

and parseTypeVarargs _ = TYPEVARARGS

and parseType elemDict : type_ =
  case (
    lookupElems elemDict "array",
    lookupElems elemDict "type",
    lookupElems elemDict "callback",
    lookupElems elemDict "varargs"
  ) of
    ([],      e :: [], [],      [])      => parseTypeType e
  | (e :: [],      [], [],      [])      => parseTypeArray e
  | ([],      [],      e :: [], [])      => parseTypeCallback e
  | ([],      [],      [],      e :: []) => parseTypeVarargs e
  | ([],      [],      [],      [])      =>
      xmlFail "\"array\", \"type\", \"callback\" or \"varargs\" element not found"
  | ([],      _ :: _,  [],      [])      =>
      xmlFail "multiple \"type\" elements found"
  | (_ :: _,  [],      [],      [])      =>
      xmlFail "multiple \"array\" elements found"
  | ([],      [],      _ :: _,  [])      =>
      xmlFail "multiple \"callback\" elements found"
  | ([],      [],      [],      _ :: _)  =>
      xmlFail "multiple \"varargs\" elements found"
  | _                                    =>
      xmlFail "multiple \"array\", \"type\", \"callback\" \
                                                 \or \"varargs\" elements found"


(* --------------------------------------------------------------------------
 * elements "return-value" and "parameters"
 * -------------------------------------------------------------------------- *)

and parseReturnValue (attrs, ts) : return_value =
  let
    val elemName = "return-value"
  in
    let
      val transferOwnership = getOptAttr attrs "transfer-ownership"
      val nullable = getOptAttr attrs "nullable"

      val elemDict = splitElems ts
      val type_ = parseType elemDict
    in
      {
        transferOwnership = transferOwnership,
        nullable          = nullable,
        type_             = type_
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\""
          ]
           :: ms
        )
  end

and parseParameter elemName (attrs, ts) : parameter =
  let
    val name = getOptAttr attrs "name"
  in
    let
      val transferOwnership = getAttr attrs "transfer-ownership"
      val nullable = getOptAttr attrs "nullable"
      val optional = getOptAttr attrs "optional"
      val direction = getOptAttr attrs "direction"
      val callerAllocates = getOptAttr attrs "caller-allocates"
      val scope = getOptAttr attrs "scope"
      val closure = getOptAttr attrs "closure"
      val destroy = getOptAttr attrs "destroy"

      val elemDict = splitElems ts
      val type_ = parseType elemDict
    in
      {
        name              = name,
        transferOwnership = transferOwnership,
        nullable          = nullable,
        optional          = optional,
        direction         = direction,
        scope             = scope,
        callerAllocates   = callerAllocates,
        closure           = closure,
        destroy           = destroy,
        type_             = type_
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.seq [
            HText.concat ["element \"", elemName, "\""],
            case name of
              SOME n => HText.concat [" with name attribute \"", n, "\""]
            | NONE   => HText.concat [" without name attribute"]
          ]
           :: ms
        )
  end

and parseParameters (_, ts) : parameters =
  let
    val elemDict = splitElems ts

    val instance =
      case lookupElems elemDict "instance-parameter" of
        []      => NONE
      | e :: [] => SOME (parseParameter "instance-parameter" e)
      | _       => xmlFail "multiple \"instance-parameter\" elements found"

    val others =
      map (parseParameter "parameter") (lookupElems elemDict "parameter")
  in
    {
      instance = instance,
      others   = others
    }
  end

and parseCallable elemDict : callable =
  let
    val returnValue =
      case lookupElems elemDict "return-value" of
        []      => xmlFail "\"return-value\" element not found"
      | e :: [] => parseReturnValue e
      | _       => xmlFail "multiple \"return-value\" elements found"

    val emptyParameters = {instance = NONE, others = []}
    val parameters =
      case lookupElems elemDict "parameters" of
        []      => emptyParameters
      | e :: [] => parseParameters e
      | _       => xmlFail "multiple \"parameters\" elements found"
  in
    {
      returnValue = returnValue,
      parameters  = parameters
    }
  end


(* --------------------------------------------------------------------------
 * elements "constructor", "method" and "function"
 * -------------------------------------------------------------------------- *)

fun parseFunctionCommon elem (elemName, (attrs, ts)) : function =
  let
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val shadows = getOptAttr attrs "shadows"
      val shadowedBy = getOptAttr attrs "shadowed-by"
      val cIdentifier = getAttr attrs "c:identifier"
      val movedTo = getOptAttr attrs "moved-to"
      val throws = getOptAttr attrs "throws"

      val elemDict = splitElems ts
    in
      {
        elem           = elem,
        name           = name,
        config         = config,
        shadows        = shadows,
        shadowedBy     = shadowedBy,
        callable       = parseCallable elemDict,
        cIdentifier    = cIdentifier,
        movedTo        = movedTo,
        throws         = throws
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end

fun parseFunction (x as (elemName, _)) : function option =
  let
  in
    case elemName of
      "constructor" => SOME (parseFunctionCommon FECONSTRUCTOR x)
    | "function"    => SOME (parseFunctionCommon FEFUNCTION x)
    | "method"      => SOME (parseFunctionCommon FEMETHOD x)
    | _             => NONE
  end




(* --------------------------------------------------------------------------
 * element "virutal-method"
 * -------------------------------------------------------------------------- *)

fun parseVirtualMethod (attrs, ts) : virtual_method =
  let
    val elemName = "virtual-method"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val throws = getOptAttr attrs "throws"
      val invoker = getOptAttr attrs "invoker"
      val mustChainUp = getOptAttr attrs "must-chain-up"
      val override = getOptAttr attrs "override"

      val elemDict = splitElems ts
    in
      {
        name           = name,
        config         = config,
        callable       = parseCallable elemDict,
        throws         = throws,
        invoker        = invoker,
        mustChainUp    = mustChainUp,
        override       = override
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "glib:signal"
 * -------------------------------------------------------------------------- *)

fun parseSignal (attrs, ts) : signal =
  let
    val elemName = "signal"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val when = getOptAttr attrs "when"
      val noRecurse = getOptAttr attrs "no-recurse"
      val detailed = getOptAttr attrs "detailed"
      val action = getOptAttr attrs "action"
      val noHooks = getOptAttr attrs "no-hooks"
      val hasClassClosure = getOptAttr attrs "has-class-closure"

      val elemDict = splitElems ts
    in
      {
        name            = name,
        config          = config,
        when            = when,
        noRecurse       = noRecurse,
        detailed        = detailed,
        action          = action,
        noHooks         = noHooks,
        hasClassClosure = hasClassClosure,
        callable        = parseCallable elemDict
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "property"
 * -------------------------------------------------------------------------- *)

fun parseProperty (attrs, ts) : property =
  let
    val elemName = "property"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val readable = getOptAttr attrs "readable"
      val writable = getOptAttr attrs "writable"
      val construct = getOptAttr attrs "construct"
      val constructOnly = getOptAttr attrs "construct-only"
      val transferOwnership = getOptAttr attrs "transfer-ownership"

      val elemDict = splitElems ts
    in
      {
        name              = name,
        config            = config,
        readable          = readable,
        writable          = writable,
        construct         = construct,
        constructOnly     = constructOnly,
        transferOwnership = transferOwnership,
        type_             = parseType elemDict
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "field"
 * -------------------------------------------------------------------------- *)

fun parseField (attrs, ts) : field =
  let
    val elemName = "field"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val readable = getOptAttr attrs "readable"
      val writable = getOptAttr attrs "writable"
      val private = getOptAttr attrs "private"
      val bits = getOptAttr attrs "bits"

      val elemDict = splitElems ts
    in
      {
        name     = name,
        config   = config,
        readable = readable,
        writable = writable,
        private  = private,
        bits     = bits,
        type_    = parseType elemDict
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "alias"
 * -------------------------------------------------------------------------- *)

fun parseAlias (attrs, ts) : alias =
  let
    val elemName = "alias"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cType = getAttr attrs "c:type"

      val elemDict = splitElems ts
      val type_ = parseType elemDict
    in
      {
        name   = name,
        config = config,
        cType  = cType,
        type_  = type_
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "constant"
 * -------------------------------------------------------------------------- *)

fun parseConstant (attrs, ts) : constant =
  let
    val elemName = "constant"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val value = getAttr attrs "value"
      val cType = getOptAttr attrs "c:type"

      val elemDict = splitElems ts
    in
      {
        name   = name,
        config = config,
        value  = value,
        cType  = cType,
        type_  = parseType elemDict
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "class"
 * -------------------------------------------------------------------------- *)

fun parseImplements (attrs, _) : implements = getAttr attrs "name"

fun parseClass (attrs, ts) : class =
  let
    val elemName = "class"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cSymbolPrefix = getAttr attrs "c:symbol-prefix"
      val cType = getOptAttr attrs "c:type"
      val parent = getOptAttr attrs "parent"
      val typeName = getAttr attrs "glib:type-name"
      val getType = getAttr attrs "glib:get-type"
      val typeStruct = getOptAttr attrs "glib:type-struct"
      val abstract = getOptAttr attrs "abstract"
      val fundamental = getOptAttr attrs "glib:fundamental"

      val method = List.mapPartial (getElemWith parseFunction) ts

      val elemDict = splitElems ts
      val constant = map parseConstant (lookupElems elemDict "constant")
      val implements = map parseImplements (lookupElems elemDict "implements")
      val virtualMethod =
        map parseVirtualMethod (lookupElems elemDict "virtual-method")
      val property = map parseProperty (lookupElems elemDict "property")
      val field = map parseField (lookupElems elemDict "field")
      val signal = map parseSignal (lookupElems elemDict "glib:signal")
    in
      {
        name          = name,
        config        = config,
        cSymbolPrefix = cSymbolPrefix,
        cType         = cType,
        abstract      = abstract,
        fundamental   = fundamental,
        typeName      = typeName,
        getType       = getType,
        typeStruct    = typeStruct,
        parent        = parent,
        implements    = implements,
        constant      = constant,
        virtualMethod = virtualMethod,
        method        = method,
        property      = property,
        field         = field,
        signal        = signal
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "interface"
 * -------------------------------------------------------------------------- *)

fun parsePrerequisite (attrs, _) : prerequisite = getAttr attrs "name"

fun parseInterface (attrs, ts) : interface =
  let
    val elemName = "interface"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cSymbolPrefix = getAttr attrs "c:symbol-prefix"
      val cType = getOptAttr attrs "c:type"
      val typeName = getAttr attrs "glib:type-name"
      val getType = getAttr attrs "glib:get-type"
      val typeStruct = getOptAttr attrs "glib:type-struct"

      val method = List.mapPartial (getElemWith parseFunction) ts

      val elemDict = splitElems ts
      val constant = map parseConstant (lookupElems elemDict "constant")
      val prerequisite =
        map parsePrerequisite (lookupElems elemDict "prerequisite")
      val virtualMethod =
        map parseVirtualMethod (lookupElems elemDict "virtual-method")
      val property = map parseProperty (lookupElems elemDict "property")
      val signal = map parseSignal (lookupElems elemDict "glib:signal")
    in
      {
        name          = name,
        config        = config,
        cSymbolPrefix = cSymbolPrefix,
        cType         = cType,
        typeName      = typeName,
        getType       = getType,
        typeStruct    = typeStruct,
        constant      = constant,
        prerequisite  = prerequisite,
        virtualMethod = virtualMethod,
        method        = method,
        property      = property,
        signal        = signal
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "record"
 * -------------------------------------------------------------------------- *)

fun parseRecord (attrs, ts) : record =
  let
    val elemName = "record"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cSymbolPrefix = getOptAttr attrs "c:symbol-prefix"
      val cType = getOptAttr attrs "c:type"
      val disguised = getOptAttr attrs "disguised"
      val typeName = getOptAttr attrs "glib:type-name"
      val getType = getOptAttr attrs "glib:get-type"
      val isGTypeStructFor = getOptAttr attrs "glib:is-gtype-struct-for"
      val foreign = getOptAttr attrs "foreign"

      val method = List.mapPartial (getElemWith parseFunction) ts

      val elemDict = splitElems ts
      val field = map parseField (lookupElems elemDict "field")
    in
      {
        name             = name,
        config           = config,
        cSymbolPrefix    = cSymbolPrefix,
        cType            = cType,
        disguised        = disguised,
        typeName         = typeName,
        getType          = getType,
        isGTypeStructFor = isGTypeStructFor,
        foreign          = foreign,
        method           = method,
        field            = field
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "union"
 * -------------------------------------------------------------------------- *)

fun parseUnion (attrs, ts) : union =
  let
    val elemName = "union"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cSymbolPrefix = getOptAttr attrs "c:symbol-prefix"
      val cType = getOptAttr attrs "c:type"
      val typeName = getOptAttr attrs "glib:type-name"
      val getType = getOptAttr attrs "glib:get-type"

      val method = List.mapPartial (getElemWith parseFunction) ts

      val elemDict = splitElems ts
      val field = map parseField (lookupElems elemDict "field")
    in
      {
        name          = name,
        config        = config,
        cSymbolPrefix = cSymbolPrefix,
        cType         = cType,
        typeName      = typeName,
        getType       = getType,
        method        = method,
        field         = field
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "member"
 * -------------------------------------------------------------------------- *)

fun parseMember (attrs, _) : member =
  let
    val elemName = "member"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cIdentifier = getAttr attrs "c:identifier"
      val value = getAttr attrs "value"
      val nick = getOptAttr attrs "glib:nick"
    in
      {
        name        = name,
        config      = config,
        cIdentifier = cIdentifier,
        value       = value,
        nick        = nick
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * elements "bitfield" and "enumeration"
 * -------------------------------------------------------------------------- *)

fun parseEnumCommon elem (elemName, (attrs, ts)) : enum =
  let
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val config = getConfig attrs
      val cType = getAttr attrs "c:type"
      val typeName = getOptAttr attrs "glib:type-name"
      val getType = getOptAttr attrs "glib:get-type"
      val errorDomain = getOptAttr attrs "glib:error-domain"

      val method = List.mapPartial (getElemWith parseFunction) ts

      val elemDict = splitElems ts
      val member = map parseMember (lookupElems elemDict "member")
    in
      {
        elem        = elem,
        name        = name,
        config      = config,
        cType       = cType,
        typeName    = typeName,
        getType     = getType,
        errorDomain = errorDomain,
        method      = method,
        member      = member
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "namespace"
 * -------------------------------------------------------------------------- *)

fun parseNamespaceElem (x as (tagName, (tagAttrs, ts))) =
  let
  in
    case tagName of
      "alias"       =>
        {
          elem     = ALIAS (parseAlias (tagAttrs, ts)),
          data     = ()
        }
    | "class"       =>
        {
          elem     = CLASS (parseClass (tagAttrs, ts)),
          data     = ()
        }
    | "interface"   =>
        {
          elem     = INTERFACE (parseInterface (tagAttrs, ts)),
          data     = ()
        }
    | "record"      =>
        {
          elem     = RECORD (parseRecord (tagAttrs, ts)),
          data     = ()
        }
    | "union"       =>
        {
          elem     = UNION (parseUnion (tagAttrs, ts)),
          data     = ()
        }
    | "bitfield"    =>
        {
          elem     = BITFIELD (parseEnumCommon EEBITFIELD x),
          data     = ()
        }
    | "enumeration" =>
        {
          elem     = ENUMERATION (parseEnumCommon EEENUMERATION x),
          data     = ()
        }
    | "callback"    =>
        {
          elem     = CALLBACK (parseCallback (tagAttrs, ts)),
          data     = ()
        }
    | "constant"    =>
        {
          elem     = CONSTANT (parseConstant (tagAttrs, ts)),
          data     = ()
        }
    | "function"    =>
        {
          elem     = FUNCTION (parseFunctionCommon FEFUNCTION x),
          data     = ()
        }
    | "docsection"  =>
        {
          elem     = DOCSECTION (parseDocsection (tagAttrs, ts)),
          data     = ()
        }
    | "function-macro"  =>
        {
          elem     = FUNCTIONMACRO (parseFunctionMacro (tagAttrs, ts)),
          data     = ()
        }
    | _             =>
        raise XMLFail (
          [HText.concat ["unrecognized namespace element \"", tagName, "\""]]
        )
  end


fun parseNamespaceElems ts =
  let
    val revElems = revMapPartial getElem ts
  in
    revMap parseNamespaceElem revElems		
  end


fun parseNamespace (attrs, ts) : unit namespace =
  let
    val elemName = "namespace"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val version = getAttr attrs "version"
      val sharedLibrary = getOptAttr attrs "shared-library"
      val cPrefix = getAttr attrs "c:symbol-prefixes"
    in
      {
        name          = name,
        version       = version,
        sharedLibrary = sharedLibrary,
        cPrefix       = cPrefix,
        elems         = parseNamespaceElems ts
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


(* --------------------------------------------------------------------------
 * element "repository"
 * -------------------------------------------------------------------------- *)

fun parseInclude (attrs, _) : {name : string, version : string} =
  let
    val elemName = "include"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    let
      val version = getAttr attrs "version"
    in
      {
        name = name,
        version = version
      }
    end
      handle XMLFail ms =>
        raise XMLFail (
          HText.concat [
            "element \"", elemName, "\" with name attribute \"", name, "\""
          ]
           :: ms
        )
  end


fun parsePackage (attrs, _) : string =
  let
    val elemName = "package"
    val name =
      getAttr attrs "name"
        handle XMLFail ms =>
          raise XMLFail (
            HText.concat ["element \"", elemName, "\""]
             :: ms
          )
  in
    name
  end


fun parseRepo (attrs, ts) : (unit, unit) repository =
  let
    val version = getAttr attrs "version"

    val elemDict = splitElems ts
    val includes = map parseInclude (lookupElems elemDict "include")
    val packages = map parsePackage (lookupElems elemDict "package")
    val namespace =
      case lookupElems elemDict "namespace" of
        []  => raise XMLFail [HText.string "namespace element not found"]
      | [x] => parseNamespace x
      | _   => raise XMLFail [HText.string "multiple namespace elements found"]
  in
    {
      version   = version,
      includes  = includes,
      packages  = packages,
      namespace = namespace,
      data      = ()
    }
  end
    handle XMLFail ms =>
      raise XMLFail (
        HText.concat [
          "element \"repository\""
        ]
         :: ms
      )


fun parseTree tree =
  (
    case tree of
      XML.Elem (("repository", attrs), ts) => parseRepo (attrs, ts)
    | _                                    =>
        raise XMLFail [HText.string "not a respoitory element"]
  )
    handle
      XMLFail ms => (
        app (fn ss => (app print ss; print "\n")) (map HText.toStrings ms);
        raise Fail "XML parsing error"
      )

end (* of structure GirXmlParser *)



(*

(* Test examples *)

val dir = "/opt/gobject-introspection/gobject-introspection-1.32.1/share/gir-1.0/"
fun joinDir file = OS.Path.joinDirFile {dir = dir, file = file}

val tree1 = XML.parsefile (joinDir "GLib-2.0.gir");
val tree2 = XML.parsefile (joinDir "GObject-2.0.gir");
val tree3 = XML.parsefile (joinDir "Gio-2.0.gir");

GirXmlParser.parseTree tree1;
GirXmlParser.parseTree tree2;
GirXmlParser.parseTree tree3;


val tree1 = XML.parsefile "/opt/gtk+/gtk+-3.4.1/share/gir-1.0/Gdk-3.0.gir";
val tree2 = XML.parsefile "/opt/gtk+/gtk+-3.4.1/share/gir-1.0/GdkX11-3.0.gir";
val tree3 = XML.parsefile "/opt/gtk+/gtk+-3.4.1/share/gir-1.0/Gtk-3.0.gir";

GirXmlParser.parseTree tree1;
GirXmlParser.parseTree tree2;
GirXmlParser.parseTree tree3;


*)
