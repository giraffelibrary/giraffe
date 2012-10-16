signature GIO_APP_LAUNCH_CONTEXT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val launchFailed :
      'a class_t
       -> string
       -> unit
  end
