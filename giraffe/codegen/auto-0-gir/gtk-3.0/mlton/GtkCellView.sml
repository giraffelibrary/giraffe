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
    val getType_ = _import "gtk_cell_view_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_view_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithContext_ = fn x1 & x2 => (_import "gtk_cell_view_new_with_context" : GtkCellAreaClass.FFI.non_opt GtkCellAreaClass.FFI.p * GtkCellAreaContextClass.FFI.non_opt GtkCellAreaContextClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val newWithMarkup_ = _import "mlton_gtk_cell_view_new_with_markup" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithPixbuf_ = _import "gtk_cell_view_new_with_pixbuf" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithText_ = _import "mlton_gtk_cell_view_new_with_text" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getDisplayedRow_ = _import "gtk_cell_view_get_displayed_row" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p -> GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p;
    val getDrawSensitive_ = _import "gtk_cell_view_get_draw_sensitive" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p -> GBool.FFI.val_;
    val getFitModel_ = _import "gtk_cell_view_get_fit_model" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p -> GBool.FFI.val_;
    val getModel_ = _import "gtk_cell_view_get_model" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p -> GtkTreeModelClass.FFI.opt GtkTreeModelClass.FFI.p;
    val getSizeOfRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_view_get_size_of_row" :
              GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p
               * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p
               * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setBackgroundColor_ = fn x1 & x2 => (_import "gtk_cell_view_set_background_color" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setBackgroundRgba_ = fn x1 & x2 => (_import "gtk_cell_view_set_background_rgba" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setDisplayedRow_ = fn x1 & x2 => (_import "gtk_cell_view_set_displayed_row" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p * GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val setDrawSensitive_ = fn x1 & x2 => (_import "gtk_cell_view_set_draw_sensitive" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFitModel_ = fn x1 & x2 => (_import "gtk_cell_view_set_fit_model" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_cell_view_set_model" : GtkCellViewClass.FFI.non_opt GtkCellViewClass.FFI.p * GtkTreeModelClass.FFI.opt GtkTreeModelClass.FFI.p -> unit;) (x1, x2)
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
    fun getDisplayedRow self = (GtkCellViewClass.FFI.withPtr ---> GtkTreePathRecord.FFI.fromOptPtr true) getDisplayedRow_ self
    fun getDrawSensitive self = (GtkCellViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getDrawSensitive_ self
    fun getFitModel self = (GtkCellViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getFitModel_ self
    fun getModel self = (GtkCellViewClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromOptPtr false) getModel_ self
    fun getSizeOfRow self path =
      let
        val requisition & retVal =
          (
            GtkCellViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withPtr
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
    fun setBackgroundColor self color = (GtkCellViewClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setBackgroundColor_ (self & color)
    fun setBackgroundRgba self rgba = (GtkCellViewClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setDisplayedRow self path = (GtkCellViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withOptPtr ---> I) setDisplayedRow_ (self & path)
    fun setDrawSensitive self drawSensitive = (GtkCellViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDrawSensitive_ (self & drawSensitive)
    fun setFitModel self fitModel = (GtkCellViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFitModel_ (self & fitModel)
    fun setModel self model = (GtkCellViewClass.FFI.withPtr &&&> GtkTreeModelClass.FFI.withOptPtr ---> I) setModel_ (self & model)
    local
      open Property
    in
      val backgroundProp =
        {
          set = fn x => set "background" stringOpt x,
          new = fn x => new "background" stringOpt x
        }
      val backgroundGdkProp =
        {
          get = fn x => get "background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "background-gdk" GdkColorRecord.tOpt x,
          new = fn x => new "background-gdk" GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          get = fn x => get "background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "background-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "background-rgba" GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x,
          new = fn x => new "background-set" boolean x
        }
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          new = fn x => new "cell-area" GtkCellAreaClass.tOpt x
        }
      val cellAreaContextProp =
        {
          get = fn x => get "cell-area-context" GtkCellAreaContextClass.tOpt x,
          new = fn x => new "cell-area-context" GtkCellAreaContextClass.tOpt x
        }
      val drawSensitiveProp =
        {
          get = fn x => get "draw-sensitive" boolean x,
          set = fn x => set "draw-sensitive" boolean x,
          new = fn x => new "draw-sensitive" boolean x
        }
      val fitModelProp =
        {
          get = fn x => get "fit-model" boolean x,
          set = fn x => set "fit-model" boolean x,
          new = fn x => new "fit-model" boolean x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x,
          new = fn x => new "model" GtkTreeModelClass.tOpt x
        }
    end
  end
