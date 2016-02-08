structure GtkCellView :>
  GTK_CELL_VIEW
    where type 'a class_t = 'a GtkCellViewClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type tree_path_record_t = GtkTreePathRecord.t
    where type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    where type 'a cell_area_context_class_t = 'a GtkCellAreaContextClass.t
    where type 'a tree_model_class_t = 'a GtkTreeModelClass.t =
  struct
    val getType_ = _import "gtk_cell_view_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_view_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithContext_ = fn x1 & x2 => (_import "gtk_cell_view_new_with_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newWithMarkup_ = _import "mlton_gtk_cell_view_new_with_markup" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithPixbuf_ = _import "gtk_cell_view_new_with_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithText_ = _import "mlton_gtk_cell_view_new_with_text" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDisplayedRow_ = _import "gtk_cell_view_get_displayed_row" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p;
    val getDrawSensitive_ = _import "gtk_cell_view_get_draw_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getFitModel_ = _import "gtk_cell_view_get_fit_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getModel_ = _import "gtk_cell_view_get_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setBackgroundColor_ = fn x1 & x2 => (_import "gtk_cell_view_set_background_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setBackgroundRgba_ = fn x1 & x2 => (_import "gtk_cell_view_set_background_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setDisplayedRow_ = fn x1 & x2 => (_import "gtk_cell_view_set_displayed_row" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val setDrawSensitive_ = fn x1 & x2 => (_import "gtk_cell_view_set_draw_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFitModel_ = fn x1 & x2 => (_import "gtk_cell_view_set_fit_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_cell_view_set_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkCellViewClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type tree_path_record_t = GtkTreePathRecord.t
    type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    type 'a cell_area_context_class_t = 'a GtkCellAreaContextClass.t
    type 'a tree_model_class_t = 'a GtkTreeModelClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellViewClass.C.fromPtr false) new_ ()
    fun newWithContext area context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithContext_ (area & context)
    fun newWithMarkup markup = (Utf8.C.withConstPtr ---> GtkCellViewClass.C.fromPtr false) newWithMarkup_ markup
    fun newWithPixbuf pixbuf = (GObjectObjectClass.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithPixbuf_ pixbuf
    fun newWithText text = (Utf8.C.withConstPtr ---> GtkCellViewClass.C.fromPtr false) newWithText_ text
    fun getDisplayedRow self = (GObjectObjectClass.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) getDisplayedRow_ self
    fun getDrawSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawSensitive_ self
    fun getFitModel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFitModel_ self
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun setBackgroundColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackgroundColor_ (self & color)
    fun setBackgroundRgba self rgba = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setDisplayedRow self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withOptPtr ---> I) setDisplayedRow_ (self & path)
    fun setDrawSensitive self drawSensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDrawSensitive_ (self & drawSensitive)
    fun setFitModel self fitModel = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFitModel_ (self & fitModel)
    fun setModel self model = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setModel_ (self & model)
    local
      open Property
    in
      val backgroundProp = {set = fn x => set "background" stringOpt x}
      val backgroundGdkProp =
        {
          get = fn x => get "background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "background-gdk" GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          get = fn x => get "background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "background-rgba" GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x
        }
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          set = fn x => set "cell-area" GtkCellAreaClass.tOpt x
        }
      val cellAreaContextProp =
        {
          get = fn x => get "cell-area-context" GtkCellAreaContextClass.tOpt x,
          set = fn x => set "cell-area-context" GtkCellAreaContextClass.tOpt x
        }
      val drawSensitiveProp =
        {
          get = fn x => get "draw-sensitive" boolean x,
          set = fn x => set "draw-sensitive" boolean x
        }
      val fitModelProp =
        {
          get = fn x => get "fit-model" boolean x,
          set = fn x => set "fit-model" boolean x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
    end
  end
