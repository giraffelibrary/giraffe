signature GTK_FILE_CHOOSER_BUTTON =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type file_chooser_action_t
    type 'a widget_class_t
    type 'a file_chooser_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asFileChooser : 'a class_t -> base file_chooser_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> file_chooser_action_t
       -> base class_t
    val newWithDialog : 'a widget_class_t -> base class_t
    val getFocusOnClick : 'a class_t -> bool
    val getTitle : 'a class_t -> string
    val getWidthChars : 'a class_t -> LargeInt.int
    val setFocusOnClick :
      'a class_t
       -> bool
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setWidthChars :
      'a class_t
       -> LargeInt.int
       -> unit
    val fileSetSig : (unit -> unit) -> 'a class_t Signal.signal
    val dialogProp : ('a class_t, 'b file_chooser_class_t option) Property.writeonly
    val focusOnClickProp : ('a class_t, bool, bool) Property.readwrite
    val titleProp : ('a class_t, string option, string option) Property.readwrite
    val widthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
