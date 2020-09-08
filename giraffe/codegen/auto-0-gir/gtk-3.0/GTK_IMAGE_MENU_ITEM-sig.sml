signature GTK_IMAGE_MENU_ITEM =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a accel_group_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromStock : string * 'a accel_group_class option -> base class
    val newWithLabel : string -> base class
    val newWithMnemonic : string -> base class
    val getAlwaysShowImage : 'a class -> bool
    val getImage : 'a class -> base widget_class
    val getUseStock : 'a class -> bool
    val setAccelGroup :
      'a class
       -> 'b accel_group_class
       -> unit
    val setAlwaysShowImage :
      'a class
       -> bool
       -> unit
    val setImage :
      'a class
       -> 'b widget_class option
       -> unit
    val setUseStock :
      'a class
       -> bool
       -> unit
    val accelGroupProp : ('a class, unit, 'b accel_group_class option -> unit, 'b accel_group_class option -> unit) Property.t
    val alwaysShowImageProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val imageProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val useStockProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
