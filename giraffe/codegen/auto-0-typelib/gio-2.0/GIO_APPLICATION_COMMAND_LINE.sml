signature GIO_APPLICATION_COMMAND_LINE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getCwd : 'a class -> string
    val getExitStatus : 'a class -> LargeInt.int
    val getIsRemote : 'a class -> bool
    val getPlatformData : 'a class -> GLib.VariantRecord.t
    val getenv :
      'a class
       -> string
       -> string
    val setExitStatus :
      'a class
       -> LargeInt.int
       -> unit
    val argumentsProp : ('a class, GLib.VariantRecord.t option) Property.writeonly
    val isRemoteProp : ('a class, bool) Property.readonly
    val platformDataProp : ('a class, GLib.VariantRecord.t option) Property.writeonly
  end
