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
    where type 'a text_class = 'a AtkTextClass.class
    where type 'a value_class = 'a AtkValueClass.class
    where type 'a window_class = 'a AtkWindowClass.class =
  struct
    val getType_ = _import "atk_no_op_object_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_no_op_object_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    type 'a class = 'a AtkNoOpObjectClass.class
    type 'a action_class = 'a AtkActionClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type 'a document_class = 'a AtkDocumentClass.class
    type 'a editable_text_class = 'a AtkEditableTextClass.class
    type 'a hypertext_class = 'a AtkHypertextClass.class
    type 'a image_class = 'a AtkImageClass.class
    type 'a selection_class = 'a AtkSelectionClass.class
    type 'a table_class = 'a AtkTableClass.class
    type 'a text_class = 'a AtkTextClass.class
    type 'a value_class = 'a AtkValueClass.class
    type 'a window_class = 'a AtkWindowClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.C.withPtr ---> AtkActionClass.C.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    fun asDocument self = (GObjectObjectClass.C.withPtr ---> AtkDocumentClass.C.fromPtr false) I self
    fun asEditableText self = (GObjectObjectClass.C.withPtr ---> AtkEditableTextClass.C.fromPtr false) I self
    fun asHypertext self = (GObjectObjectClass.C.withPtr ---> AtkHypertextClass.C.fromPtr false) I self
    fun asImage self = (GObjectObjectClass.C.withPtr ---> AtkImageClass.C.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.C.withPtr ---> AtkSelectionClass.C.fromPtr false) I self
    fun asTable self = (GObjectObjectClass.C.withPtr ---> AtkTableClass.C.fromPtr false) I self
    fun asText self = (GObjectObjectClass.C.withPtr ---> AtkTextClass.C.fromPtr false) I self
    fun asValue self = (GObjectObjectClass.C.withPtr ---> AtkValueClass.C.fromPtr false) I self
    fun asWindow self = (GObjectObjectClass.C.withPtr ---> AtkWindowClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new obj = (GObjectObjectClass.C.withPtr ---> AtkNoOpObjectClass.C.fromPtr true) new_ obj
  end
