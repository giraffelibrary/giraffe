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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_view_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_cell_view_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithContext_ = call (load_sym libgtk "gtk_cell_view_new_with_context") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellAreaContextClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMarkup_ = call (load_sym libgtk "gtk_cell_view_new_with_markup") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithPixbuf_ = call (load_sym libgtk "gtk_cell_view_new_with_pixbuf") (GdkPixbufPixbufClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithText_ = call (load_sym libgtk "gtk_cell_view_new_with_text") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getDisplayedRow_ = call (load_sym libgtk "gtk_cell_view_get_displayed_row") (GtkCellViewClass.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val getDrawSensitive_ = call (load_sym libgtk "gtk_cell_view_get_draw_sensitive") (GtkCellViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFitModel_ = call (load_sym libgtk "gtk_cell_view_get_fit_model") (GtkCellViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getModel_ = call (load_sym libgtk "gtk_cell_view_get_model") (GtkCellViewClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val setBackgroundColor_ = call (load_sym libgtk "gtk_cell_view_set_background_color") (GtkCellViewClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setBackgroundRgba_ = call (load_sym libgtk "gtk_cell_view_set_background_rgba") (GtkCellViewClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setDisplayedRow_ = call (load_sym libgtk "gtk_cell_view_set_displayed_row") (GtkCellViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setDrawSensitive_ = call (load_sym libgtk "gtk_cell_view_set_draw_sensitive") (GtkCellViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFitModel_ = call (load_sym libgtk "gtk_cell_view_set_fit_model") (GtkCellViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setModel_ = call (load_sym libgtk "gtk_cell_view_set_model") (GtkCellViewClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkCellViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type tree_path_t = GtkTreePathRecord.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a cell_area_context_class = 'a GtkCellAreaContextClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellViewClass.C.fromPtr false) new_ ()
    fun newWithContext area context = (GtkCellAreaClass.C.withPtr &&&> GtkCellAreaContextClass.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithContext_ (area & context)
    fun newWithMarkup markup = (Utf8.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithMarkup_ markup
    fun newWithPixbuf pixbuf = (GdkPixbufPixbufClass.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithPixbuf_ pixbuf
    fun newWithText text = (Utf8.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithText_ text
    fun getDisplayedRow self = (GtkCellViewClass.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) getDisplayedRow_ self
    fun getDrawSensitive self = (GtkCellViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawSensitive_ self
    fun getFitModel self = (GtkCellViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getFitModel_ self
    fun getModel self = (GtkCellViewClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun setBackgroundColor self color = (GtkCellViewClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackgroundColor_ (self & color)
    fun setBackgroundRgba self rgba = (GtkCellViewClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setDisplayedRow self path = (GtkCellViewClass.C.withPtr &&&> GtkTreePathRecord.C.withOptPtr ---> I) setDisplayedRow_ (self & path)
    fun setDrawSensitive self drawSensitive = (GtkCellViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDrawSensitive_ (self & drawSensitive)
    fun setFitModel self fitModel = (GtkCellViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFitModel_ (self & fitModel)
    fun setModel self model = (GtkCellViewClass.C.withPtr &&&> GtkTreeModelClass.C.withOptPtr ---> I) setModel_ (self & model)
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
