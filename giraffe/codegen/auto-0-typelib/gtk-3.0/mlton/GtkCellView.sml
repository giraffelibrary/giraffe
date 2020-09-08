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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellViewClass.FFI.fromPtr false) new_ ()
    fun newWithContext (area, context) = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellAreaContextClass.FFI.withPtr false ---> GtkCellViewClass.FFI.fromPtr false) newWithContext_ (area & context)
    fun newWithMarkup markup = (Utf8.FFI.withPtr 0 ---> GtkCellViewClass.FFI.fromPtr false) newWithMarkup_ markup
    fun newWithPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr false ---> GtkCellViewClass.FFI.fromPtr false) newWithPixbuf_ pixbuf
    fun newWithText text = (Utf8.FFI.withPtr 0 ---> GtkCellViewClass.FFI.fromPtr false) newWithText_ text
    fun getDisplayedRow self = (GtkCellViewClass.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromOptPtr true) getDisplayedRow_ self
    fun getDrawSensitive self = (GtkCellViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDrawSensitive_ self
    fun getFitModel self = (GtkCellViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFitModel_ self
    fun getModel self = (GtkCellViewClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromOptPtr false) getModel_ self
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
