structure GtkStyle :>
  GTK_STYLE
    where type 'a class_t = 'a GtkStyleClass.t
    where type iconsetrecord_t = GtkIconSetRecord.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type textdirection_t = GtkTextDirection.t
    where type iconsourcerecord_t = GtkIconSourceRecord.t
    where type statetype_t = GtkStateType.t
    where type 'a stylecontextclass_t = 'a GtkStyleContextClass.t =
  struct
    val getType_ = _import "gtk_style_get_type" : unit -> GObjectType.C.val_;
    val applyDefaultBackground_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gtk_style_apply_default_background" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkStateType.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val copy_ = _import "gtk_style_copy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val detach_ = _import "gtk_style_detach" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val hasContext_ = _import "gtk_style_has_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val lookupColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_lookup_color" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GdkColorRecord.C.notnull GdkColorRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val lookupIconSet_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_lookup_icon_set" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val renderIcon_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & (x7, x8) =>
          (
            _import "mlton_gtk_style_render_icon" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p
               * GtkTextDirection.C.val_
               * GtkStateType.C.val_
               * FFI.Int.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setBackground_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_set_background" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkStateType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkStyleClass.t
    type iconsetrecord_t = GtkIconSetRecord.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type textdirection_t = GtkTextDirection.t
    type iconsourcerecord_t = GtkIconSourceRecord.t
    type statetype_t = GtkStateType.t
    type 'a stylecontextclass_t = 'a GtkStyleContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun applyDefaultBackground self cr window stateType x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        applyDefaultBackground_
        (
          self
           & cr
           & window
           & stateType
           & x
           & y
           & width
           & height
        )
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkStyleClass.C.fromPtr true) copy_ self
    fun detach self = (GObjectObjectClass.C.withPtr ---> I) detach_ self
    fun hasContext self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasContext_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> GdkColorRecord.C.withNewPtr
             ---> GdkColorRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            lookupColor_
            (
              self
               & colorName
               & ()
            )
      in
        if retVal then SOME color else NONE
      end
    fun lookupIconSet self stockId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkIconSetRecord.C.fromPtr false) lookupIconSet_ (self & stockId)
    fun renderIcon self source direction state size widget detail =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkIconSourceRecord.C.withPtr
         &&&> GtkTextDirection.C.withVal
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        renderIcon_
        (
          self
           & source
           & direction
           & state
           & size
           & widget
           & detail
        )
    fun setBackground self window stateType =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkStateType.C.withVal
         ---> I
      )
        setBackground_
        (
          self
           & window
           & stateType
        )
    local
      open ClosureMarshal Signal
    in
      fun realizeSig f = signal "realize" (void ---> ret_void) f
      fun unrealizeSig f = signal "unrealize" (void ---> ret_void) f
    end
    local
      open Property
    in
      val contextProp =
        {
          get = fn x => get "context" GtkStyleContextClass.tOpt x,
          set = fn x => set "context" GtkStyleContextClass.tOpt x
        }
    end
  end
