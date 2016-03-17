signature GTK_INFO_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a widget_class
    type message_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addActionWidget :
      'a class
       -> 'b widget_class
       -> LargeInt.int
       -> unit
    val addButton :
      'a class
       -> string
       -> LargeInt.int
       -> base widget_class
    val getActionArea : 'a class -> base widget_class
    val getContentArea : 'a class -> base widget_class
    val getMessageType : 'a class -> message_type_t
    val response :
      'a class
       -> LargeInt.int
       -> unit
    val setDefaultResponse :
      'a class
       -> LargeInt.int
       -> unit
    val setMessageType :
      'a class
       -> message_type_t
       -> unit
    val setResponseSensitive :
      'a class
       -> LargeInt.int
       -> bool
       -> unit
    val closeSig : (unit -> unit) -> 'a class Signal.signal
    val responseSig : (LargeInt.int -> unit) -> 'a class Signal.signal
    val messageTypeProp : ('a class, message_type_t, message_type_t) Property.readwrite
  end
