structure GtkBox :>
  GTK_BOX
    where type 'a class_t = 'a GtkBoxClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type orientation_t = GtkOrientation.t
    where type pack_type_t = GtkPackType.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_box_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_box_new") (GtkOrientation.PolyML.VAL &&> FFI.Int.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getHomogeneous_ = call (load_sym libgtk "gtk_box_get_homogeneous") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSpacing_ = call (load_sym libgtk "gtk_box_get_spacing") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val packEnd_ =
        call (load_sym libgtk "gtk_box_pack_end")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val packStart_ =
        call (load_sym libgtk "gtk_box_pack_start")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val queryChildPacking_ =
        call (load_sym libgtk "gtk_box_query_child_packing")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.REF
             &&> FFI.Bool.PolyML.REF
             &&> FFI.UInt.PolyML.REF
             &&> GtkPackType.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val reorderChild_ =
        call (load_sym libgtk "gtk_box_reorder_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setChildPacking_ =
        call (load_sym libgtk "gtk_box_set_child_packing")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             &&> GtkPackType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setHomogeneous_ = call (load_sym libgtk "gtk_box_set_homogeneous") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSpacing_ = call (load_sym libgtk "gtk_box_set_spacing") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkBoxClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type orientation_t = GtkOrientation.t
    type pack_type_t = GtkPackType.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation spacing = (GtkOrientation.C.withVal &&&> FFI.Int.C.withVal ---> GtkBoxClass.C.fromPtr false) new_ (orientation & spacing)
    fun getHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHomogeneous_ self
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
    fun packEnd self child expand fill padding =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt.C.withVal
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
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt.C.withVal
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
             &&&> FFI.Bool.C.withRefVal
             &&&> FFI.Bool.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             &&&> GtkPackType.C.withRefVal
             ---> FFI.Bool.C.fromVal
                   && FFI.Bool.C.fromVal
                   && FFI.UInt.C.fromVal
                   && GtkPackType.C.fromVal
                   && I
          )
            queryChildPacking_
            (
              self
               & child
               & FFI.Bool.null
               & FFI.Bool.null
               & FFI.UInt.null
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt.C.withVal
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
    fun setHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
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
