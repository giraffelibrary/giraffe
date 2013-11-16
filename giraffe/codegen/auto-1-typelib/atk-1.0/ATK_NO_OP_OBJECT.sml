signature ATK_NO_OP_OBJECT =
  sig
    type 'a class_t
    type 'a windowclass_t
    type 'a valueclass_t
    type 'a textclass_t
    type 'a tableclass_t
    type 'a selectionclass_t
    type 'a imageclass_t
    type 'a hypertextclass_t
    type 'a editabletextclass_t
    type 'a documentclass_t
    type 'a componentclass_t
    type 'a actionclass_t
    val asAction : 'a class_t -> base actionclass_t
    val asComponent : 'a class_t -> base componentclass_t
    val asDocument : 'a class_t -> base documentclass_t
    val asEditableText : 'a class_t -> base editabletextclass_t
    val asHypertext : 'a class_t -> base hypertextclass_t
    val asImage : 'a class_t -> base imageclass_t
    val asSelection : 'a class_t -> base selectionclass_t
    val asTable : 'a class_t -> base tableclass_t
    val asText : 'a class_t -> base textclass_t
    val asValue : 'a class_t -> base valueclass_t
    val asWindow : 'a class_t -> base windowclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a GObject.ObjectClass.t -> base class_t
  end
