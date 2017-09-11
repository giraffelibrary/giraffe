signature GTK_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addActionWidget :
      'a class
       -> 'b widget_class * LargeInt.int
       -> unit
    val addButton :
      'a class
       -> string * LargeInt.int
       -> base widget_class
    val getActionArea : 'a class -> base widget_class
    val getContentArea : 'a class -> base widget_class
    val getResponseForWidget :
      'a class
       -> 'b widget_class
       -> LargeInt.int
    val getWidgetForResponse :
      'a class
       -> LargeInt.int
       -> base widget_class
    val response :
      'a class
       -> LargeInt.int
       -> unit
    val run : 'a class -> LargeInt.int
    val setAlternativeButtonOrderFromArray :
      'a class
       -> LargeInt.int vector
       -> unit
    val setDefaultResponse :
      'a class
       -> LargeInt.int
       -> unit
    val setResponseSensitive :
      'a class
       -> LargeInt.int * bool
       -> unit
    val closeSig : (unit -> unit) -> 'a class Signal.t
    val responseSig : (LargeInt.int -> unit) -> 'a class Signal.t
  end
