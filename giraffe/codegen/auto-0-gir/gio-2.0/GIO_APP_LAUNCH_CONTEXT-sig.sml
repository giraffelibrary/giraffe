signature GIO_APP_LAUNCH_CONTEXT =
  sig
    type 'a class
    type 'a app_info_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getEnvironment : 'a class -> Utf8CPtrArray.t
    val launchFailed :
      'a class
       -> string
       -> unit
    val setenv :
      'a class
       -> string * string
       -> unit
    val unsetenv :
      'a class
       -> string
       -> unit
    val launchFailedSig : (string -> unit) -> 'a class Signal.t
    val launchedSig : (base app_info_class * GLib.VariantRecord.t -> unit) -> 'a class Signal.t
  end
