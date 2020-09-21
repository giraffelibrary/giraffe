signature GTK_TREE_ROW_REFERENCE =
  sig
    type t
    type 'a tree_model_class
    type tree_path_t
    val getType : unit -> GObject.Type.t
    val new : 'a tree_model_class * tree_path_t -> t
    val newProxy :
      'a GObject.ObjectClass.class
       * 'b tree_model_class
       * tree_path_t
       -> t
    val copy : t -> t
    val getModel : t -> base tree_model_class
    val getPath : t -> tree_path_t option
    val valid : t -> bool
    val deleted : 'a GObject.ObjectClass.class * tree_path_t -> unit
    val inserted : 'a GObject.ObjectClass.class * tree_path_t -> unit
  end
