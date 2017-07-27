structure GirTranslator = struct

open ListExtras
open GirAbstractSyntaxTree


(* Translation
 *
 * Translation is performed on a per-namespace basis.  Translation of a
 * namespace generates an `Info.repodata` structure.
 *
 * In a namespace, type elements can refer to top-level elements of included
 * namespaces and of the namespace itself.  The translation algorithm
 * resolves all references, capturing the references (using ref types) in the
 * `Info.repodata` structure that is generated.
 * 
 * The translation is performed in a number of passes.
 * 
 * Pass 1
 * 
 * Initialize `Info.basedata` structures for top-level elements with instance
 *   - `Info.INVALID`, if not introspectable
 *   - `Info.UNTRANSLATED`, otherwise
 * Add these `Info.basedata` structures for top-level elements, with the
 * exception of CONSTANT and FUNCTION elements, to the local type dictionary.
 * CONSTANT and FUNCTION are the only top-level elements that cannot be used
 * as types.
 *
 * Pass 2
 *
 * Translate each top-level element.  If the instance of the `Info.basedata`
 * of the top-level element is not `Info.UNTRANSLATED`, then do nothing:
 * either it is `Info.TRANSLATING` and we are already in the process of
 * translating this element, it is `Info.INVALID` and the element is not
 * introspectable or it is the instance of the translated element.
 * Otherwise, change `Info.UNTRANSLATED` to `Info.TRANSLATING` and translate
 * the element.  When translating the element, lookup any type references
 * using the dictionary.  When a type reference has been looked up, translate
 * the `Info.basedata` of the looked-up top-level element recursively, as
 * described for pass 2.
 *
 * When the `Info.basedata` returned by looking up a type reference has
 * instance `Info.INVALID`, translation of the element that depends on the
 * type should fail.  In the case that this is a top-level element, the
 * instance should be set to `Info.INVALID`.  It is important for the top-
 * level entry to remain present so that invalid type reference can be
 * distinguished from references to non-introspectable elements.  In the case
 * of a non-top-level element, translation simply omits the element.
 *
 * Pass 3
 *
 * Remove any top-level namespace elements whose `Info.basedata` instance is
 * `Info.INVALID`.  If any are `Info.UNTRANSLATED` or `Info.TRANSLATING`, an
 * internal error has occured.
 *)


(* Failures *)

exception NotIntrospectable

exception GIRFail of HText.t list

fun girFail s = raise GIRFail [HText.string s]

val fmtString = String.toString
fun fmtQuoted s = ["\"", fmtString s, "\""]
val fmtOptQuoted =
  fn
    NONE   => ["<no name>"]
  | SOME s => fmtQuoted s


(* Environment lookup *)

fun lookupElem elemDicts s =
  let
    val (namespace, name) =
      case String.fields (fn c => c = #".") s of
        [namespace, name] => (namespace, name)
      | _                 => ("",        s)

    val elemDict =
      case ListDict.lookup elemDicts namespace of
        SOME elemDict => elemDict
      | NONE          =>
          raise
            GIRFail [
              HText.seq [
                HText.string "reference to namespace ",
                HText.concat (fmtQuoted namespace),
                HText.string " that is not included"
              ]
            ]
  in
    case Dict.lookup elemDict name of
      SOME (x as ((_, optInterface), _)) => (
        case optInterface of
          SOME baseData => (
            case baseData of
              Info.BASE (ref {instance = Info.INVALID, ...})        =>
                raise NotIntrospectable
            | _                                                     => x
          )
        | NONE          => x
      )
    | NONE                               =>
        raise
          GIRFail [
            HText.seq [
              HText.string "element ",
              HText.concat (fmtQuoted name),
              HText.string " not found in ",
              case namespace of
                "" => HText.string "same namespace"
              | _  => HText.concat ("namespace " :: fmtQuoted namespace)
            ]
          ]
  end



(* --------------------------------------------------------------------------
 * Common value literals
 * -------------------------------------------------------------------------- *)

val makeValueBool : string -> bool =
  fn
    "0" => false
  | "1" => true
  | s   =>
      raise GIRFail (
        [
          HText.concat [
            "value \"", fmtString s, "\" not a valid boolean value"
          ]
        ]
      )

local
  fun fail s =
    raise Fail (String.concat ["\"", s, "\" is not a valid signed integer"])
  val ord0 = Char.ord #"0"
  fun nextDigit (c, n) = 10 * n + (Char.ord c - ord0)
in
  fun makeValueInt (s : string) : LargeInt.int =
    let
      val ss'0 = Substring.full s
      val (sign, ss'1) =
        case Substring.getc ss'0 of
          SOME (#"-", ss'1) => (~1, ss'1)
        | SOME _            => (1, ss'0)
        | NONE              => fail s
    in
      if CharVectorSlice.all Char.isDigit ss'1
      then
        sign * Substring.foldl nextDigit 0 ss'1
      else
        fail s
    end
end

fun makeValueUtf8 (s : string) : string = s  (* should validate UTF8 *)

local
  fun fail s =
    raise
      Fail (String.concat ["\"", s, "\" is not a valid floating point literal"])
  val ord0 = Char.ord #"0"
  fun nextDigit (c, n) = 10 * n + (Char.ord c - ord0)
in
  fun makeValueReal (s : string)
    : LargeInt.int * LargeInt.int * LargeInt.int option =
    let
      fun readSign ss =
        case Substring.getc ss of
          SOME (#"-", ss'1) => (~ 1, ss'1)
        | _                 => (1, ss)

      fun readDigits m ss =
        let
          val (ss'1, ss'2) = Substring.splitl Char.isDigit ss
        in
          case Substring.size ss'1 of
            0 => fail s
          | n => ((Substring.foldl nextDigit m ss'1, ss'2), n)
        end

      val ss'0 = Substring.full s
      val (sign, ss'1) = readSign ss'0
      val ((m'1, ss'2), _) = readDigits 0 ss'1
      val ((m'2, ss'3), p) =
        case Substring.getc ss'2 of
          SOME (#".", ss') => readDigits m'1 ss'
        | _                => ((m'1, ss'2), 0)
      val m = sign * m'2

      fun readExp ss =
        let
          val (sign, ss'1) = readSign ss
          val ((n, ss'2), _) = readDigits 0 ss'1
        in
          (SOME (sign * n), ss'2)
        end
      val (optE, ss'4) =
        case Substring.getc ss'3 of
          SOME (#"e", ss') => readExp ss'
        | SOME (#"E", ss') => readExp ss'
        | _                => (NONE, ss'3)
    in
      case Substring.getc ss'4 of
        SOME _ => fail s
      | NONE   => (m, p, optE)
    end
end

local
  open GIRepositoryTypeTag
in
  fun makeValue (tag : t) (value : string)
    : GIRepositoryArgument.t =
    case tag of
      BOOLEAN => GIRepositoryArgument.BOOLEAN (makeValueBool value)
    | INT     => GIRepositoryArgument.INT (makeValueInt value)
    | FLOAT   => GIRepositoryArgument.FLOAT (makeValueReal value)
    | DOUBLE  => GIRepositoryArgument.DOUBLE (makeValueReal value)
    | UTF8    => GIRepositoryArgument.UTF8 (makeValueUtf8 value)
    | _                    =>
        raise GIRFail (
          [HText.concat ["literal of type ", toString tag, " not supported"]]
        )
end

fun makeTransferOwnership (s : string) : GIRepositoryTransfer.t =
  case s of
    "none"      => GIRepositoryTransfer.NOTHING
  | "full"      => GIRepositoryTransfer.EVERYTHING
  | "container" => GIRepositoryTransfer.CONTAINER
  | _           => 
      raise GIRFail (
        [HText.concat ["transfer-ownership \"", s, "\" invalid"]]
      )

fun makeDirection (s : string) : GIRepositoryDirection.t =
  case s of
    "in"    => GIRepositoryDirection.IN
  | "out"   => GIRepositoryDirection.OUT
  | "inout" => GIRepositoryDirection.INOUT
  | _       => 
      raise GIRFail (
        [HText.concat ["direction \"", s, "\" invalid"]]
      )

fun makeScopeType (s : string) : GIRepositoryScopeType.t =
  case s of
    "call"     => GIRepositoryScopeType.CALL
  | "async"    => GIRepositoryScopeType.ASYNC
  | "notified" => GIRepositoryScopeType.NOTIFIED
  | _          => 
      raise GIRFail (
        [HText.concat ["scope \"", s, "\" invalid"]]
      )


fun withDefault default f =
  fn
    SOME s => f s
  | NONE   => default


local
  open GIRepositoryVFuncInfoFlags
in
  fun makeVFuncOverride (s : string) : t =
    case s of
      "always" => MUST_OVERRIDE
    | "never"  => MUST_NOT_OVERRIDE
    | _        =>
        raise GIRFail (
          [HText.concat ["override=\"", s, "\" invalid"]]
        )
end

fun makeSignalRun (s : string) : GObjectSignalFlags.t =
  case s of
    "first"   => GObjectSignalFlags.RUN_FIRST
  | "last"    => GObjectSignalFlags.RUN_LAST
  | "cleanup" => GObjectSignalFlags.RUN_CLEANUP
  | _         => 
      raise GIRFail (
        [HText.concat ["when=\"", s, "\" invalid"]]
      )



(* --------------------------------------------------------------------------
 * Common configuration attributes
 * -------------------------------------------------------------------------- *)

fun makeBaseDataConfig (config : config) =
  let
    val introspectable =
      withDefault true makeValueBool (#introspectable config)
        handle
          GIRFail ms =>
            raise GIRFail (HText.concat ("attribute " :: fmtQuoted "introspectable") :: ms)

    val deprecated = isSome (#deprecated config)  (* can't fail *)
  in
    {
      introspectable = introspectable,
      deprecated     = deprecated,
      attributes     = ListDict.empty      
    }
  end



(* --------------------------------------------------------------------------
 * Support for making and updating `Info.basedata` structures
 *
 * A function `makeInstance` is passed to `makeConfigElemBaseData` so that it
 * is evaluated only if the element is introspectable.  If the element is not
 * introspectable, `handleError` is called with the `data` value
 * `UNTRANSLATED`.  `handleError` can cause `NONE` to be returned by raising
 * `NotIntrospectable` for elements that can be skipped during translation.
 * -------------------------------------------------------------------------- *)

fun makeElemBaseData container makeInstance con typelib name x
  : Info.basedata =
  let
    (* Create a reference to a dummy value so that `makeInstance` can be
     * given the `basedata` value for itself.  `makeInstance` requires this
     * to use as the container for `basedata` values that it generates.
     *)
    val refData =
      ref {
        name       = NONE,
        container  = NONE,
        typelib    = typelib,
        deprecated = false,
        attributes = ListDict.empty,
        instance   = Info.INVALID
      }
    val baseData = Info.BASE refData

    val instance = makeInstance con baseData typelib x
  in
    refData := {
      name       = name,
      container  = container,
      typelib    = typelib,
      deprecated = false,
      attributes = ListDict.empty,
      instance   = instance
    };
    baseData
  end

fun makeConfigElemBaseData
  elemName
  handleError
  container
  makeInstance
  con
  typelib
  name
  config
  x
  : Info.basedata option =
  let
    val {introspectable, deprecated, attributes} =
      makeBaseDataConfig config
        handle
          GIRFail ms =>
            raise
              GIRFail (HText.concat (elemName :: " " :: fmtOptQuoted name) :: ms)

    (* Create a reference to a dummy value so that `makeInstance` can be
     * given the `basedata` value for itself.  `makeInstance` requires this
     * to use as the container for `basedata` values that it generates.
     *)
    val refData =
      ref {
        name       = NONE,
        container  = NONE,
        typelib    = typelib,
        deprecated = false,
        attributes = ListDict.empty,
        instance   = Info.INVALID
      }
    val baseData = Info.BASE refData

    val instance =
      if introspectable
      then makeInstance con baseData typelib x
      else handleError Info.INVALID
  in
    refData := {
      name       = name,
      container  = container,
      typelib    = typelib,
      deprecated = deprecated,
      attributes = attributes,
      instance   = instance
    };
    SOME baseData
  end
    handle
      NotIntrospectable => NONE

fun ni _ = raise NotIntrospectable

fun updateElemBaseData makeInstance con x baseData : unit =
  let
    val Info.BASE refData = baseData
    val
      ref {name, container, typelib, deprecated, attributes, instance} =
      refData
  in
    case instance of
      Info.UNTRANSLATED =>
        let
          val () =
            refData :=
              {
                name       = name,
                container  = container,
                typelib    = typelib,
                deprecated = deprecated,
                attributes = attributes,
                instance   = Info.TRANSLATING
              }

          val instance =
            makeInstance con baseData typelib x
              handle
                NotIntrospectable => Info.INVALID
        in
          refData :=
            {
              name       = name,
              container  = container,
              typelib    = typelib,
              deprecated = deprecated,
              attributes = attributes,
              instance   = instance
            }
        end
    | _                 => ()
  end

fun makeUntranslated _ _ _ _ = Info.UNTRANSLATED



(* --------------------------------------------------------------------------
 * element "type"
 * -------------------------------------------------------------------------- *)

fun dropStarR (ss'0 : substring) : substring option =
  let
    open Substring
    val ss'1 = dropr Char.isSpace ss'0
    val last = size ss'1 - 1
  in
    if sub (ss'1, last) = #"*"
    then
      SOME (slice (ss'1, 0, SOME last))
    else
      NONE
  end
    handle Subscript => NONE

fun getCTypePtrDepth cTypeStr =
  let
    fun getNext n ss =
      case dropStarR ss of
        SOME ss' => getNext (n + 1) ss'
      | NONE     => n
  in
    case cTypeStr of
      "gpointer"      => 1
    | "gconstpointer" => 1
    | _               => getNext 0 (Substring.full cTypeStr)
  end

fun makeType name con _ _ typeData =
  let
  in
    con (typeData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("type" :: " " :: fmtOptQuoted name) :: ms)

and makeTypeBaseData containerData typelib name (typeData as Info.TYPEDATA {tag, interface, ...}) =
  (
    (tag, interface),
    makeElemBaseData (SOME containerData) (makeType name) Info.TYPE typelib name typeData
  )


(* `lookupType` returns the tag, in addition to the base info, for use in
 * `makeConstant`.
 *)

and lookupType elemDicts name
  : (GIRepositoryTypeTag.t * Info.basedata option) * int option =
  let
  in
    case name of
      SOME s => lookupElem elemDicts s
    | NONE   => raise GIRFail [HText.string "type has no name"]
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("type" :: " " :: fmtOptQuoted name) :: ms)


and arrayTypeBaseData containerData elemDicts typelib (arrayType, param) =
  let
    val tag = GIRepositoryTypeTag.ARRAY
    val interface = NONE

    val params = [#2 (lookupTypeBaseData containerData elemDicts typelib param)]

    val cTypePtrDepth = Option.map getCTypePtrDepth (#cType arrayType)

    val arrayLength = 
      Option.map makeValueInt (#length arrayType)
        handle
          GIRFail ms =>
            raise
              GIRFail (HText.concat ("attribute" :: " " :: fmtQuoted "length") :: ms)

    val arrayFixedSize = 
      Option.map makeValueInt (#fixedSize arrayType)
        handle
          GIRFail ms =>
            raise
              GIRFail (HText.concat ("attribute" :: " " :: fmtQuoted "fixed-size") :: ms)

    val arrayZeroTerminated =
      withDefault (arrayLength = NONE andalso arrayFixedSize = NONE)
        makeValueBool
        (#zeroTerminated arrayType)
        handle
          GIRFail ms =>
            raise
              GIRFail (HText.concat ("attribute" :: " " :: fmtQuoted "zero-terminated") :: ms)

    val arrayType =
      SOME (
        case #name arrayType of
          SOME "GLib.Array"     => GIRepositoryArrayType.ARRAY
        | SOME "GLib.ByteArray" => GIRepositoryArrayType.BYTE_ARRAY
        | SOME "GLib.PtrArray"  => GIRepositoryArrayType.PTR_ARRAY
        | _                     => GIRepositoryArrayType.C
      )

    val typeData =
      Info.TYPEDATA
        {
          tag                 = tag,
          interface           = interface,
          params              = params,
          ptrDepth            = cTypePtrDepth,
          arrayLength         = arrayLength,
          arrayFixedSize      = arrayFixedSize,
          arrayZeroTerminated = arrayZeroTerminated,
          arrayType           = arrayType
        }
  in
    makeTypeBaseData containerData typelib NONE typeData
  end

and namedTypeBaseData containerData elemDicts typelib (namedType, params) =
  let
    val {name, cType} = namedType
    val ((tag, interface), typePtrDepth) = lookupType elemDicts name
    val params =
      List.map (#2 o lookupTypeBaseData containerData elemDicts typelib) params

    (* `typePtrDepth` is `NONE` iff `tag` is `INTERFACE` and the type of
     * `interface` is `ALIAS _`.  
     *)
    val ptrDepth =
      let
        val cTypePtrDepth = Option.map getCTypePtrDepth cType
      in
        case (cTypePtrDepth, typePtrDepth) of
          (SOME d1, SOME d2) => SOME (d1 + d2)
        | (SOME _,  NONE)    => cTypePtrDepth  (* for ALIAS, just the C type pointer depth *)
        | (NONE,    _)       => typePtrDepth
      end

    val typeData =
      Info.TYPEDATA
        {
          tag                 = tag,
          interface           = interface,
          params              = params,
          ptrDepth            = ptrDepth,
          arrayLength         = NONE,
          arrayFixedSize      = NONE,
          arrayZeroTerminated = false,
          arrayType           = NONE
        }
  in
    makeTypeBaseData containerData typelib NONE typeData
  end

and callbackTypeBaseData containerData elemDicts typelib callback =
  let
    val tag = GIRepositoryTypeTag.INTERFACE
    val interface =
      makeCallbackBaseData containerData elemDicts Info.CALLBACK typelib callback
    (* Note that `interface` is not the result of looking up a namespace element *
     * because the callback type is inline.                                      *)

    val typeData =
      Info.TYPEDATA
        {
          tag                 = tag,
          interface           = interface,
          params              = [],
          ptrDepth            = SOME 0  (* !!!! check !!!! *),
          arrayLength         = NONE,
          arrayFixedSize      = NONE,
          arrayZeroTerminated = false,
          arrayType           = NONE
        }
  in
    makeTypeBaseData containerData typelib NONE typeData
  end

and lookupTypeBaseData containerData elemDicts typelib =
  fn
    TYPEARRAY x    => arrayTypeBaseData containerData elemDicts typelib x
  | TYPENAMED x    => namedTypeBaseData containerData elemDicts typelib x
  | TYPECALLBACK x => callbackTypeBaseData containerData elemDicts typelib x
  | TYPEVARARGS    => raise Fail "type varargs not supported"



(* --------------------------------------------------------------------------
 * element "return-value"
 * -------------------------------------------------------------------------- *)

and makeReturnValue container elemDicts typelib {type_, transferOwnership} =
  let
    val (_, type_) = lookupTypeBaseData container elemDicts typelib type_
    val transferOwnership =
      withDefault GIRepositoryTransfer.EVERYTHING makeTransferOwnership
        transferOwnership
  in
    {
      type_             = type_,
      transferOwnership = transferOwnership
    }
  end
    handle
      GIRFail ms => raise GIRFail (HText.string "return-value" :: ms)



(* --------------------------------------------------------------------------
 * element "parameter"
 * -------------------------------------------------------------------------- *)

and makeParameter
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      transferOwnership,
      allowNone,
      direction,
      callerAllocates,
      scope,
      closure,
      destroy,
      type_
    } : parameter
  ) =
  let
    val transferOwnership = makeTransferOwnership transferOwnership
    val allowNone = withDefault false makeValueBool allowNone
    val direction = withDefault GIRepositoryDirection.IN makeDirection direction
    val callerAllocates = withDefault false makeValueBool callerAllocates
    val scope = withDefault GIRepositoryScopeType.INVALID makeScopeType scope
    val closure = Option.map makeValueInt closure
    val destroy = Option.map makeValueInt destroy
    val (_, type_) = lookupTypeBaseData baseData elemDicts typelib type_
    val argData =
      {
        transferOwnership = transferOwnership,
        allowNone         = allowNone,
        direction         = direction,
        callerAllocates   = callerAllocates,
        scope             = scope,
        closure           = closure,
        destroy           = destroy,
        type_             = type_
      }
  in
     con (argData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("parameter" :: " " :: fmtOptQuoted name) :: ms)

and makeParameterBaseData containerData elemDicts con typelib (x as {name, ...} : parameter) =
  makeElemBaseData (SOME containerData) (makeParameter elemDicts) con typelib name x



(* --------------------------------------------------------------------------
 * element "constructor", "method", "virtual-method", "function"
 * -------------------------------------------------------------------------- *)

and makeCallableData containerData elemDicts typelib {returnValue, parameter}
  : Info.callabledata =
  let
    val returnValue =
      makeReturnValue containerData elemDicts typelib returnValue

    val parameter =
      List.map
        (makeParameterBaseData containerData elemDicts Info.ARG typelib)
        parameter
        handle
          GIRFail ms => raise GIRFail (HText.string "parameters" :: ms)
  in
    {
      returnValue = returnValue,
      parameter   = parameter
    }
  end



(* --------------------------------------------------------------------------
 * namespace element "callback"
 * -------------------------------------------------------------------------- *)

and makeCallback
  elemDicts
  con
  baseData (* self reference *)
  typelib
  ({name, callable, ...} : callback) =
  let
    val callableData = makeCallableData baseData elemDicts typelib callable
  in
     con (callableData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("callback" :: " " :: fmtQuoted name) :: ms)

and makeCallbackBaseData containerData elemDicts con typelib
  (x as {name, config, ...} : callback) =
  makeConfigElemBaseData "callback" ni
    (SOME containerData)
    (makeCallback elemDicts)
    con
    typelib
    (SOME name)
    config
    x

and initCallbackBaseData typelib (x as {name, config, ...} : callback) =
  makeConfigElemBaseData "callback" I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateCallbackBaseData elemDicts con (x : callback) baseData =
  updateElemBaseData (makeCallback elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * namespace element "function"
 * -------------------------------------------------------------------------- *)

and getFunctionElemName functionElem =
  case functionElem of
    FECONSTRUCTOR => "constructor"
  | FEFUNCTION    => "function"
  | FEMETHOD      => "method"

and makeFunction
  elemDicts
  con
  baseData  (* self reference *)
  typelib
  ({elem, name, config = _, callable, cIdentifier, movedTo, throws} : function) =
  let
    val flags'0 =
      let
        open GIRepositoryFunctionInfoFlags
      in
        case elem of
          FECONSTRUCTOR => IS_CONSTRUCTOR
        | FEFUNCTION    => flags []
        | FEMETHOD      => IS_METHOD
      end

    val flags' =
      if
        withDefault false makeValueBool throws
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "throws") :: ms)
      then
        GIRepositoryFunctionInfoFlags.flags
          [flags'0, GIRepositoryFunctionInfoFlags.THROWS]
      else flags'0

    val functionData : Info.functiondata =
      {
        symbol  = cIdentifier,
        movedTo = movedTo,
        flags   = flags'
      }
    val callableData = makeCallableData baseData elemDicts typelib callable
  in
    con (callableData & (functionData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat (getFunctionElemName elem :: " " :: fmtQuoted name) :: ms)

and makeFunctionBaseData containerData elemDicts con typelib (x as {elem, name, config, ...} : function) =
  makeConfigElemBaseData (getFunctionElemName elem) ni
    (SOME containerData)
    (makeFunction elemDicts)
    con
    typelib
    (SOME name)
    config
    x

and initFunctionBaseData typelib (x as {elem, name, config, ...} : function) =
  makeConfigElemBaseData (getFunctionElemName elem) I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateFunctionBaseData elemDicts con (x : function) baseData =
  updateElemBaseData (makeFunction elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * element "virtual-method"
 * -------------------------------------------------------------------------- *)

and makeVFunc
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      config = _,
      callable,
      throws,
      invoker = _,
      mustChainUp,
      override
    } : virtual_method
  ) =
  let
    val flags'0 = GIRepositoryVFuncInfoFlags.flags []
    val flags'1 =
      if
        withDefault false makeValueBool throws
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "throws") :: ms)
      then
        GIRepositoryVFuncInfoFlags.flags [flags'0, GIRepositoryVFuncInfoFlags.THROWS]
      else flags'0

    val flags'2 =
      if
        withDefault false makeValueBool mustChainUp
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "must-chain-up") :: ms)
      then
        GIRepositoryVFuncInfoFlags.flags [flags'1, GIRepositoryVFuncInfoFlags.MUST_CHAIN_UP]
      else flags'1

    val flags =
      GIRepositoryVFuncInfoFlags.flags [
        flags'2,
        withDefault (GIRepositoryVFuncInfoFlags.flags []) makeVFuncOverride override
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "override") :: ms)
      ]

    val vfuncData : Info.vfuncdata =
      {
        flags = flags
      }
    val callableData = makeCallableData baseData elemDicts typelib callable
  in
    con (callableData & (vfuncData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("virtual-method" :: " " :: fmtQuoted name) :: ms)

and makeVFuncBaseData containerData elemDicts con typelib (x as {name, config, ...} : virtual_method) =
  makeConfigElemBaseData "virtual-method" ni
    (SOME containerData)
    (makeVFunc elemDicts)
    con
    typelib
    (SOME name)
    config
    x



(* --------------------------------------------------------------------------
 * element "signal"
 * -------------------------------------------------------------------------- *)

and makeSignal
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      callable,
      when,
      noRecurse,
      detailed,
      action,
      noHooks,
      hasClassClosure,
      ...
    } : signal
  ) =
  let
    val flags'0 = GObjectSignalFlags.flags []
    val flags'1 =
      GObjectSignalFlags.flags [
        flags'0,
        withDefault (GObjectSignalFlags.flags []) makeSignalRun when
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "when") :: ms)
      ]

    val flags'2 =
      if
        withDefault false makeValueBool noRecurse
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "no-recurse") :: ms)
      then GObjectSignalFlags.flags [flags'1, GObjectSignalFlags.NO_RECURSE]
      else flags'1

    val flags'3 =
      if
        withDefault false makeValueBool detailed
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "detailed") :: ms)
      then GObjectSignalFlags.flags [flags'2, GObjectSignalFlags.DETAILED]
      else flags'2

    val flags'4 =
      if
        withDefault false makeValueBool action
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "action") :: ms)
      then GObjectSignalFlags.flags [flags'3, GObjectSignalFlags.ACTION]
      else flags'3

    val flags'5 =
      if
        withDefault false makeValueBool noHooks
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "no-hooks") :: ms)
      then GObjectSignalFlags.flags [flags'4, GObjectSignalFlags.NO_HOOKS]
      else flags'4

    val hasClassClosure =
      withDefault false makeValueBool hasClassClosure
        handle
          GIRFail ms =>
            raise GIRFail (HText.concat ("attribute " :: fmtQuoted "has-class-closure") :: ms)

    val signalData : Info.signaldata =
      {
        flags           = flags'5,
        hasClassClosure = hasClassClosure
      }
    val callableData = makeCallableData baseData elemDicts typelib callable
  in
    con (callableData & (signalData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("signal" :: " " :: fmtQuoted name) :: ms)

and makeSignalBaseData containerData elemDicts con typelib (x as {name, config, ...} : signal) =
  makeConfigElemBaseData "signal" ni
    (SOME containerData)
    (makeSignal elemDicts)
    con
    typelib
    (SOME name)
    config
    x



(* --------------------------------------------------------------------------
 * element "property"
 * -------------------------------------------------------------------------- *)

and makeProperty
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      readable,
      writable,
      construct,
      constructOnly,
      transferOwnership,
      type_,
      ...
    }
      : property
  ) =
  let
    val flags'0 = GObjectParamFlags.flags []
    val flags'1 =
      if
        withDefault true makeValueBool readable
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "readable") :: ms)
      then GObjectParamFlags.flags [flags'0, GObjectParamFlags.READABLE]
      else flags'0

    val flags'2 =
      if
        withDefault false makeValueBool writable
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "writable") :: ms)
      then GObjectParamFlags.flags [flags'1, GObjectParamFlags.WRITABLE]
      else flags'1

    val flags'3 =
      if
        withDefault false makeValueBool construct
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "construct") :: ms)
      then GObjectParamFlags.flags [flags'2, GObjectParamFlags.CONSTRUCT]
      else flags'2

    val flags'4 =
      if
        withDefault false makeValueBool constructOnly
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "construct-only") :: ms)
      then GObjectParamFlags.flags [flags'3, GObjectParamFlags.CONSTRUCT_ONLY]
      else flags'3

    val transferOwnership =
      withDefault GIRepositoryTransfer.EVERYTHING makeTransferOwnership
        transferOwnership
    val (_, type_) = lookupTypeBaseData baseData elemDicts typelib type_

    val propertyData : Info.propertydata =
      {
        flags             = flags'4,
        transferOwnership = transferOwnership,
        type_             = type_
      }
  in
    con (propertyData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("property" :: " " :: fmtQuoted name) :: ms)

and makePropertyBaseData containerData elemDicts con typelib (x as {name, config, ...} : property) =
  makeConfigElemBaseData "property" ni
    (SOME containerData)
    (makeProperty elemDicts)
    con
    typelib
    (SOME name)
    config
    x



(* --------------------------------------------------------------------------
 * element "field"
 * -------------------------------------------------------------------------- *)

and makeField
  elemDicts
  con
  baseData (* self reference *)
  typelib
  ({name, readable, writable, private = _, type_, ...} : field) =
  let
    val flags'0 = GIRepositoryFieldInfoFlags.flags []
    val flags'1 =
      if
        withDefault true makeValueBool readable
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "readable") :: ms)
      then GIRepositoryFieldInfoFlags.flags [flags'0, GIRepositoryFieldInfoFlags.READABLE]
      else flags'0

    val flags =
      if
        withDefault false makeValueBool writable
          handle
            GIRFail ms =>
              raise GIRFail (HText.concat ("attribute " :: fmtQuoted "writable") :: ms)
      then GIRepositoryFieldInfoFlags.flags [flags'1, GIRepositoryFieldInfoFlags.WRITABLE]
      else flags'1

    val (_, type_) = lookupTypeBaseData baseData elemDicts typelib type_
    val fieldData : Info.fielddata =
      {
        flags = flags,
        type_ = type_
      }
  in
    con (fieldData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("field" :: " " :: fmtQuoted name) :: ms)

and makeFieldBaseData containerData elemDicts con typelib (x as {name, config, ...} : field) =
  makeConfigElemBaseData "field" ni
    (SOME containerData)
    (makeField elemDicts)
    con
    typelib
    (SOME name)
    config
    x



(* --------------------------------------------------------------------------
 * namespace element "alias"
 * -------------------------------------------------------------------------- *)

and makeAlias
  elemDicts
  con
  baseData (* self reference *)
  typelib
  ({name, type_, ...} : alias) =
  let
    val (_, type_) = lookupTypeBaseData baseData elemDicts typelib type_
    val aliasData =
      {
        type_ = type_
      }
  in
    con (aliasData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("alias" :: " " :: fmtQuoted name) :: ms)

and initAliasBaseData typelib (x as {name, config, ...} : alias) =
  makeConfigElemBaseData "alias" I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateAliasBaseData elemDicts con (x : alias) baseData =
  updateElemBaseData (makeAlias elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * namespace element "constant"
 * -------------------------------------------------------------------------- *)

and makeConstant
  elemDicts
  con
  baseData (* self reference *)
  typelib
  ({name, value, type_, ...} : constant) =
  let
    val ((tag, _), type_) = lookupTypeBaseData baseData elemDicts typelib type_

    val constantData : Info.constantdata =
      {
        type_ = type_,
        value = makeValue tag value
      }
  in
    con (constantData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("constant" :: " " :: fmtQuoted name) :: ms)

and makeConstantBaseData containerData elemDicts con typelib
  (x as {name, config, ...} : constant) =
  makeConfigElemBaseData "constant" ni
    (SOME containerData)
    (makeConstant elemDicts)
    con
    typelib
    (SOME name)
    config
    x

and initConstantBaseData typelib (x as {name, config, ...} : constant) =
  makeConfigElemBaseData "constant" I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateConstantBaseData elemDicts con (x : constant) baseData =
  updateElemBaseData (makeConstant elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * namespace element "class"
 * -------------------------------------------------------------------------- *)

and lookupBase elemDicts name : Info.basedata =
  (valOf o #2 o #1) (lookupElem elemDicts name)

and makeClass
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      parent,
      abstract,
      fundamental,
      typeName,
      getType,
      typeStruct,
      implements,
      constant,
      virtualMethod,
      method,
      signal,
      property,
      field,
      ...
    } : class
  ) =
  let
    val abstract = withDefault false makeValueBool abstract
    val fundamental = withDefault false makeValueBool fundamental

    val classStruct = Option.map (lookupBase elemDicts) typeStruct

    val parent = Option.map (lookupBase elemDicts) parent
    val implements = List.map (lookupBase elemDicts) implements

    val constant = 
      List.mapPartial
        (makeConstantBaseData baseData elemDicts Info.CONSTANT typelib) constant

    val vfunc =
      List.mapPartial
        (makeVFuncBaseData baseData elemDicts Info.VFUNC typelib)
        virtualMethod

    val method =
      List.mapPartial
        (makeFunctionBaseData baseData elemDicts Info.FUNCTION typelib)
        method

    val field =
      List.mapPartial
        (makeFieldBaseData baseData elemDicts Info.FIELD typelib)
        field

    val signal =
      List.mapPartial
        (makeSignalBaseData baseData elemDicts Info.SIGNAL typelib)
        signal

    val property =
      List.mapPartial
        (makePropertyBaseData baseData elemDicts Info.PROPERTY typelib)
        property

    val objectData : Info.objectdata =
      {
        typeName     = typeName,
        getType      = getType,
        abstract     = abstract,
        fundamental  = fundamental,
        classStruct  = classStruct,
        parent       = parent,
        implements   = implements,
        constant     = constant,
        vfunc        = vfunc,
        method       = method,
        field        = field,
        signal       = signal,
        property     = property
      }
    val registeredTypeData : Info.registeredtypedata =
      {
        typeName = SOME typeName,
        getType  = SOME getType
      }
  in
    con (registeredTypeData & (objectData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("class" :: " " :: fmtQuoted name) :: ms)

and initClassBaseData typelib (x as {name, config, ...} : class) =
  makeConfigElemBaseData "class" I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateClassBaseData elemDicts con (x : class) baseData =
  updateElemBaseData (makeClass elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * namespace element "interface"
 * -------------------------------------------------------------------------- *)

and lookupPrerequisite elemDicts name : Info.basedata =
  (valOf o #2 o #1) (lookupElem elemDicts name)
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("prerequisite" :: " " :: fmtQuoted name) :: ms)

and makeInterface
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      typeName,
      getType,
      typeStruct,
      prerequisite,
      constant,
      virtualMethod,
      method,
      property,
      signal,
      ...
    } : interface
  ) =
  let
    val ifaceStruct = Option.map (lookupBase elemDicts) typeStruct

    val constant =
      List.mapPartial
        (makeConstantBaseData baseData elemDicts Info.CONSTANT typelib) constant

    val prerequisite = List.map (lookupPrerequisite elemDicts) prerequisite

    val vfunc =
      List.mapPartial
        (makeVFuncBaseData baseData elemDicts Info.VFUNC typelib)
        virtualMethod

    val method =
      List.mapPartial
        (makeFunctionBaseData baseData elemDicts Info.FUNCTION typelib)
        method

    val property =
      List.mapPartial
        (makePropertyBaseData baseData elemDicts Info.PROPERTY typelib)
        property

    val signal =
      List.mapPartial
        (makeSignalBaseData baseData elemDicts Info.SIGNAL typelib)
        signal

    val interfaceData : Info.interfacedata =
      {
        typeName     = typeName,
        getType      = getType,
        ifaceStruct  = ifaceStruct,
        prerequisite = prerequisite,
        constant     = constant,
        vfunc        = vfunc,
        method       = method,
        property     = property,
        signal       = signal
      }
    val registeredTypeData : Info.registeredtypedata =
      {
        typeName = SOME typeName,
        getType  = SOME getType
      }
  in
    con (registeredTypeData & (interfaceData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("interface" :: " " :: fmtQuoted name) :: ms)

and initInterfaceBaseData typelib (x as {name, config, ...} : interface) =
  makeConfigElemBaseData "interface" I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateInterfaceBaseData elemDicts con (x : interface) baseData =
  updateElemBaseData (makeInterface elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * namespace element "record"
 * -------------------------------------------------------------------------- *)

and makeRecord
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      typeName,
      getType,
      isGTypeStructFor,
      foreign,
      method,
      field,
      ...
    }
      : record
  ) =
  let
    val isGTypeStruct =
      withDefault false (K true) isGTypeStructFor
        handle
          GIRFail ms =>
            raise GIRFail (HText.concat ("attribute " :: fmtQuoted "glib:is-gtype-struct-for") :: ms)

    val isForeign =
      withDefault false makeValueBool foreign
        handle
          GIRFail ms =>
            raise GIRFail (HText.concat ("attribute " :: fmtQuoted "foreign") :: ms)

    val method =
      List.mapPartial
        (makeFunctionBaseData baseData elemDicts Info.FUNCTION typelib)
        method

    val field =
      List.mapPartial (makeFieldBaseData baseData elemDicts Info.FIELD typelib) field

    val structData : Info.structdata =
      {
        isGTypeStruct = isGTypeStruct,
        isForeign     = isForeign,
        method        = method,
        field         = field
      }
    val registeredTypeData : Info.registeredtypedata =
      {
        typeName = typeName,
        getType  = getType
      }
  in
    con (registeredTypeData & (structData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("record" :: " " :: fmtQuoted name) :: ms)

and initRecordBaseData typelib (x as {name, config, ...} : record) =
  makeConfigElemBaseData "record" I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateRecordBaseData elemDicts con (x : record) baseData =
  updateElemBaseData (makeRecord elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * namespace element "union"
 * -------------------------------------------------------------------------- *)

and makeUnion
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      name,
      typeName,
      getType,
      method,
      field,
      ...
    }
      : union
  ) =
  let
    val method =
      List.mapPartial
        (makeFunctionBaseData baseData elemDicts Info.FUNCTION typelib)
        method

    val field =
      List.mapPartial (makeFieldBaseData baseData elemDicts Info.FIELD typelib) field

    val unionData : Info.uniondata =
      {
        method = method,
        field  = field
      }
    val registeredTypeData : Info.registeredtypedata =
      {
        typeName = typeName,
        getType  = getType
      }
  in
    con (registeredTypeData & (unionData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("union" :: " " :: fmtQuoted name) :: ms)

and initUnionBaseData typelib (x as {name, config, ...} : union) =
  makeConfigElemBaseData "union" I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateUnionBaseData elemDicts con (x : union) baseData =
  updateElemBaseData (makeUnion elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * element "member"
 * -------------------------------------------------------------------------- *)

and makeMember
  _
  con
  _ (* self reference *)
  _
  ({name, value, ...} : member) =
  let
    val valueData : Info.valuedata =
      {
        value = makeValueInt value
      }
  in
    con (valueData & ())
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat ("member" :: " " :: fmtQuoted name) :: ms)

and makeMemberBaseData containerData elemDicts con typelib (x as {name, config, ...} : member) =
  makeConfigElemBaseData "member" ni
    (SOME containerData)
    (makeMember elemDicts)
    con
    typelib
    (SOME name)
    config
    x



(* --------------------------------------------------------------------------
 * namespace elements "bitfield" and "enumeration"
 * -------------------------------------------------------------------------- *)

and getEnumElemName enumElem =
  case enumElem of
    EEBITFIELD    => "bitfield"
  | EEENUMERATION => "enumeration"

and makeEnum
  elemDicts
  con
  baseData (* self reference *)
  typelib
  (
    {
      elem,
      name,
      typeName,
      getType,
      errorDomain,
      member,
      method,
      ...
    }
      : enum
  ) =
  let
    val member =
      List.mapPartial
        (makeMemberBaseData baseData elemDicts Info.VALUE typelib)
        member

    val method =
      List.mapPartial
        (makeFunctionBaseData baseData elemDicts Info.FUNCTION typelib)
        method

    val enumData : Info.enumdata =
      {
        member      = member,
        method      = method,
        errorDomain = errorDomain
      }
    val registeredTypeData : Info.registeredtypedata =
      {
        typeName = typeName,
        getType  = getType
      }
  in
    con (registeredTypeData & (enumData & ()))
  end
    handle
      GIRFail ms =>
        raise
          GIRFail (HText.concat (getEnumElemName elem :: " " :: fmtQuoted name) :: ms)

and initEnumBaseData typelib (x as {elem, name, config, ...} : enum) =
  makeConfigElemBaseData (getEnumElemName elem) I
    NONE
    makeUntranslated
    I
    typelib
    (SOME name)
    config
    x

and updateEnumBaseData elemDicts con (x : enum) baseData =
  updateElemBaseData (makeEnum elemDicts) con x baseData



(* --------------------------------------------------------------------------
 * 
 * -------------------------------------------------------------------------- *)

fun initBaseData typelib =
  fn
    ALIAS alias             => initAliasBaseData typelib alias
  | CLASS class             => initClassBaseData typelib class
  | INTERFACE interface     => initInterfaceBaseData typelib interface
  | RECORD record           => initRecordBaseData typelib record
  | UNION union             => initUnionBaseData typelib union
  | BITFIELD bitfield       => initEnumBaseData typelib bitfield
  | ENUMERATION enumeration => initEnumBaseData typelib enumeration
  | CALLBACK callback       => initCallbackBaseData typelib callback
  | CONSTANT constant       => initConstantBaseData typelib constant
  | FUNCTION function       => initFunctionBaseData typelib function

fun initNamespaceElem typelib =
  let
    (* For the namespace "GLib", we check for "List", "SList", "HashTable"
     * and "Error" because these have a special tag.
     *
     * Note that the test for "GLib" is performed after `initNamespaceElem`
     * is applied to its first argument, so that the test is done only
     * once per namespace. *)
    val makeTag =
      if #name (#namespace (!typelib)) = "GLib"
      then
        fn
          "List"      => GIRepositoryTypeTag.GLIST
        | "SList"     => GIRepositoryTypeTag.GSLIST
        | "HashTable" => GIRepositoryTypeTag.GHASH
        | "Error"     => GIRepositoryTypeTag.ERROR
        | _           => GIRepositoryTypeTag.INTERFACE
      else K GIRepositoryTypeTag.INTERFACE

    fun dupFail name _ =
      raise GIRFail [HText.concat ["duplicate namespace element ", name]]
  in
    fn ({elem, data = ()}, dict) =>
      let
        val data = initBaseData typelib elem

        val dict' =
          case elem of
            CONSTANT _ => dict  (* does not represent a type *)
          | FUNCTION _ => dict  (* does not represent a type *)
          | _          => 
              case data of
                SOME (Info.BASE (ref {name = SOME name, ...})) =>
                  let
                    val tag = makeTag name

                    val typePtrDepth =
                      case elem of
                        ALIAS _                 => NONE
                      | CLASS _                 => SOME 1
                      | INTERFACE _             => SOME 1
                      | RECORD {disguised, ...} =>
                          let
                            val disguised =
                              withDefault false makeValueBool disguised
                                handle
                                  GIRFail ms =>
                                    raise GIRFail (
                                      HText.concat ("record" :: " " :: fmtQuoted name)
                                       :: HText.concat ("attribute " :: fmtQuoted "disguised")
                                       :: ms
                                    )
                          in
                            if disguised
                            then SOME 1
                            else SOME 0
                          end
                      | UNION _                 => SOME 1
                      | BITFIELD _              => SOME 0
                      | ENUMERATION _           => SOME 0
                      | CALLBACK _              => SOME 0
                      | _                       => NONE  (* unreachable *)

(*
                    val typeData =
                      Info.TYPEDATA
                        {
                          tag                 = tag,
                          interface           = data,
                          params              = [],
                          ptrDepth            = cTypePtrDepth,
                          arrayLength         = NONE,
                          arrayFixedSize      = NONE,
                          arrayZeroTerminated = false,
                          arrayType           = NONE
                        }

                    val x = makeTypeBaseData container typelib (SOME name) typeData
 *)
                    val x = ((tag, data), typePtrDepth)

                    val dict' = Dict.insert I (dupFail name) ((name, x), dict)
                  in
                    dict'
                  end
              | _                                              => dict
      in
        ({elem = elem, data = data}, dict')
      end
  end


fun updateBaseData elemDicts {elem, data} = (
  case elem of
    ALIAS alias       => updateAliasBaseData elemDicts Info.ALIAS alias
  | CLASS class       => updateClassBaseData elemDicts Info.OBJECT class
  | INTERFACE
     interface        => updateInterfaceBaseData elemDicts Info.INTERFACE interface
  | RECORD record     => updateRecordBaseData elemDicts Info.STRUCT record
  | UNION union       => updateUnionBaseData elemDicts Info.UNION union
  | BITFIELD bitfield => updateEnumBaseData elemDicts Info.FLAGS bitfield
  | ENUMERATION
     enumeration      => updateEnumBaseData elemDicts Info.ENUM enumeration
  | CALLBACK callback => updateCallbackBaseData elemDicts Info.CALLBACK callback
  | CONSTANT constant => updateConstantBaseData elemDicts Info.CONSTANT constant
  | FUNCTION function => updateFunctionBaseData elemDicts Info.FUNCTION function
) data

fun updateNamespaceElem elemDicts =
  fn
    {elem, data = SOME data} => updateBaseData elemDicts {elem = elem, data = data}
  | _                        => ()


fun dropNamespaceElem annElem =
  case annElem of
    {elem, data = SOME (Info.BASE (ref {name, instance, ...}))} => (
      case instance of
        Info.INVALID      => {elem = elem, data = NONE}
      | Info.TRANSLATING  =>
          raise GIRFail [HText.concat ("untranslated element " :: fmtOptQuoted name)]
      | Info.UNTRANSLATED =>
          raise GIRFail [HText.concat ("untranslated element " :: fmtOptQuoted name)]
      | _                 => annElem
    )
  | _                                                           => annElem


fun initRepodata
  includes
  packages
  dependencies
  (
    {
      name,
      version,
      sharedLibrary,
      cPrefix,
      ...
    }
      : 'a namespace
  )
    : Info.repodata =
  ref
    {
      includes     = includes,
      packages     = packages,
      dependencies = dependencies,
      namespace    =
        {
          name      = name,
          version   = version,
          cPrefix   = if String.size cPrefix = 0 then NONE else SOME cPrefix,
          sharedLib = sharedLibrary,
          infos     = Vector.fromList []
        },
      elemDict     = Dict.empty
    }

fun updateRepodataInfos infos elemDict typelib =
  let
    val
      ref
        {
          includes,
          packages,
          dependencies,
          namespace =
            {
              name,
              version,
              cPrefix,
              sharedLib,
              infos = _
            },
          elemDict  = _
        } =
      typelib
  in
    typelib :=
      {
        includes     = includes,
        packages     = packages,
        dependencies = dependencies,
        namespace    =
          {
            name      = name,
            version   = version,
            cPrefix   = cPrefix,
            sharedLib = sharedLib,
            infos     = infos
          },
        elemDict     = elemDict
      }
  end



(* Extend a type dictionary with the basic types.
 *
 * Note that the tags `GLIST`, `GSLIST`, `GHASH` and `ERROR` are checked for
 * in`initNamespaceElem` as these are special tags for records in the
 * namespace "GLib". *)
local
  fun makeMaplet _ name tag ptrDepth = (name, ((tag, NONE), ptrDepth))

  fun dupFail _ = raise Fail "translate: base type conflicts with GIR"

  open GIRepositoryTypeTag
in
  fun addBasicTypeElems typelib dict =
    foldl (Dict.insert I dupFail) dict [
      makeMaplet typelib "gboolean"      BOOLEAN      (SOME 0),

      makeMaplet typelib "gchar"         CHAR         (SOME 0),
      makeMaplet typelib "guchar"        UCHAR        (SOME 0),
      makeMaplet typelib "gint"          INT          (SOME 0),
      makeMaplet typelib "guint"         UINT         (SOME 0),
      makeMaplet typelib "gshort"        SHORT        (SOME 0),
      makeMaplet typelib "gushort"       USHORT       (SOME 0),
      makeMaplet typelib "glong"         LONG         (SOME 0),
      makeMaplet typelib "gulong"        ULONG        (SOME 0),

      makeMaplet typelib "gint8"         INT8         (SOME 0),
      makeMaplet typelib "guint8"        UINT8        (SOME 0),
      makeMaplet typelib "gint16"        INT16        (SOME 0),
      makeMaplet typelib "guint16"       UINT16       (SOME 0),
      makeMaplet typelib "gint32"        INT32        (SOME 0),
      makeMaplet typelib "guint32"       UINT32       (SOME 0),
      makeMaplet typelib "gint64"        INT64        (SOME 0),
      makeMaplet typelib "guint64"       UINT64       (SOME 0),
      makeMaplet typelib "gfloat"        FLOAT        (SOME 0),
      makeMaplet typelib "gdouble"       DOUBLE       (SOME 0),

      makeMaplet typelib "gsize"         SIZE         (SOME 0),
      makeMaplet typelib "gssize"        SSIZE        (SOME 0),
      makeMaplet typelib "goffset"       OFFSET       (SOME 0),
      makeMaplet typelib "gintptr"       INTPTR       (SOME 1),
      makeMaplet typelib "guintptr"      UINTPTR      (SOME 1),

      makeMaplet typelib "utf8"          UTF8         (SOME 1),
      makeMaplet typelib "filename"      FILENAME     (SOME 1),
      makeMaplet typelib "none"          VOID         (SOME 0),
      makeMaplet typelib "gpointer"      VOID         (SOME 1),
      makeMaplet typelib "gconstpointer" VOID         (SOME 1),
      makeMaplet typelib "GType"         GTYPE        (SOME 0),
      makeMaplet typelib "gunichar"      UNICHAR      (SOME 0)
    ]
end


(* `translate elemDicts repository` returns `repository` with the translated
 * `Info.repodata` structure in the `data` field.  `elemDicts` provides a
 * type dictionary for each included namespace, to resolve type references
 * when translating. *)

fun translate dependencies elemDicts repository =
  let
    val {version, includes, packages, namespace, data = ()} = repository

    val typelib : Info.repodata =
      initRepodata includes packages dependencies namespace

    val (namespace' as {elems, ...}, elemDict') =
      let
        val {name, version, sharedLibrary, cPrefix, elems} = namespace

        (* Pass 1: initial translation for type dictionary
         *
         * Create `Info.TYPE`-instance `Info.basedata` values for the 
         * namespace elements so that references to elements as types (with
         * tag `INTERFACE`) from elsewhere within the same namespace are
         * recognized.  Note that references to elements in the same
         * namespace do not have the namespace prefixed. *)
        val (elems', localDict'1) =
          foldmapl (initNamespaceElem typelib) (elems, Dict.empty)


        (* `TYPE`-instance `basedata` values for basic types are
         * instantiated for each typelib.  This is consistent with the
         * information return via the C GObject Introspection library
         * in that `GIRepositoryBaseInfo.getTypelib` returns the typelib
         * for the namespace in which the basic type is referenced.
         * Basic type names are always unprefixed so these are added to
         * the current namespace elements. *)
        val localDict'2 = addBasicTypeElems typelib localDict'1

        (* Add the local dictionary to `elemDicts`, the dictionaries of
         * `TYPE`-instance `basedata` values for included namespaces.
         * References to type names in this namespace and basic type
         * names are unprefixed, so the prefix will be the empty string
         * ("") when looking up a type reference. *)
        val elemDicts'1 =
          ListDict.insert I
            (fn _ => raise Fail "translate: namespace already loaded")
            (("", localDict'2), elemDicts)

        (* The namespace GLib refers to the types with special tags
         * (that it provides) using the namespace prefix.  Therefore,
         * these types must be added with the namespace prefix. *)
        fun isSpecial (_, ((tag, _), _)) =
          case tag of
            GIRepositoryTypeTag.GLIST  => true
          | GIRepositoryTypeTag.GSLIST => true
          | GIRepositoryTypeTag.GHASH  => true
          | GIRepositoryTypeTag.ERROR  => true
          | _                          => false

        val elemDicts'2 =
          if name = "GLib"
          then
            (ListDict.insert I #2) (
              (
                name,
                Dict.fromList (List.filter isSpecial (Dict.toList localDict'1))
              ),
              elemDicts'1
            )
          else elemDicts'1
      in
        (* Pass 2 *)
        List.app (updateNamespaceElem elemDicts'2) elems';

        (* Pass 3
         *
         * Remove any top-level elements whose `Info.basedata` has instance
         * `Info.INVALID` from `elems'` but leave them in `localDict'1` (so
         * that references from other namespace are not reported as invalid).
         * Check that instance `Info.UNTRANSLATED`, `Info.TRANSLATING` or
         * `Info.INVALID` does not occur in `elems'`. *)
        (
          {
            name          = name,
            version       = version,
            sharedLibrary = sharedLibrary,
            cPrefix       = cPrefix,
            elems         = List.map dropNamespaceElem elems'  (* Pass 3 *)
          },
          localDict'1  (* without basic types *)
        )
      end

    val infos = Vector.fromList (List.mapPartial #data elems)
  in
    updateRepodataInfos infos elemDict' typelib : unit;
    {
      version   = version,
      includes  = includes,
      packages  = packages,
      namespace = namespace',
      data      = typelib
    }
      : (Info.repodata, Info.basedata option) repository
  end
    handle
      GIRFail ms => (
        app (fn ss => (app print ss; print "\n")) (map HText.toStrings ms);
        raise Fail "GIR parsing error"
      )


end (* of structure GirTranslator *)

(*

(* Test examples *)

PolyML.print_depth 15;

val tree = XML.parsefile "/opt/gtk+/gtk+-3.4.1/share/gir-1.0/Gdk-3.0.gir";
val tree = XML.parsefile "/opt/gtk+/gtk+-3.4.1/share/gir-1.0/Gtk-3.0.gir";

val repository =
  GIRXMLParser.parseTree tree : (unit, unit) GirAbstractSyntaxTree.repository;

val elemDicts = ListDict.empty;

val parsed = GIRTranslator.translate elemDicts repository;

*)
