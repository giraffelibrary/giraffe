signature GTK_DIALOG =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addActionWidget :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> unit
    val addButton :
      'a class_t
       -> string
       -> LargeInt.int
       -> base widgetclass_t
    val getActionArea : 'a class_t -> base widgetclass_t
    val getContentArea : 'a class_t -> base widgetclass_t
    val getResponseForWidget :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
    val getWidgetForResponse :
      'a class_t
       -> LargeInt.int
       -> base widgetclass_t
    val response :
      'a class_t
       -> LargeInt.int
       -> unit
    val run : 'a class_t -> LargeInt.int
    val setDefaultResponse :
      'a class_t
       -> LargeInt.int
       -> unit
    val setResponseSensitive :
      'a class_t
       -> LargeInt.int
       -> bool
       -> unit
    val closeSig : (unit -> unit) -> 'a class_t Signal.signal
    val responseSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
  end
