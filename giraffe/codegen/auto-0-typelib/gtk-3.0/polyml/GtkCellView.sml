structure GtkCellView :>
  GTK_CELL_VIEW
    where type 'a class = 'a GtkCellViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type requisition_t = GtkRequisitionRecord.t
    where type tree_path_t = GtkTreePathRecord.t
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a cell_area_context_class = 'a GtkCellAreaContextClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_view_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_view_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithContext_ = call (getSymbol "gtk_cell_view_new_with_context") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellAreaContextClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMarkup_ = call (getSymbol "gtk_cell_view_new_with_markup") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithPixbuf_ = call (getSymbol "gtk_cell_view_new_with_pixbuf") (GdkPixbufPixbufClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithText_ = call (getSymbol "gtk_cell_view_new_with_text") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getDisplayedRow_ = call (getSymbol "gtk_cell_view_get_displayed_row") (GtkCellViewClass.PolyML.cPtr --> GtkTreePathRecord.PolyML.cOptPtr)
      val getDrawSensitive_ = call (getSymbol "gtk_cell_view_get_draw_sensitive") (GtkCellViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFitModel_ = call (getSymbol "gtk_cell_view_get_fit_model") (GtkCellViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getModel_ = call (getSymbol "gtk_cell_view_get_model") (GtkCellViewClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cOptPtr)
      val getSizeOfRow_ =
        call (getSymbol "gtk_cell_view_get_size_of_row")
          (
            GtkCellViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkRequisitionRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val setBackgroundColor_ = call (getSymbol "gtk_cell_view_set_background_color") (GtkCellViewClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setBackgroundRgba_ = call (getSymbol "gtk_cell_view_set_background_rgba") (GtkCellViewClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setDisplayedRow_ = call (getSymbol "gtk_cell_view_set_displayed_row") (GtkCellViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cOptPtr --> cVoid)
      val setDrawSensitive_ = call (getSymbol "gtk_cell_view_set_draw_sensitive") (GtkCellViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFitModel_ = call (getSymbol "gtk_cell_view_set_fit_model") (GtkCellViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setModel_ = call (getSymbol "gtk_cell_view_set_model") (GtkCellViewClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkCellViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type requisition_t = GtkRequisitionRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a cell_area_context_class = 'a GtkCellAreaContextClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellViewClass.FFI.fromPtr false) new_ ()
    fun newWithContext (area, context) = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellAreaContextClass.FFI.withPtr false ---> GtkCellViewClass.FFI.fromPtr false) newWithContext_ (area & context) before GtkCellAreaClass.FFI.touchPtr area before GtkCellAreaContextClass.FFI.touchPtr context
    fun newWithMarkup markup = (Utf8.FFI.withPtr 0 ---> GtkCellViewClass.FFI.fromPtr false) newWithMarkup_ markup before Utf8.FFI.touchPtr markup
    fun newWithPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr false ---> GtkCellViewClass.FFI.fromPtr false) newWithPixbuf_ pixbuf before GdkPixbufPixbufClass.FFI.touchPtr pixbuf
    fun newWithText text = (Utf8.FFI.withPtr 0 ---> GtkCellViewClass.FFI.fromPtr false) newWithText_ text before Utf8.FFI.touchPtr text
    fun getDisplayedRow self = (GtkCellViewClass.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromOptPtr true) getDisplayedRow_ self
    fun getDrawSensitive self = (GtkCellViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDrawSensitive_ self
    fun getFitModel self = (GtkCellViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFitModel_ self
    fun getModel self = (GtkCellViewClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromOptPtr false) getModel_ self before GtkCellViewClass.FFI.touchPtr self
    fun getSizeOfRow self path =
      let
        val requisition & retVal =
          (
            GtkCellViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withPtr false
             &&&> GtkRequisitionRecord.FFI.withNewPtr
             ---> GtkRequisitionRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            getSizeOfRow_
            (
              self
               & path
               & ()
            )
      in
        if retVal then SOME requisition else NONE
      end
    fun setBackgroundColor self color = (GtkCellViewClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setBackgroundColor_ (self & color)
    fun setBackgroundRgba self rgba = (GtkCellViewClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setBackgroundRgba_ (self & rgba)
    fun setDisplayedRow self path = (GtkCellViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withOptPtr false ---> I) setDisplayedRow_ (self & path)
    fun setDrawSensitive self drawSensitive = (GtkCellViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDrawSensitive_ (self & drawSensitive)
    fun setFitModel self fitModel = (GtkCellViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFitModel_ (self & fitModel)
    fun setModel self model = (GtkCellViewClass.FFI.withPtr false &&&> GtkTreeModelClass.FFI.withOptPtr false ---> I) setModel_ (self & model)
    local
      open ValueAccessor
    in
      val backgroundProp =
        {
          name = "background",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val backgroundGdkProp =
        {
          name = "background-gdk",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          name = "background-rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          name = "background-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val cellAreaProp =
        {
          name = "cell-area",
          gtype = fn () => C.gtype GtkCellAreaClass.tOpt (),
          get = fn x => fn () => C.get GtkCellAreaClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellAreaClass.tOpt x
        }
      val cellAreaContextProp =
        {
          name = "cell-area-context",
          gtype = fn () => C.gtype GtkCellAreaContextClass.tOpt (),
          get = fn x => fn () => C.get GtkCellAreaContextClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellAreaContextClass.tOpt x
        }
      val drawSensitiveProp =
        {
          name = "draw-sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val fitModelProp =
        {
          name = "fit-model",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val modelProp =
        {
          name = "model",
          gtype = fn () => C.gtype GtkTreeModelClass.tOpt (),
          get = fn x => fn () => C.get GtkTreeModelClass.tOpt x,
          set = fn x => C.set GtkTreeModelClass.tOpt x,
          init = fn x => C.set GtkTreeModelClass.tOpt x
        }
    end
  end
