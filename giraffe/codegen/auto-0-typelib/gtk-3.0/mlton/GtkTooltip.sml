structure GtkTooltip :>
  GTK_TOOLTIP
    where type 'a class_t = 'a GtkTooltipClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_tooltip_get_type" : unit -> GObjectType.C.val_;
    val triggerTooltipQuery_ = _import "gtk_tooltip_trigger_tooltip_query" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setCustom_ = fn x1 & x2 => (_import "gtk_tooltip_set_custom" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gtk_tooltip_set_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setIconFromGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tooltip_set_icon_from_gicon" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconFromIconName_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_tooltip_set_icon_from_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIconFromStock_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_tooltip_set_icon_from_stock" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tooltip_set_markup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tooltip_set_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTipArea_ = fn x1 & x2 => (_import "gtk_tooltip_set_tip_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkTooltipClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun triggerTooltipQuery display = (GObjectObjectClass.C.withPtr ---> I) triggerTooltipQuery_ display
    fun setCustom self customWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setCustom_ (self & customWidget)
    fun setIcon self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIcon_ (self & pixbuf)
    fun setIconFromGicon self gicon size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setIconFromGicon_
        (
          self
           & gicon
           & size
        )
    fun setIconFromIconName self iconName size =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setIconFromIconName_
        (
          self
           & iconName
           & size
        )
    fun setIconFromStock self stockId size =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setIconFromStock_
        (
          self
           & stockId
           & size
        )
    fun setMarkup self markup = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setMarkup_ (self & markup)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setText_ (self & text)
    fun setTipArea self rect = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) setTipArea_ (self & rect)
  end
