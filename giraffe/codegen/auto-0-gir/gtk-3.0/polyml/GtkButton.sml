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
      val getType_ = call (load_sym libgtk "gtk_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_button_new") (FFI.PolyML.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_button_new_from_stock") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (load_sym libgtk "gtk_button_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_button_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val clicked_ = call (load_sym libgtk "gtk_button_clicked") (GtkButtonClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAlignment_ =
        call (load_sym libgtk "gtk_button_get_alignment")
          (
            GtkButtonClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cRef
             &&> FFI.Float.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getEventWindow_ = call (load_sym libgtk "gtk_button_get_event_window") (GtkButtonClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getFocusOnClick_ = call (load_sym libgtk "gtk_button_get_focus_on_click") (GtkButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getImage_ = call (load_sym libgtk "gtk_button_get_image") (GtkButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getImagePosition_ = call (load_sym libgtk "gtk_button_get_image_position") (GtkButtonClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val getLabel_ = call (load_sym libgtk "gtk_button_get_label") (GtkButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRelief_ = call (load_sym libgtk "gtk_button_get_relief") (GtkButtonClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getUseStock_ = call (load_sym libgtk "gtk_button_get_use_stock") (GtkButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getUseUnderline_ = call (load_sym libgtk "gtk_button_get_use_underline") (GtkButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAlignment_ =
        call (load_sym libgtk "gtk_button_set_alignment")
          (
            GtkButtonClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setFocusOnClick_ = call (load_sym libgtk "gtk_button_set_focus_on_click") (GtkButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setImage_ = call (load_sym libgtk "gtk_button_set_image") (GtkButtonClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setImagePosition_ = call (load_sym libgtk "gtk_button_set_image_position") (GtkButtonClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLabel_ = call (load_sym libgtk "gtk_button_set_label") (GtkButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setRelief_ = call (load_sym libgtk "gtk_button_set_relief") (GtkButtonClass.PolyML.cPtr &&> GtkReliefStyle.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseStock_ = call (load_sym libgtk "gtk_button_set_use_stock") (GtkButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseUnderline_ = call (load_sym libgtk "gtk_button_set_use_underline") (GtkButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type position_type_t = GtkPositionType.t
    type relief_style_t = GtkReliefStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkButtonClass.C.fromPtr false) new_ ()
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkButtonClass.C.fromPtr false) newFromStock_ stockId
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkButtonClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkButtonClass.C.fromPtr false) newWithMnemonic_ label
    fun clicked self = (GtkButtonClass.C.withPtr ---> I) clicked_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkButtonClass.C.withPtr
             &&&> FFI.Float.C.withRefVal
             &&&> FFI.Float.C.withRefVal
             ---> FFI.Float.C.fromVal
                   && FFI.Float.C.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & FFI.Float.null
               & FFI.Float.null
            )
      in
        (xalign, yalign)
      end
    fun getEventWindow self = (GtkButtonClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getEventWindow_ self
    fun getFocusOnClick self = (GtkButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnClick_ self
    fun getImage self = (GtkButtonClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getImage_ self
    fun getImagePosition self = (GtkButtonClass.C.withPtr ---> GtkPositionType.C.fromVal) getImagePosition_ self
    fun getLabel self = (GtkButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getRelief self = (GtkButtonClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getRelief_ self
    fun getUseStock self = (GtkButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseStock_ self
    fun getUseUnderline self = (GtkButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun setAlignment self xalign yalign =
      (
        GtkButtonClass.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setFocusOnClick self focusOnClick = (GtkButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setImage self image = (GtkButtonClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setImage_ (self & image)
    fun setImagePosition self position = (GtkButtonClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setImagePosition_ (self & position)
    fun setLabel self label = (GtkButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setLabel_ (self & label)
    fun setRelief self newstyle = (GtkButtonClass.C.withPtr &&&> GtkReliefStyle.C.withVal ---> I) setRelief_ (self & newstyle)
    fun setUseStock self useStock = (GtkButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseStock_ (self & useStock)
    fun setUseUnderline self useUnderline = (GtkButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
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
