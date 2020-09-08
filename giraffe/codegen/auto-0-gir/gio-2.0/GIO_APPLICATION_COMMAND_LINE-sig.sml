signature GIO_APPLICATION_COMMAND_LINE =
  sig
    type 'a class
    type 'a file_class
    type 'a input_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val createFileForArg :
      'a class
       -> string
       -> base file_class
    val getArguments : 'a class -> Utf8CPtrArrayN.t
    val getCwd : 'a class -> string option
    val getEnviron : 'a class -> Utf8CPtrArray.t
    val getExitStatus : 'a class -> LargeInt.int
    val getIsRemote : 'a class -> bool
    val getOptionsDict : 'a class -> GLib.VariantDictRecord.t
    val getPlatformData : 'a class -> GLib.VariantRecord.t option
    val getStdin : 'a class -> base input_stream_class
    val getenv :
      'a class
       -> string
       -> string
    val setExitStatus :
      'a class
       -> LargeInt.int
       -> unit
    val argumentsProp : ('a class, unit, unit, GLib.VariantRecord.t option -> unit) Property.t
    val isRemoteProp : ('a class, unit -> bool, unit, unit) Property.t
    val optionsProp : ('a class, unit, unit, GLib.VariantRecord.t option -> unit) Property.t
    val platformDataProp : ('a class, unit, unit, GLib.VariantRecord.t option -> unit) Property.t
  end
