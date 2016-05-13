structure GtkMisc :>
  GTK_MISC
    where type 'a class = 'a GtkMiscClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_misc_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getAlignment_ =
        call (load_sym libgtk "gtk_misc_get_alignment")
          (
            GtkMiscClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cRef
             &&> FFI.Float.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_misc_get_padding")
          (
            GtkMiscClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val setAlignment_ =
        call (load_sym libgtk "gtk_misc_set_alignment")
          (
            GtkMiscClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setPadding_ =
        call (load_sym libgtk "gtk_misc_set_padding")
          (
            GtkMiscClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkMiscClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkMiscClass.C.withPtr
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
    fun getPadding self =
      let
        val xpad
         & ypad
         & () =
          (
            GtkMiscClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPadding_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (xpad, ypad)
      end
    fun setAlignment self xalign yalign =
      (
        GtkMiscClass.C.withPtr
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
    fun setPadding self xpad ypad =
      (
        GtkMiscClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    local
      open Property
    in
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" int x,
          set = fn x => set "xpad" int x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" int x,
          set = fn x => set "ypad" int x
        }
    end
  end
