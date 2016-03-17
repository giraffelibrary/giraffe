signature GIO_APP_LAUNCH_CONTEXT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val launchFailed :
      'a class
       -> string
       -> unit
  end
