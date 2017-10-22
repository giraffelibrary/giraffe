structure AtkNoOpObject :>
  ATK_NO_OP_OBJECT
    where type 'a class = 'a AtkNoOpObjectClass.class
    where type 'a action_class = 'a AtkActionClass.class
    where type 'a component_class = 'a AtkComponentClass.class
    where type 'a document_class = 'a AtkDocumentClass.class
    where type 'a editable_text_class = 'a AtkEditableTextClass.class
    where type 'a hypertext_class = 'a AtkHypertextClass.class
    where type 'a image_class = 'a AtkImageClass.class
    where type 'a selection_class = 'a AtkSelectionClass.class
    where type 'a table_class = 'a AtkTableClass.class
    where type 'a table_cell_class = 'a AtkTableCellClass.class
    where type 'a text_class = 'a AtkTextClass.class
    where type 'a value_class = 'a AtkValueClass.class
    where type 'a window_class = 'a AtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_no_op_object_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "atk_no_op_object_new") (GObjectObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkNoOpObjectClass.class
    type 'a action_class = 'a AtkActionClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type 'a document_class = 'a AtkDocumentClass.class
    type 'a editable_text_class = 'a AtkEditableTextClass.class
    type 'a hypertext_class = 'a AtkHypertextClass.class
    type 'a image_class = 'a AtkImageClass.class
    type 'a selection_class = 'a AtkSelectionClass.class
    type 'a table_class = 'a AtkTableClass.class
    type 'a table_cell_class = 'a AtkTableCellClass.class
    type 'a text_class = 'a AtkTextClass.class
    type 'a value_class = 'a AtkValueClass.class
    type 'a window_class = 'a AtkWindowClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asDocument self = (GObjectObjectClass.FFI.withPtr ---> AtkDocumentClass.FFI.fromPtr false) I self
    fun asEditableText self = (GObjectObjectClass.FFI.withPtr ---> AtkEditableTextClass.FFI.fromPtr false) I self
    fun asHypertext self = (GObjectObjectClass.FFI.withPtr ---> AtkHypertextClass.FFI.fromPtr false) I self
    fun asImage self = (GObjectObjectClass.FFI.withPtr ---> AtkImageClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr ---> AtkSelectionClass.FFI.fromPtr false) I self
    fun asTable self = (GObjectObjectClass.FFI.withPtr ---> AtkTableClass.FFI.fromPtr false) I self
    fun asTableCell self = (GObjectObjectClass.FFI.withPtr ---> AtkTableCellClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr ---> AtkTextClass.FFI.fromPtr false) I self
    fun asValue self = (GObjectObjectClass.FFI.withPtr ---> AtkValueClass.FFI.fromPtr false) I self
    fun asWindow self = (GObjectObjectClass.FFI.withPtr ---> AtkWindowClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new obj = (GObjectObjectClass.FFI.withPtr ---> AtkNoOpObjectClass.FFI.fromPtr true) new_ obj
  end
