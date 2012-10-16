structure GtkButton :>
  GTK_BUTTON
    where type 'a class_t = 'a GtkButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type positiontype_t = GtkPositionType.t
    where type reliefstyle_t = GtkReliefStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_button_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newFromStock_ = call (load_sym libgtk "gtk_button_new_from_stock") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithLabel_ = call (load_sym libgtk "gtk_button_new_with_label") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_button_new_with_mnemonic") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val clicked_ = call (load_sym libgtk "gtk_button_clicked") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAlignment_ =
        call (load_sym libgtk "gtk_button_get_alignment")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Float.REF
             &&> FFI.PolyML.Float.REF
             --> FFI.PolyML.VOID
          )
      val getEventWindow_ = call (load_sym libgtk "gtk_button_get_event_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFocusOnClick_ = call (load_sym libgtk "gtk_button_get_focus_on_click") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getImage_ = call (load_sym libgtk "gtk_button_get_image") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getImagePosition_ = call (load_sym libgtk "gtk_button_get_image_position") (GObjectObjectClass.PolyML.PTR --> GtkPositionType.PolyML.VAL)
      val getLabel_ = call (load_sym libgtk "gtk_button_get_label") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getRelief_ = call (load_sym libgtk "gtk_button_get_relief") (GObjectObjectClass.PolyML.PTR --> GtkReliefStyle.PolyML.VAL)
      val getUseStock_ = call (load_sym libgtk "gtk_button_get_use_stock") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getUseUnderline_ = call (load_sym libgtk "gtk_button_get_use_underline") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setAlignment_ =
        call (load_sym libgtk "gtk_button_set_alignment")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             --> FFI.PolyML.VOID
          )
      val setFocusOnClick_ = call (load_sym libgtk "gtk_button_set_focus_on_click") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setImage_ = call (load_sym libgtk "gtk_button_set_image") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setImagePosition_ = call (load_sym libgtk "gtk_button_set_image_position") (GObjectObjectClass.PolyML.PTR &&> GtkPositionType.PolyML.VAL --> FFI.PolyML.VOID)
      val setLabel_ = call (load_sym libgtk "gtk_button_set_label") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setRelief_ = call (load_sym libgtk "gtk_button_set_relief") (GObjectObjectClass.PolyML.PTR &&> GtkReliefStyle.PolyML.VAL --> FFI.PolyML.VOID)
      val setUseStock_ = call (load_sym libgtk "gtk_button_set_use_stock") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setUseUnderline_ = call (load_sym libgtk "gtk_button_set_use_underline") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type positiontype_t = GtkPositionType.t
    type reliefstyle_t = GtkReliefStyle.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkButtonClass.C.fromPtr false) new_ ()
    fun newFromStock stockId = (FFI.String.withConstPtr ---> GtkButtonClass.C.fromPtr false) newFromStock_ stockId
    fun newWithLabel label = (FFI.String.withConstPtr ---> GtkButtonClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (FFI.String.withConstPtr ---> GtkButtonClass.C.fromPtr false) newWithMnemonic_ label
    fun clicked self = (GObjectObjectClass.C.withPtr ---> I) clicked_ self
    fun getAlignment self =
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
            getAlignment_
            (
              self
               & 0.0
               & 0.0
            )
      in
        (xalign, yalign)
      end
    fun getEventWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getEventWindow_ self
    fun getFocusOnClick self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getFocusOnClick_ self
    fun getImage self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getImage_ self
    fun getImagePosition self = (GObjectObjectClass.C.withPtr ---> GtkPositionType.C.fromVal) getImagePosition_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getLabel_ self
    fun getRelief self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getRelief_ self
    fun getUseStock self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getUseStock_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getUseUnderline_ self
    fun setAlignment self xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setFocusOnClick self focusOnClick = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setImage self image = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setImage_ (self & image)
    fun setImagePosition self position = (GObjectObjectClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setImagePosition_ (self & position)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setLabel_ (self & label)
    fun setRelief self newstyle = (GObjectObjectClass.C.withPtr &&&> GtkReliefStyle.C.withVal ---> I) setRelief_ (self & newstyle)
    fun setUseStock self useStock = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setUseStock_ (self & useStock)
    fun setUseUnderline self useUnderline = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
