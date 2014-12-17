structure GtkCellRendererCombo :>
  GTK_CELL_RENDERER_COMBO
    where type 'a class_t = 'a GtkCellRendererComboClass.t
    where type treeiterrecord_t = GtkTreeIterRecord.t
    where type 'a treemodelclass_t = 'a GtkTreeModelClass.t =
  struct
    val getType_ = _import "gtk_cell_renderer_combo_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_renderer_combo_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkCellRendererComboClass.t
    type treeiterrecord_t = GtkTreeIterRecord.t
    type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellRendererComboClass.C.fromPtr false) new_ ()
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (get 0w1 string &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn pathString & newIter => f pathString newIter)
    end
    local
      open Property
    in
      val hasEntryProp =
        {
          get = fn x => get "has-entry" boolean x,
          set = fn x => set "has-entry" boolean x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
      val textColumnProp =
        {
          get = fn x => get "text-column" int x,
          set = fn x => set "text-column" int x
        }
    end
  end
