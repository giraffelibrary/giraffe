structure GtkCellView :>
  GTK_CELL_VIEW
    where type 'a class = 'a GtkCellViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type tree_path_t = GtkTreePathRecord.t
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a cell_area_context_class = 'a GtkCellAreaContextClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    val getType_ = _import "gtk_cell_view_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_view_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithContext_ = fn x1 & x2 => (_import "gtk_cell_view_new_with_context" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val newWithMarkup_ = _import "mlton_gtk_cell_view_new_with_markup" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithPixbuf_ = _import "gtk_cell_view_new_with_pixbuf" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithText_ = _import "mlton_gtk_cell_view_new_with_text" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getDisplayedRow_ = _import "gtk_cell_view_get_displayed_row" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p -> GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p;
    val getDrawSensitive_ = _import "gtk_cell_view_get_draw_sensitive" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p -> GBool.FFI.val_;
    val getFitModel_ = _import "gtk_cell_view_get_fit_model" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p -> GBool.FFI.val_;
    val getModel_ = _import "gtk_cell_view_get_model" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p -> GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p;
    val setBackgroundColor_ = fn x1 & x2 => (_import "gtk_cell_view_set_background_color" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setBackgroundRgba_ = fn x1 & x2 => (_import "gtk_cell_view_set_background_rgba" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setDisplayedRow_ = fn x1 & x2 => (_import "gtk_cell_view_set_displayed_row" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p * unit GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val setDrawSensitive_ = fn x1 & x2 => (_import "gtk_cell_view_set_draw_sensitive" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFitModel_ = fn x1 & x2 => (_import "gtk_cell_view_set_fit_model" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_cell_view_set_model" : GtkCellViewClass.FFI.notnull GtkCellViewClass.FFI.p * unit GtkTreeModelClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkCellViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type tree_path_t = GtkTreePathRecord.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a cell_area_context_class = 'a GtkCellAreaContextClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellViewClass.FFI.fromPtr false) new_ ()
    fun newWithContext (area, context) = (GtkCellAreaClass.FFI.withPtr &&&> GtkCellAreaContextClass.FFI.withPtr ---> GtkCellViewClass.FFI.fromPtr false) newWithContext_ (area & context)
    fun newWithMarkup markup = (Utf8.FFI.withPtr ---> GtkCellViewClass.FFI.fromPtr false) newWithMarkup_ markup
    fun newWithPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr ---> GtkCellViewClass.FFI.fromPtr false) newWithPixbuf_ pixbuf
    fun newWithText text = (Utf8.FFI.withPtr ---> GtkCellViewClass.FFI.fromPtr false) newWithText_ text
    fun getDisplayedRow self = (GtkCellViewClass.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) getDisplayedRow_ self
    fun getDrawSensitive self = (GtkCellViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getDrawSensitive_ self
    fun getFitModel self = (GtkCellViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getFitModel_ self
    fun getModel self = (GtkCellViewClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun setBackgroundColor self color = (GtkCellViewClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setBackgroundColor_ (self & color)
    fun setBackgroundRgba self rgba = (GtkCellViewClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setDisplayedRow self path = (GtkCellViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withOptPtr ---> I) setDisplayedRow_ (self & path)
    fun setDrawSensitive self drawSensitive = (GtkCellViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDrawSensitive_ (self & drawSensitive)
    fun setFitModel self fitModel = (GtkCellViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFitModel_ (self & fitModel)
    fun setModel self model = (GtkCellViewClass.FFI.withPtr &&&> GtkTreeModelClass.FFI.withOptPtr ---> I) setModel_ (self & model)
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
