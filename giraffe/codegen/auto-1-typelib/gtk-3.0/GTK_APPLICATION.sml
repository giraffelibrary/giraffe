signature GTK_APPLICATION =
  sig
    type 'a class_t
    type 'a windowclass_t
    val asActionGroup : 'a class_t -> base Gio.ActionGroupClass.t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> Gio.ApplicationFlags.t
       -> base class_t
    val addWindow :
      'a class_t
       -> 'b windowclass_t
       -> unit
    val removeWindow :
      'a class_t
       -> 'b windowclass_t
       -> unit
    val windowAddedSig : (base windowclass_t -> unit) -> 'a class_t Signal.signal
    val windowRemovedSig : (base windowclass_t -> unit) -> 'a class_t Signal.signal
  end
