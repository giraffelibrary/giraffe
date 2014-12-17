signature GTK_IMAGE_MENU_ITEM =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type 'a accelgroupclass_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newFromStock :
      string
       -> 'a accelgroupclass_t option
       -> base class_t
    val newWithLabel : string -> base class_t
    val newWithMnemonic : string -> base class_t
    val getAlwaysShowImage : 'a class_t -> bool
    val getImage : 'a class_t -> base widgetclass_t
    val getUseStock : 'a class_t -> bool
    val setAccelGroup :
      'a class_t
       -> 'b accelgroupclass_t
       -> unit
    val setAlwaysShowImage :
      'a class_t
       -> bool
       -> unit
    val setImage :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setUseStock :
      'a class_t
       -> bool
       -> unit
    val accelGroupProp : ('a class_t, 'b accelgroupclass_t option) Property.writeonly
    val alwaysShowImageProp : ('a class_t, bool, bool) Property.readwrite
    val imageProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val useStockProp : ('a class_t, bool, bool) Property.readwrite
  end
