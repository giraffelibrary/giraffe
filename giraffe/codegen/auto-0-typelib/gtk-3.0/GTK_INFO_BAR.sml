signature GTK_INFO_BAR =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type 'a widget_class_t
    type message_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addActionWidget :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> unit
    val addButton :
      'a class_t
       -> string
       -> LargeInt.int
       -> base widget_class_t
    val getActionArea : 'a class_t -> base widget_class_t
    val getContentArea : 'a class_t -> base widget_class_t
    val getMessageType : 'a class_t -> message_type_t
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
       -> message_type_t
       -> unit
    val setResponseSensitive :
      'a class_t
       -> LargeInt.int
       -> bool
       -> unit
    val closeSig : (unit -> unit) -> 'a class_t Signal.signal
    val responseSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val messageTypeProp : ('a class_t, message_type_t, message_type_t) Property.readwrite
  end
