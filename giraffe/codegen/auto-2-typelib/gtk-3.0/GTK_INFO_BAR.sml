signature GTK_INFO_BAR =
  sig
    type 'a class_t
    type messagetype_t
    type 'a widgetclass_t
    type 'a orientableclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
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
    val getMessageType : 'a class_t -> messagetype_t
    val response :
      'a class_t
       -> LargeInt.int
       -> unit
    val setDefaultResponse :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMessageType :
      'a class_t
       -> messagetype_t
       -> unit
    val setResponseSensitive :
      'a class_t
       -> LargeInt.int
       -> bool
       -> unit
    val closeSig : (unit -> unit) -> 'a class_t Signal.signal
    val responseSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val messageTypeProp : ('a class_t, messagetype_t, messagetype_t) Property.readwrite
  end
