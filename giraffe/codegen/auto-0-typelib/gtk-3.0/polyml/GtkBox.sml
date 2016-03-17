structure GtkBox :>
  GTK_BOX
    where type 'a class = 'a GtkBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type pack_type_t = GtkPackType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_box_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_box_new") (GtkOrientation.PolyML.cVal &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getHomogeneous_ = call (load_sym libgtk "gtk_box_get_homogeneous") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSpacing_ = call (load_sym libgtk "gtk_box_get_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val packEnd_ =
        call (load_sym libgtk "gtk_box_pack_end")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val packStart_ =
        call (load_sym libgtk "gtk_box_pack_start")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val queryChildPacking_ =
        call (load_sym libgtk "gtk_box_query_child_packing")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cRef
             &&> FFI.Bool.PolyML.cRef
             &&> FFI.UInt32.PolyML.cRef
             &&> GtkPackType.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val reorderChild_ =
        call (load_sym libgtk "gtk_box_reorder_child")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setChildPacking_ =
        call (load_sym libgtk "gtk_box_set_child_packing")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> GtkPackType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setHomogeneous_ = call (load_sym libgtk "gtk_box_set_homogeneous") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSpacing_ = call (load_sym libgtk "gtk_box_set_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type pack_type_t = GtkPackType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation spacing = (GtkOrientation.C.withVal &&&> FFI.Int32.C.withVal ---> GtkBoxClass.C.fromPtr false) new_ (orientation & spacing)
    fun getHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHomogeneous_ self
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun packEnd self child expand fill padding =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt32.C.withVal
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
         &&&> FFI.UInt32.C.withVal
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
             &&&> FFI.UInt32.C.withRefVal
             &&&> GtkPackType.C.withRefVal
             ---> FFI.Bool.C.fromVal
                   && FFI.Bool.C.fromVal
                   && FFI.UInt32.C.fromVal
                   && GtkPackType.C.fromVal
                   && I
          )
            queryChildPacking_
            (
              self
               & child
               & FFI.Bool.null
               & FFI.Bool.null
               & FFI.UInt32.null
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
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.UInt32.C.withVal
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
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
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
