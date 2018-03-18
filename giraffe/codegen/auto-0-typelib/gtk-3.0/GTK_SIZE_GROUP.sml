signature GTK_SIZE_GROUP =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type size_group_mode_t
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : size_group_mode_t -> base class
    val addWidget :
      'a class
       -> 'b widget_class
       -> unit
    val getIgnoreHidden : 'a class -> bool
    val getMode : 'a class -> size_group_mode_t
    val removeWidget :
      'a class
       -> 'b widget_class
       -> unit
    val setIgnoreHidden :
      'a class
       -> bool
       -> unit
    val setMode :
      'a class
       -> size_group_mode_t
       -> unit
    val ignoreHiddenProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val modeProp :
      {
        get : 'a class -> size_group_mode_t,
        set :
          size_group_mode_t
           -> 'a class
           -> unit,
        new : size_group_mode_t -> 'a class Property.t
      }
  end
