signature GTK_MESSAGE_DIALOG =
  sig
    type 'a class_t
    type messagetype_t
    type 'a widgetclass_t
    type buttonstype_t
    type 'a windowclass_t
    type dialogflags_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a windowclass_t option
       -> dialogflags_t
       -> messagetype_t
       -> buttonstype_t
       -> base class_t
    val getImage : 'a class_t -> base widgetclass_t
    val getMessageArea : 'a class_t -> base widgetclass_t
    val setImage :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val setMarkup :
      'a class_t
       -> string
       -> unit
    val buttonsProp : ('a class_t, buttonstype_t) Property.writeonly
    val imageProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val messageAreaProp : ('a class_t, base widgetclass_t option) Property.readonly
    val messageTypeProp : ('a class_t, messagetype_t, messagetype_t) Property.readwrite
    val secondaryTextProp : ('a class_t, string option, string option) Property.readwrite
    val secondaryUseMarkupProp : ('a class_t, bool, bool) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
    val useMarkupProp : ('a class_t, bool, bool) Property.readwrite
  end
