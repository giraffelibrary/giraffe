structure GtkButton :>
  GTK_BUTTON
    where type 'a class = 'a GtkButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type position_type_t = GtkPositionType.t
    where type relief_style_t = GtkReliefStyle.t =
  struct
    val getType_ = _import "gtk_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_button_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromIconName_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_button_new_from_icon_name" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_button_new_from_stock" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithLabel_ = _import "mlton_gtk_button_new_with_label" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_button_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val clicked_ = _import "gtk_button_clicked" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> unit;
    val enter_ = _import "gtk_button_enter" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> unit;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_get_alignment" :
              GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p
               * GFloat.FFI.ref_
               * GFloat.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAlwaysShowImage_ = _import "gtk_button_get_always_show_image" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GBool.FFI.val_;
    val getEventWindow_ = _import "gtk_button_get_event_window" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getFocusOnClick_ = _import "gtk_button_get_focus_on_click" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GBool.FFI.val_;
    val getImage_ = _import "gtk_button_get_image" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getImagePosition_ = _import "gtk_button_get_image_position" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GtkPositionType.FFI.val_;
    val getLabel_ = _import "gtk_button_get_label" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getRelief_ = _import "gtk_button_get_relief" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GtkReliefStyle.FFI.val_;
    val getUseStock_ = _import "gtk_button_get_use_stock" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GBool.FFI.val_;
    val getUseUnderline_ = _import "gtk_button_get_use_underline" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> GBool.FFI.val_;
    val leave_ = _import "gtk_button_leave" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> unit;
    val pressed_ = _import "gtk_button_pressed" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> unit;
    val released_ = _import "gtk_button_released" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p -> unit;
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_set_alignment" :
              GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlwaysShowImage_ = fn x1 & x2 => (_import "gtk_button_set_always_show_image" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_button_set_focus_on_click" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setImage_ = fn x1 & x2 => (_import "gtk_button_set_image" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setImagePosition_ = fn x1 & x2 => (_import "gtk_button_set_image_position" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p * GtkPositionType.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_button_set_label" :
              GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRelief_ = fn x1 & x2 => (_import "gtk_button_set_relief" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p * GtkReliefStyle.FFI.val_ -> unit;) (x1, x2)
    val setUseStock_ = fn x1 & x2 => (_import "gtk_button_set_use_stock" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_button_set_use_underline" : GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type position_type_t = GtkPositionType.t
    type relief_style_t = GtkReliefStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkButtonClass.FFI.fromPtr false) new_ ()
    fun newFromIconName (iconName, size) = (Utf8.FFI.withOptPtr 0 &&&> GInt.FFI.withVal ---> GtkButtonClass.FFI.fromPtr false) newFromIconName_ (iconName & size) before Utf8.FFI.touchOptPtr iconName
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkButtonClass.FFI.fromPtr false) newFromStock_ stockId before Utf8.FFI.touchPtr stockId
    fun newWithLabel label = (Utf8.FFI.withPtr 0 ---> GtkButtonClass.FFI.fromPtr false) newWithLabel_ label before Utf8.FFI.touchPtr label
    fun newWithMnemonic label = (Utf8.FFI.withPtr 0 ---> GtkButtonClass.FFI.fromPtr false) newWithMnemonic_ label before Utf8.FFI.touchPtr label
    fun clicked self = (GtkButtonClass.FFI.withPtr false ---> I) clicked_ self
    fun enter self = (GtkButtonClass.FFI.withPtr false ---> I) enter_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkButtonClass.FFI.withPtr false
             &&&> GFloat.FFI.withRefVal
             &&&> GFloat.FFI.withRefVal
             ---> GFloat.FFI.fromVal
                   && GFloat.FFI.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & GFloat.null
               & GFloat.null
            )
      in
        (xalign, yalign)
      end
    fun getAlwaysShowImage self = (GtkButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAlwaysShowImage_ self
    fun getEventWindow self = (GtkButtonClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getEventWindow_ self before GtkButtonClass.FFI.touchPtr self
    fun getFocusOnClick self = (GtkButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getImage self = (GtkButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getImage_ self before GtkButtonClass.FFI.touchPtr self
    fun getImagePosition self = (GtkButtonClass.FFI.withPtr false ---> GtkPositionType.FFI.fromVal) getImagePosition_ self
    fun getLabel self = (GtkButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLabel_ self before GtkButtonClass.FFI.touchPtr self
    fun getRelief self = (GtkButtonClass.FFI.withPtr false ---> GtkReliefStyle.FFI.fromVal) getRelief_ self
    fun getUseStock self = (GtkButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseStock_ self
    fun getUseUnderline self = (GtkButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun leave self = (GtkButtonClass.FFI.withPtr false ---> I) leave_ self
    fun pressed self = (GtkButtonClass.FFI.withPtr false ---> I) pressed_ self
    fun released self = (GtkButtonClass.FFI.withPtr false ---> I) released_ self
    fun setAlignment self (xalign, yalign) =
      (
        GtkButtonClass.FFI.withPtr false
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setAlwaysShowImage self alwaysShow = (GtkButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setFocusOnClick self focusOnClick = (GtkButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setImage self image = (GtkButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setImage_ (self & image)
    fun setImagePosition self position = (GtkButtonClass.FFI.withPtr false &&&> GtkPositionType.FFI.withVal ---> I) setImagePosition_ (self & position)
    fun setLabel self label = (GtkButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setLabel_ (self & label)
    fun setRelief self relief = (GtkButtonClass.FFI.withPtr false &&&> GtkReliefStyle.FFI.withVal ---> I) setRelief_ (self & relief)
    fun setUseStock self useStock = (GtkButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseStock_ (self & useStock)
    fun setUseUnderline self useUnderline = (GtkButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
      fun enterSig f = signal "enter" (void ---> ret_void) f
      fun leaveSig f = signal "leave" (void ---> ret_void) f
      fun pressedSig f = signal "pressed" (void ---> ret_void) f
      fun releasedSig f = signal "released" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val alwaysShowImageProp =
        {
          name = "always-show-image",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val imageProp =
        {
          name = "image",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val imagePositionProp =
        {
          name = "image-position",
          gtype = fn () => C.gtype GtkPositionType.t (),
          get = fn x => fn () => C.get GtkPositionType.t x,
          set = fn x => C.set GtkPositionType.t x,
          init = fn x => C.set GtkPositionType.t x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val reliefProp =
        {
          name = "relief",
          gtype = fn () => C.gtype GtkReliefStyle.t (),
          get = fn x => fn () => C.get GtkReliefStyle.t x,
          set = fn x => C.set GtkReliefStyle.t x,
          init = fn x => C.set GtkReliefStyle.t x
        }
      val useStockProp =
        {
          name = "use-stock",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val useUnderlineProp =
        {
          name = "use-underline",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val xalignProp =
        {
          name = "xalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val yalignProp =
        {
          name = "yalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
    end
  end
