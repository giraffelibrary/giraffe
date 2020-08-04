structure GtkFrame :>
  GTK_FRAME
    where type 'a class = 'a GtkFrameClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type shadow_type_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_frame_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_frame_new" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getLabel_ = _import "gtk_frame_get_label" : GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getLabelAlign_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_frame_get_label_align" :
              GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p
               * GFloat.FFI.ref_
               * GFloat.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLabelWidget_ = _import "gtk_frame_get_label_widget" : GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getShadowType_ = _import "gtk_frame_get_shadow_type" : GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p -> GtkShadowType.FFI.val_;
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_frame_set_label" :
              GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelAlign_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_frame_set_label_align" :
              GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_frame_set_label_widget" : GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setShadowType_ = fn x1 & x2 => (_import "gtk_frame_set_shadow_type" : GtkFrameClass.FFI.non_opt GtkFrameClass.FFI.p * GtkShadowType.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkFrameClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label = (Utf8.FFI.withOptPtr 0 ---> GtkFrameClass.FFI.fromPtr false) new_ label
    fun getLabel self = (GtkFrameClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getLabel_ self
    fun getLabelAlign self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkFrameClass.FFI.withPtr false
             &&&> GFloat.FFI.withRefVal
             &&&> GFloat.FFI.withRefVal
             ---> GFloat.FFI.fromVal
                   && GFloat.FFI.fromVal
                   && I
          )
            getLabelAlign_
            (
              self
               & GFloat.null
               & GFloat.null
            )
      in
        (xalign, yalign)
      end
    fun getLabelWidget self = (GtkFrameClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getLabelWidget_ self
    fun getShadowType self = (GtkFrameClass.FFI.withPtr false ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun setLabel self label = (GtkFrameClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setLabelAlign self (xalign, yalign) =
      (
        GtkFrameClass.FFI.withPtr false
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        setLabelAlign_
        (
          self
           & xalign
           & yalign
        )
    fun setLabelWidget self labelWidget = (GtkFrameClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setLabelWidget_ (self & labelWidget)
    fun setShadowType self type' = (GtkFrameClass.FFI.withPtr false &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    local
      open Property
    in
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x,
          new = fn x => new "label" stringOpt x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x,
          new = fn x => new "label-widget" GtkWidgetClass.tOpt x
        }
      val labelXalignProp =
        {
          get = fn x => get "label-xalign" float x,
          set = fn x => set "label-xalign" float x,
          new = fn x => new "label-xalign" float x
        }
      val labelYalignProp =
        {
          get = fn x => get "label-yalign" float x,
          set = fn x => set "label-yalign" float x,
          new = fn x => new "label-yalign" float x
        }
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x,
          new = fn x => new "shadow-type" GtkShadowType.t x
        }
    end
  end
