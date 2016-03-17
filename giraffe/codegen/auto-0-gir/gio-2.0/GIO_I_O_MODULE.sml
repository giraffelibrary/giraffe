signature GIO_I_O_MODULE =
  sig
    type 'a class
    type t = base class
    val asTypePlugin : 'a class -> base GObject.TypePluginClass.class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val load : 'a class -> unit
    val unload : 'a class -> unit
  end
