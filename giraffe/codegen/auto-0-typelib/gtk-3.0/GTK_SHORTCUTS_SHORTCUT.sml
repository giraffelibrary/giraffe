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
    val accelSizeGroupProp : ('a class, 'b size_group_class option) Property.writeonly
    val acceleratorProp : ('a class, string option, string option) Property.readwrite
    val actionNameProp : ('a class, string option, string option) Property.readwrite
    val directionProp : ('a class, text_direction_t, text_direction_t) Property.readwrite
    val iconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val iconSetProp : ('a class, bool, bool) Property.readwrite
    val shortcutTypeProp : ('a class, shortcut_type_t, shortcut_type_t) Property.readwrite
    val subtitleProp : ('a class, string option, string option) Property.readwrite
    val subtitleSetProp : ('a class, bool, bool) Property.readwrite
    val titleProp : ('a class, string option, string option) Property.readwrite
    val titleSizeGroupProp : ('a class, 'b size_group_class option) Property.writeonly
  end
