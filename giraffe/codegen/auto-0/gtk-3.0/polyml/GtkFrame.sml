structure GtkFrame :>
  GTK_FRAME
    where type 'a class_t = 'a GtkFrameClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type shadowtype_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_frame_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_frame_new") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getLabel_ = call (load_sym libgtk "gtk_frame_get_label") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getLabelAlign_ =
        call (load_sym libgtk "gtk_frame_get_label_align")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Float.REF
             &&> FFI.PolyML.Float.REF
             --> FFI.PolyML.VOID
          )
      val getLabelWidget_ = call (load_sym libgtk "gtk_frame_get_label_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getShadowType_ = call (load_sym libgtk "gtk_frame_get_shadow_type") (GObjectObjectClass.PolyML.PTR --> GtkShadowType.PolyML.VAL)
      val setLabel_ = call (load_sym libgtk "gtk_frame_set_label") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setLabelAlign_ =
        call (load_sym libgtk "gtk_frame_set_label_align")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             --> FFI.PolyML.VOID
          )
      val setLabelWidget_ = call (load_sym libgtk "gtk_frame_set_label_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setShadowType_ = call (load_sym libgtk "gtk_frame_set_shadow_type") (GObjectObjectClass.PolyML.PTR &&> GtkShadowType.PolyML.VAL --> FFI.PolyML.VOID)
    end
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
