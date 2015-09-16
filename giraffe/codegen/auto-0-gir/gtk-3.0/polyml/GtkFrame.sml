structure GtkFrame :>
  GTK_FRAME
    where type 'a class_t = 'a GtkFrameClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type shadow_type_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_frame_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_frame_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getLabel_ = call (load_sym libgtk "gtk_frame_get_label") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getLabelAlign_ =
        call (load_sym libgtk "gtk_frame_get_label_align")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Float.PolyML.REF
             &&> FFI.Float.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getLabelWidget_ = call (load_sym libgtk "gtk_frame_get_label_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getShadowType_ = call (load_sym libgtk "gtk_frame_get_shadow_type") (GObjectObjectClass.PolyML.PTR --> GtkShadowType.PolyML.VAL)
      val setLabel_ = call (load_sym libgtk "gtk_frame_set_label") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setLabelAlign_ =
        call (load_sym libgtk "gtk_frame_set_label_align")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setLabelWidget_ = call (load_sym libgtk "gtk_frame_set_label_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setShadowType_ = call (load_sym libgtk "gtk_frame_set_shadow_type") (GObjectObjectClass.PolyML.PTR &&> GtkShadowType.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkFrameClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type shadow_type_t = GtkShadowType.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label = (FFI.String.C.withConstPtr ---> GtkFrameClass.C.fromPtr false) new_ label
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLabel_ self
    fun getLabelAlign self =
      let
        val xalign
         & yalign
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Float.C.withRefVal
             &&&> FFI.Float.C.withRefVal
             ---> FFI.Float.C.fromVal
                   && FFI.Float.C.fromVal
                   && I
          )
            getLabelAlign_
            (
              self
               & FFI.Float.null
               & FFI.Float.null
            )
      in
        (xalign, yalign)
      end
    fun getLabelWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getShadowType self = (GObjectObjectClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setLabel_ (self & label)
    fun setLabelAlign self xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
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
