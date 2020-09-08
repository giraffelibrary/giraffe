signature GTK_APP_CHOOSER_BUTTON =
  sig
    type 'a class
    type 'a app_chooser_class
    type 'a buildable_class
    type 'a cell_editable_class
    type 'a cell_layout_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asAppChooser : 'a class -> base app_chooser_class
    val asBuildable : 'a class -> base buildable_class
    val asCellEditable : 'a class -> base cell_editable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val appendCustomItem :
      'a class
       -> string
           * string
           * 'b Gio.IconClass.class
       -> unit
    val appendSeparator : 'a class -> unit
    val getHeading : 'a class -> string option
    val getShowDefaultItem : 'a class -> bool
    val getShowDialogItem : 'a class -> bool
    val setActiveCustomItem :
      'a class
       -> string
       -> unit
    val setHeading :
      'a class
       -> string
       -> unit
    val setShowDefaultItem :
      'a class
       -> bool
       -> unit
    val setShowDialogItem :
      'a class
       -> bool
       -> unit
    val customItemActivatedSig : (string -> unit) -> 'a class Signal.t
    val headingProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val showDefaultItemProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showDialogItemProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
