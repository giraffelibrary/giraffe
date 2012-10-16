structure GtkCellView :>
  GTK_CELL_VIEW
    where type 'a class_t = 'a GtkCellViewClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type treepathrecord_t = GtkTreePathRecord.t
    where type 'a cellareaclass_t = 'a GtkCellAreaClass.t
    where type 'a cellareacontextclass_t = 'a GtkCellAreaContextClass.t
    where type 'a treemodelclass_t = 'a GtkTreeModelClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_view_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_cell_view_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithContext_ = call (load_sym libgtk "gtk_cell_view_new_with_context") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newWithMarkup_ = call (load_sym libgtk "gtk_cell_view_new_with_markup") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithPixbuf_ = call (load_sym libgtk "gtk_cell_view_new_with_pixbuf") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newWithText_ = call (load_sym libgtk "gtk_cell_view_new_with_text") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getDisplayedRow_ = call (load_sym libgtk "gtk_cell_view_get_displayed_row") (GObjectObjectClass.PolyML.PTR --> GtkTreePathRecord.PolyML.PTR)
      val getDrawSensitive_ = call (load_sym libgtk "gtk_cell_view_get_draw_sensitive") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getFitModel_ = call (load_sym libgtk "gtk_cell_view_get_fit_model") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getModel_ = call (load_sym libgtk "gtk_cell_view_get_model") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setBackgroundColor_ = call (load_sym libgtk "gtk_cell_view_set_background_color") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setBackgroundRgba_ = call (load_sym libgtk "gtk_cell_view_set_background_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setDisplayedRow_ = call (load_sym libgtk "gtk_cell_view_set_displayed_row") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setDrawSensitive_ = call (load_sym libgtk "gtk_cell_view_set_draw_sensitive") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setFitModel_ = call (load_sym libgtk "gtk_cell_view_set_fit_model") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setModel_ = call (load_sym libgtk "gtk_cell_view_set_model") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCellViewClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type treepathrecord_t = GtkTreePathRecord.t
    type 'a cellareaclass_t = 'a GtkCellAreaClass.t
    type 'a cellareacontextclass_t = 'a GtkCellAreaContextClass.t
    type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellViewClass.C.fromPtr false) new_ ()
    fun newWithContext area context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithContext_ (area & context)
    fun newWithMarkup markup = (FFI.String.withConstPtr ---> GtkCellViewClass.C.fromPtr false) newWithMarkup_ markup
    fun newWithPixbuf pixbuf = (GObjectObjectClass.C.withPtr ---> GtkCellViewClass.C.fromPtr false) newWithPixbuf_ pixbuf
    fun newWithText text = (FFI.String.withConstPtr ---> GtkCellViewClass.C.fromPtr false) newWithText_ text
    fun getDisplayedRow self = (GObjectObjectClass.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) getDisplayedRow_ self
    fun getDrawSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getDrawSensitive_ self
    fun getFitModel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getFitModel_ self
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun setBackgroundColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackgroundColor_ (self & color)
    fun setBackgroundRgba self rgba = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setDisplayedRow self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withOptPtr ---> I) setDisplayedRow_ (self & path)
    fun setDrawSensitive self drawSensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setDrawSensitive_ (self & drawSensitive)
    fun setFitModel self fitModel = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setFitModel_ (self & fitModel)
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
