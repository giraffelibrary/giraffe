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
    val accelSizeGroupProp :
      {
        set :
          'b size_group_class option
           -> 'a class
           -> unit,
        new : 'b size_group_class option -> 'a class Property.t
      }
    val acceleratorProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val actionNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val directionProp :
      {
        get : 'a class -> text_direction_t,
        set :
          text_direction_t
           -> 'a class
           -> unit,
        new : text_direction_t -> 'a class Property.t
      }
    val iconProp :
      {
        get : 'a class -> base Gio.IconClass.class option,
        set :
          'b Gio.IconClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.IconClass.class option -> 'a class Property.t
      }
    val iconSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val shortcutTypeProp :
      {
        get : 'a class -> shortcut_type_t,
        set :
          shortcut_type_t
           -> 'a class
           -> unit,
        new : shortcut_type_t -> 'a class Property.t
      }
    val subtitleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val subtitleSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val titleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val titleSizeGroupProp :
      {
        set :
          'b size_group_class option
           -> 'a class
           -> unit,
        new : 'b size_group_class option -> 'a class Property.t
      }
  end
