signature ATK_NO_OP_OBJECT =
  sig
    type 'a class_t
    type 'a action_class_t
    type 'a component_class_t
    type 'a document_class_t
    type 'a editable_text_class_t
    type 'a hypertext_class_t
    type 'a image_class_t
    type 'a selection_class_t
    type 'a table_class_t
    type 'a text_class_t
    type 'a value_class_t
    type 'a window_class_t
    type t = base class_t
    val asAction : 'a class_t -> base action_class_t
    val asComponent : 'a class_t -> base component_class_t
    val asDocument : 'a class_t -> base document_class_t
    val asEditableText : 'a class_t -> base editable_text_class_t
    val asHypertext : 'a class_t -> base hypertext_class_t
    val asImage : 'a class_t -> base image_class_t
    val asSelection : 'a class_t -> base selection_class_t
    val asTable : 'a class_t -> base table_class_t
    val asText : 'a class_t -> base text_class_t
    val asValue : 'a class_t -> base value_class_t
    val asWindow : 'a class_t -> base window_class_t
    val getType : unit -> GObject.Type.t
    val new : 'a GObject.ObjectClass.t -> base class_t
  end
