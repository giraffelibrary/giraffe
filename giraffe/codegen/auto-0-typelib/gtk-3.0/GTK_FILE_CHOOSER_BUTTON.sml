signature GTK_FILE_CHOOSER_BUTTON =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type filechooseraction_t
    type 'a widgetclass_t
    type 'a filechooserclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asFileChooser : 'a class_t -> base filechooserclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> filechooseraction_t
       -> base class_t
    val newWithDialog : 'a widgetclass_t -> base class_t
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
    val dialogProp : ('a class_t, 'b filechooserclass_t option) Property.writeonly
    val focusOnClickProp : ('a class_t, bool, bool) Property.readwrite
    val titleProp : ('a class_t, string option, string option) Property.readwrite
    val widthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
