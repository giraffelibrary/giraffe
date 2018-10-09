signature GTK_TOOL_ITEM_GROUP =
  sig
    type 'a class
    type 'a buildable_class
    type 'a tool_shell_class
    type 'a tool_item_class
    type relief_style_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asToolShell : 'a class -> base tool_shell_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val getCollapsed : 'a class -> bool
    val getDropItem :
      'a class
       -> LargeInt.int * LargeInt.int
       -> base tool_item_class
    val getEllipsize : 'a class -> Pango.EllipsizeMode.t
    val getHeaderRelief : 'a class -> relief_style_t
    val getItemPosition :
      'a class
       -> 'b tool_item_class
       -> LargeInt.int
    val getLabel : 'a class -> string
    val getLabelWidget : 'a class -> base widget_class
    val getNItems : 'a class -> LargeInt.int
    val getNthItem :
      'a class
       -> LargeInt.int
       -> base tool_item_class
    val insert :
      'a class
       -> 'b tool_item_class * LargeInt.int
       -> unit
    val setCollapsed :
      'a class
       -> bool
       -> unit
    val setEllipsize :
      'a class
       -> Pango.EllipsizeMode.t
       -> unit
    val setHeaderRelief :
      'a class
       -> relief_style_t
       -> unit
    val setItemPosition :
      'a class
       -> 'b tool_item_class * LargeInt.int
       -> unit
    val setLabel :
      'a class
       -> string
       -> unit
    val setLabelWidget :
      'a class
       -> 'b widget_class
       -> unit
    val collapsedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val ellipsizeProp :
      {
        get : 'a class -> Pango.EllipsizeMode.t,
        set :
          Pango.EllipsizeMode.t
           -> 'a class
           -> unit,
        new : Pango.EllipsizeMode.t -> 'a class Property.t
      }
    val headerReliefProp :
      {
        get : 'a class -> relief_style_t,
        set :
          relief_style_t
           -> 'a class
           -> unit,
        new : relief_style_t -> 'a class Property.t
      }
    val labelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val labelWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
  end
