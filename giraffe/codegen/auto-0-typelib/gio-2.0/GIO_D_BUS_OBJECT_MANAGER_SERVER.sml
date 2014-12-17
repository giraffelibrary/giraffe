signature GIO_D_BUS_OBJECT_MANAGER_SERVER =
  sig
    type 'a class_t
    type 'a dbusobjectmanagerclass_t
    type 'a dbusobjectskeletonclass_t
    type 'a dbusconnectionclass_t
    type t = base class_t
    val asDBusObjectManager : 'a class_t -> base dbusobjectmanagerclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val export :
      'a class_t
       -> 'b dbusobjectskeletonclass_t
       -> unit
    val exportUniquely :
      'a class_t
       -> 'b dbusobjectskeletonclass_t
       -> unit
    val getConnection : 'a class_t -> base dbusconnectionclass_t
    val setConnection :
      'a class_t
       -> 'b dbusconnectionclass_t option
       -> unit
    val unexport :
      'a class_t
       -> string
       -> bool
    val connectionProp : ('a class_t, base dbusconnectionclass_t option, 'b dbusconnectionclass_t option) Property.readwrite
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
