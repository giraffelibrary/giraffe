structure AtkNoOpObject :>
  ATK_NO_OP_OBJECT
    where type 'a class_t = 'a AtkNoOpObjectClass.t
    where type 'a actionclass_t = 'a AtkActionClass.t
    where type 'a componentclass_t = 'a AtkComponentClass.t
    where type 'a documentclass_t = 'a AtkDocumentClass.t
    where type 'a editabletextclass_t = 'a AtkEditableTextClass.t
    where type 'a hypertextclass_t = 'a AtkHypertextClass.t
    where type 'a imageclass_t = 'a AtkImageClass.t
    where type 'a selectionclass_t = 'a AtkSelectionClass.t
    where type 'a tableclass_t = 'a AtkTableClass.t
    where type 'a textclass_t = 'a AtkTextClass.t
    where type 'a valueclass_t = 'a AtkValueClass.t
    where type 'a windowclass_t = 'a AtkWindowClass.t =
  struct
    val getType_ = _import "atk_no_op_object_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_no_op_object_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a AtkNoOpObjectClass.t
    type 'a actionclass_t = 'a AtkActionClass.t
    type 'a componentclass_t = 'a AtkComponentClass.t
    type 'a documentclass_t = 'a AtkDocumentClass.t
    type 'a editabletextclass_t = 'a AtkEditableTextClass.t
    type 'a hypertextclass_t = 'a AtkHypertextClass.t
    type 'a imageclass_t = 'a AtkImageClass.t
    type 'a selectionclass_t = 'a AtkSelectionClass.t
    type 'a tableclass_t = 'a AtkTableClass.t
    type 'a textclass_t = 'a AtkTextClass.t
    type 'a valueclass_t = 'a AtkValueClass.t
    type 'a windowclass_t = 'a AtkWindowClass.t
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
