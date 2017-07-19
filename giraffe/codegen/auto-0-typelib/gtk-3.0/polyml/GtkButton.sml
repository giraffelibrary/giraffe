structure GtkButton :>
  GTK_BUTTON
    where type 'a class = 'a GtkButtonClass.class
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
      val newFromStock_ = call (getSymbol "gtk_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_button_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_button_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val clicked_ = call (getSymbol "gtk_button_clicked") (GtkButtonClass.PolyML.cPtr --> cVoid)
      val getAlignment_ =
        call (getSymbol "gtk_button_get_alignment")
          (
            GtkButtonClass.PolyML.cPtr
             &&> GFloat.PolyML.cRef
             &&> GFloat.PolyML.cRef
             --> cVoid
          )
      val getEventWindow_ = call (getSymbol "gtk_button_get_event_window") (GtkButtonClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getFocusOnClick_ = call (getSymbol "gtk_button_get_focus_on_click") (GtkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getImage_ = call (getSymbol "gtk_button_get_image") (GtkButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getImagePosition_ = call (getSymbol "gtk_button_get_image_position") (GtkButtonClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_button_get_label") (GtkButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRelief_ = call (getSymbol "gtk_button_get_relief") (GtkButtonClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getUseStock_ = call (getSymbol "gtk_button_get_use_stock") (GtkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseUnderline_ = call (getSymbol "gtk_button_get_use_underline") (GtkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAlignment_ =
        call (getSymbol "gtk_button_set_alignment")
          (
            GtkButtonClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> cVoid
          )
      val setFocusOnClick_ = call (getSymbol "gtk_button_set_focus_on_click") (GtkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setImage_ = call (getSymbol "gtk_button_set_image") (GtkButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setImagePosition_ = call (getSymbol "gtk_button_set_image_position") (GtkButtonClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> cVoid)
      val setLabel_ = call (getSymbol "gtk_button_set_label") (GtkButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setRelief_ = call (getSymbol "gtk_button_set_relief") (GtkButtonClass.PolyML.cPtr &&> GtkReliefStyle.PolyML.cVal --> cVoid)
      val setUseStock_ = call (getSymbol "gtk_button_set_use_stock") (GtkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUseUnderline_ = call (getSymbol "gtk_button_set_use_underline") (GtkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type position_type_t = GtkPositionType.t
    type relief_style_t = GtkReliefStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkButtonClass.FFI.fromPtr false) new_ ()
    fun newFromStock stockId = (Utf8.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) newFromStock_ stockId
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) newWithMnemonic_ label
    fun clicked self = (GtkButtonClass.FFI.withPtr ---> I) clicked_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkButtonClass.FFI.withPtr
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
    fun getEventWindow self = (GtkButtonClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getEventWindow_ self
    fun getFocusOnClick self = (GtkButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getImage self = (GtkButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getImage_ self
    fun getImagePosition self = (GtkButtonClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getImagePosition_ self
    fun getLabel self = (GtkButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getRelief self = (GtkButtonClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getRelief_ self
    fun getUseStock self = (GtkButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseStock_ self
    fun getUseUnderline self = (GtkButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setAlignment self (xalign, yalign) =
      (
        GtkButtonClass.FFI.withPtr
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
    fun setFocusOnClick self focusOnClick = (GtkButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setImage self image = (GtkButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setImage_ (self & image)
    fun setImagePosition self position = (GtkButtonClass.FFI.withPtr &&&> GtkPositionType.FFI.withVal ---> I) setImagePosition_ (self & position)
    fun setLabel self label = (GtkButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & label)
    fun setRelief self newstyle = (GtkButtonClass.FFI.withPtr &&&> GtkReliefStyle.FFI.withVal ---> I) setRelief_ (self & newstyle)
    fun setUseStock self useStock = (GtkButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseStock_ (self & useStock)
    fun setUseUnderline self useUnderline = (GtkButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
      open Property
    in
      val focusOnClickProp =
        {
          get = fn x => get "focus-on-click" boolean x,
          set = fn x => set "focus-on-click" boolean x
        }
      val imageProp =
        {
          get = fn x => get "image" GtkWidgetClass.tOpt x,
          set = fn x => set "image" GtkWidgetClass.tOpt x
        }
      val imagePositionProp =
        {
          get = fn x => get "image-position" GtkPositionType.t x,
          set = fn x => set "image-position" GtkPositionType.t x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val reliefProp =
        {
          get = fn x => get "relief" GtkReliefStyle.t x,
          set = fn x => set "relief" GtkReliefStyle.t x
        }
      val useStockProp =
        {
          get = fn x => get "use-stock" boolean x,
          set = fn x => set "use-stock" boolean x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
    end
  end
