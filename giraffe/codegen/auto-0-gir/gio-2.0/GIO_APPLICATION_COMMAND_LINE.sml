signature GIO_APPLICATION_COMMAND_LINE =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getCwd : 'a class_t -> string
    val getExitStatus : 'a class_t -> LargeInt.int
    val getIsRemote : 'a class_t -> bool
    val getPlatformData : 'a class_t -> GLib.VariantRecord.t
    val getenv :
      'a class_t
       -> string
       -> string
    val setExitStatus :
      'a class_t
       -> LargeInt.int
       -> unit
    val argumentsProp : ('a class_t, GLib.VariantRecord.t option) Property.writeonly
    val isRemoteProp : ('a class_t, bool) Property.readonly
    val platformDataProp : ('a class_t, GLib.VariantRecord.t option) Property.writeonly
  end
