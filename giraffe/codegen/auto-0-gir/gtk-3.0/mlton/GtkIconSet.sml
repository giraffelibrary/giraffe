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
    val getType_ = _import "gtk_icon_set_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_icon_set_new" : unit -> GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p;
    val newFromPixbuf_ = _import "gtk_icon_set_new_from_pixbuf" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p;
    val addSource_ = fn x1 & x2 => (_import "gtk_icon_set_add_source" : GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p * GtkIconSourceRecord.FFI.notnull GtkIconSourceRecord.FFI.p -> unit;) (x1, x2)
    val copy_ = _import "gtk_icon_set_copy" : GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p -> GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p;
    val getSizes_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_set_get_sizes" :
              GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p
               * GIntCVectorN.MLton.r1
               * (unit, GIntCVectorN.FFI.notnull) GIntCVectorN.MLton.r2
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val renderIconPixbuf_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_set_render_icon_pixbuf" :
              GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p
               * GtkStyleContextClass.FFI.notnull GtkStyleContextClass.FFI.p
               * GInt.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
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
    fun renderIconPixbuf self (context, size) =
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
