signature GTK_APP_CHOOSER_BUTTON =
  sig
    type 'a class_t
    type 'a app_chooser_class_t
    type 'a buildable_class_t
    type 'a cell_editable_class_t
    type 'a cell_layout_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asAppChooser : 'a class_t -> base app_chooser_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asCellEditable : 'a class_t -> base cell_editable_class_t
    val asCellLayout : 'a class_t -> base cell_layout_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val appendCustomItem :
      'a class_t
       -> string
       -> string
       -> 'b Gio.IconClass.t
       -> unit
    val appendSeparator : 'a class_t -> unit
    val getHeading : 'a class_t -> string
    val getShowDefaultItem : 'a class_t -> bool
    val getShowDialogItem : 'a class_t -> bool
    val setActiveCustomItem :
      'a class_t
       -> string
       -> unit
    val setHeading :
      'a class_t
       -> string
       -> unit
    val setShowDefaultItem :
      'a class_t
       -> bool
       -> unit
    val setShowDialogItem :
      'a class_t
       -> bool
       -> unit
    val customItemActivatedSig : (string -> unit) -> 'a class_t Signal.signal
    val headingProp : ('a class_t, string option, string option) Property.readwrite
    val showDefaultItemProp : ('a class_t, bool, bool) Property.readwrite
    val showDialogItemProp : ('a class_t, bool, bool) Property.readwrite
  end
