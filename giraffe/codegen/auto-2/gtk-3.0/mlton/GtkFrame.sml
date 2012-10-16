structure GtkFrame :>
  GTK_FRAME
    where type 'a class_t = 'a GtkFrameClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type shadowtype_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_frame_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_frame_new" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLabel_ = _import "gtk_frame_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getLabelAlign_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_frame_get_label_align" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.ref_
               * FFI.Float.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLabelWidget_ = _import "gtk_frame_get_label_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getShadowType_ = _import "gtk_frame_get_shadow_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkShadowType.C.val_;
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_frame_set_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.val_
               * FFI.Float.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_frame_set_label_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setShadowType_ = fn x1 & x2 => (_import "gtk_frame_set_shadow_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkShadowType.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkFrameClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type shadowtype_t = GtkShadowType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label = (FFI.String.withConstPtr ---> GtkFrameClass.C.fromPtr false) new_ label
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getLabel_ self
    fun getLabelAlign self =
      let
        val xalign
         & yalign
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Float.withRefVal
             &&&> FFI.Float.withRefVal
             ---> FFI.Float.fromVal
                   && FFI.Float.fromVal
                   && I
          )
            getLabelAlign_
            (
              self
               & 0.0
               & 0.0
            )
      in
        (xalign, yalign)
      end
    fun getLabelWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getShadowType self = (GObjectObjectClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setLabel_ (self & label)
    fun setLabelAlign self xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
         ---> I
      )
        setLabelAlign_
        (
          self
           & xalign
           & yalign
        )
    fun setLabelWidget self labelWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setShadowType self type' = (GObjectObjectClass.C.withPtr &&&> GtkShadowType.C.withVal ---> I) setShadowType_ (self & type')
    local
      open Property
    in
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x
        }
      val labelXalignProp =
        {
          get = fn x => get "label-xalign" float x,
          set = fn x => set "label-xalign" float x
        }
      val labelYalignProp =
        {
          get = fn x => get "label-yalign" float x,
          set = fn x => set "label-yalign" float x
        }
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x
        }
    end
  end
