signature GTK_IMAGE_MENU_ITEM =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type 'a accel_group_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newFromStock :
      string
       -> 'a accel_group_class_t option
       -> base class_t
    val newWithLabel : string -> base class_t
    val newWithMnemonic : string -> base class_t
    val getAlwaysShowImage : 'a class_t -> bool
    val getImage : 'a class_t -> base widget_class_t
    val getUseStock : 'a class_t -> bool
    val setAccelGroup :
      'a class_t
       -> 'b accel_group_class_t
       -> unit
    val setAlwaysShowImage :
      'a class_t
       -> bool
       -> unit
    val setImage :
      'a class_t
       -> 'b widget_class_t option
       -> unit
    val setUseStock :
      'a class_t
       -> bool
       -> unit
    val accelGroupProp : ('a class_t, 'b accel_group_class_t option) Property.writeonly
    val alwaysShowImageProp : ('a class_t, bool, bool) Property.readwrite
    val imageProp : ('a class_t, base widget_class_t option, 'b widget_class_t option) Property.readwrite
    val useStockProp : ('a class_t, bool, bool) Property.readwrite
  end
