signature GTK_SHORTCUTS_SHORTCUT =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type text_direction_t
    type shortcut_type_t
    type 'a size_group_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val accelSizeGroupProp : ('a class, unit, 'b size_group_class option -> unit, 'b size_group_class option -> unit) Property.t
    val acceleratorProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val actionNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val directionProp : ('a class, unit -> text_direction_t, text_direction_t -> unit, text_direction_t -> unit) Property.t
    val iconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val iconSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val shortcutTypeProp : ('a class, unit -> shortcut_type_t, shortcut_type_t -> unit, shortcut_type_t -> unit) Property.t
    val subtitleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val subtitleSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val titleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val titleSizeGroupProp : ('a class, unit, 'b size_group_class option -> unit, 'b size_group_class option -> unit) Property.t
  end
