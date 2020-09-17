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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_button_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromIconName_ = call (getSymbol "gtk_button_new_from_icon_name") (Utf8.PolyML.cInOptPtr &&> GInt.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_button_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_button_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val clicked_ = call (getSymbol "gtk_button_clicked") (GtkButtonClass.PolyML.cPtr --> cVoid)
      val enter_ = call (getSymbol "gtk_button_enter") (GtkButtonClass.PolyML.cPtr --> cVoid)
      val getAlignment_ =
        call (getSymbol "gtk_button_get_alignment")
          (
            GtkButtonClass.PolyML.cPtr
             &&> GFloat.PolyML.cRef
             &&> GFloat.PolyML.cRef
             --> cVoid
          )
      val getAlwaysShowImage_ = call (getSymbol "gtk_button_get_always_show_image") (GtkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEventWindow_ = call (getSymbol "gtk_button_get_event_window") (GtkButtonClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getFocusOnClick_ = call (getSymbol "gtk_button_get_focus_on_click") (GtkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getImage_ = call (getSymbol "gtk_button_get_image") (GtkButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getImagePosition_ = call (getSymbol "gtk_button_get_image_position") (GtkButtonClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_button_get_label") (GtkButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRelief_ = call (getSymbol "gtk_button_get_relief") (GtkButtonClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getUseStock_ = call (getSymbol "gtk_button_get_use_stock") (GtkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseUnderline_ = call (getSymbol "gtk_button_get_use_underline") (GtkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val leave_ = call (getSymbol "gtk_button_leave") (GtkButtonClass.PolyML.cPtr --> cVoid)
      val pressed_ = call (getSymbol "gtk_button_pressed") (GtkButtonClass.PolyML.cPtr --> cVoid)
      val released_ = call (getSymbol "gtk_button_released") (GtkButtonClass.PolyML.cPtr --> cVoid)
      val setAlignment_ =
        call (getSymbol "gtk_button_set_alignment")
          (
            GtkButtonClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> cVoid
          )
      val setAlwaysShowImage_ = call (getSymbol "gtk_button_set_always_show_image") (GtkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFocusOnClick_ = call (getSymbol "gtk_button_set_focus_on_click") (GtkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setImage_ = call (getSymbol "gtk_button_set_image") (GtkButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setImagePosition_ = call (getSymbol "gtk_button_set_image_position") (GtkButtonClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> cVoid)
      val setLabel_ = call (getSymbol "gtk_button_set_label") (GtkButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setRelief_ = call (getSymbol "gtk_button_set_relief") (GtkButtonClass.PolyML.cPtr &&> GtkReliefStyle.PolyML.cVal --> cVoid)
      val setUseStock_ = call (getSymbol "gtk_button_set_use_stock") (GtkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUseUnderline_ = call (getSymbol "gtk_button_set_use_underline") (GtkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
