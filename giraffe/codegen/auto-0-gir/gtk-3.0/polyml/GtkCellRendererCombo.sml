structure GtkCellRendererCombo :>
  GTK_CELL_RENDERER_COMBO
    where type 'a class = 'a GtkCellRendererComboClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_renderer_combo_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_cell_renderer_combo_new") (FFI.PolyML.cVoid --> GtkCellRendererClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkCellRendererComboClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
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
