structure GtkBox :>
  GTK_BOX
    where type 'a class_t = 'a GtkBoxClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type orientation_t = GtkOrientation.t
    where type packtype_t = GtkPackType.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_box_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_box_new") (GtkOrientation.PolyML.VAL &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val getHomogeneous_ = call (load_sym libgtk "gtk_box_get_homogeneous") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getSpacing_ = call (load_sym libgtk "gtk_box_get_spacing") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val packEnd_ =
        call (load_sym libgtk "gtk_box_pack_end")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.VOID
          )
      val packStart_ =
        call (load_sym libgtk "gtk_box_pack_start")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.VOID
          )
      val queryChildPacking_ =
        call (load_sym libgtk "gtk_box_query_child_packing")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Bool.REF
             &&> FFI.PolyML.Bool.REF
             &&> FFI.PolyML.Word32.REF
             &&> GtkPackType.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val reorderChild_ =
        call (load_sym libgtk "gtk_box_reorder_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setChildPacking_ =
        call (load_sym libgtk "gtk_box_set_child_packing")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.Word32.VAL
             &&> GtkPackType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setHomogeneous_ = call (load_sym libgtk "gtk_box_set_homogeneous") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setSpacing_ = call (load_sym libgtk "gtk_box_set_spacing") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkBoxClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type orientation_t = GtkOrientation.t
    type packtype_t = GtkPackType.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation spacing = (GtkOrientation.C.withVal &&&> FFI.Int32.withVal ---> GtkBoxClass.C.fromPtr false) new_ (orientation & spacing)
    fun getHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHomogeneous_ self
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getSpacing_ self
    fun packEnd self child expand fill padding =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.Bool.withVal
         &&&> FFI.Word32.withVal
         ---> I
      )
        packEnd_
        (
          self
           & child
           & expand
           & fill
           & padding
        )
    fun packStart self child expand fill padding =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.Bool.withVal
         &&&> FFI.Word32.withVal
         ---> I
      )
        packStart_
        (
          self
           & child
           & expand
           & fill
           & padding
        )
    fun queryChildPacking self child =
      let
        val expand
         & fill
         & padding
         & packType
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Bool.withRefVal
             &&&> FFI.Bool.withRefVal
             &&&> FFI.Word32.withRefVal
             &&&> GtkPackType.C.withRefVal
             ---> FFI.Bool.fromVal
                   && FFI.Bool.fromVal
                   && FFI.Word32.fromVal
                   && GtkPackType.C.fromVal
                   && I
          )
            queryChildPacking_
            (
              self
               & child
               & false
               & false
               & 0
               & GtkPackType.null
            )
      in
        (
          expand,
          fill,
          padding,
          packType
        )
      end
    fun reorderChild self child position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun setChildPacking self child expand fill padding packType =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.Bool.withVal
         &&&> FFI.Word32.withVal
         &&&> GtkPackType.C.withVal
         ---> I
      )
        setChildPacking_
        (
          self
           & child
           & expand
           & fill
           & padding
           & packType
        )
    fun setHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setSpacing_ (self & spacing)
    local
      open Property
    in
      val homogeneousProp =
        {
          get = fn x => get "homogeneous" boolean x,
          set = fn x => set "homogeneous" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
    end
  end
