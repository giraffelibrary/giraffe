signature GDK_DRAG_CONTEXT =
  sig
    type 'a class_t
    type dragprotocol_t
    type 'a windowclass_t
    type dragaction_t
    type 'a deviceclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getActions : 'a class_t -> dragaction_t
    val getDestWindow : 'a class_t -> base windowclass_t
    val getDevice : 'a class_t -> base deviceclass_t
    val getProtocol : 'a class_t -> dragprotocol_t
    val getSelectedAction : 'a class_t -> dragaction_t
    val getSourceWindow : 'a class_t -> base windowclass_t
    val getSuggestedAction : 'a class_t -> dragaction_t
    val setDevice :
      'a class_t
       -> 'b deviceclass_t
       -> unit
  end
