structure GtkIconSet :>
  GTK_ICON_SET
    where type t = GtkIconSetRecord.t
    where type icon_source_t = GtkIconSourceRecord.t
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_set_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_icon_set_new") (PolyMLFFI.cVoid --> GtkIconSetRecord.PolyML.cPtr)
      val newFromPixbuf_ = call (getSymbol "gtk_icon_set_new_from_pixbuf") (GdkPixbufPixbufClass.PolyML.cPtr --> GtkIconSetRecord.PolyML.cPtr)
      val addSource_ = call (getSymbol "gtk_icon_set_add_source") (GtkIconSetRecord.PolyML.cPtr &&> GtkIconSourceRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val copy_ = call (getSymbol "gtk_icon_set_copy") (GtkIconSetRecord.PolyML.cPtr --> GtkIconSetRecord.PolyML.cPtr)
      val getSizes_ =
        call (getSymbol "gtk_icon_set_get_sizes")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GIntCVectorN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val renderIconPixbuf_ =
        call (getSymbol "gtk_icon_set_render_icon_pixbuf")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
    end
    type t = GtkIconSetRecord.t
    type icon_source_t = GtkIconSourceRecord.t
    type 'a style_context_class = 'a GtkStyleContextClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconSetRecord.FFI.fromPtr true) new_ ()
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr true) newFromPixbuf_ pixbuf
    fun addSource self source = (GtkIconSetRecord.FFI.withPtr &&&> GtkIconSourceRecord.FFI.withPtr ---> I) addSource_ (self & source)
    fun copy self = (GtkIconSetRecord.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr true) copy_ self
    fun getSizes self =
      let
        val sizes
         & nSizes
         & () =
          (
            GtkIconSetRecord.FFI.withPtr
             &&&> GIntCVectorN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> GIntCVectorN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && I
          )
            getSizes_
            (
              self
               & NONE
               & GInt.null
            )
      in
        sizes (LargeInt.toInt nSizes)
      end
    fun renderIconPixbuf self context size =
      (
        GtkIconSetRecord.FFI.withPtr
         &&&> GtkStyleContextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & context
           & size
        )
  end
