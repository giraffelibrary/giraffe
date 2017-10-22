signature GTK_FILE_CHOOSER_BUTTON =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type file_chooser_action_t
    type 'a dialog_class
    type 'a file_chooser_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asFileChooser : 'a class -> base file_chooser_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : string * file_chooser_action_t -> base class
    val newWithDialog : 'a dialog_class -> base class
    val getFocusOnClick : 'a class -> bool
    val getTitle : 'a class -> string
    val getWidthChars : 'a class -> LargeInt.int
    val setFocusOnClick :
      'a class
       -> bool
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setWidthChars :
      'a class
       -> LargeInt.int
       -> unit
    val fileSetSig : (unit -> unit) -> 'a class Signal.t
    val dialogProp : ('a class, 'b file_chooser_class option) Property.writeonly
    val titleProp : ('a class, string option, string option) Property.readwrite
    val widthCharsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
