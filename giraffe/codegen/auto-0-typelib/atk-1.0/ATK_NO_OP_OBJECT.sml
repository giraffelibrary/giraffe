signature ATK_NO_OP_OBJECT =
  sig
    type 'a class
    type 'a action_class
    type 'a component_class
    type 'a document_class
    type 'a editable_text_class
    type 'a hypertext_class
    type 'a image_class
    type 'a selection_class
    type 'a table_class
    type 'a table_cell_class
    type 'a text_class
    type 'a value_class
    type 'a window_class
    type t = base class
    val asAction : 'a class -> base action_class
    val asComponent : 'a class -> base component_class
    val asDocument : 'a class -> base document_class
    val asEditableText : 'a class -> base editable_text_class
    val asHypertext : 'a class -> base hypertext_class
    val asImage : 'a class -> base image_class
    val asSelection : 'a class -> base selection_class
    val asTable : 'a class -> base table_class
    val asTableCell : 'a class -> base table_cell_class
    val asText : 'a class -> base text_class
    val asValue : 'a class -> base value_class
    val asWindow : 'a class -> base window_class
    val getType : unit -> GObject.Type.t
    val new : 'a GObject.ObjectClass.class -> base class
  end
