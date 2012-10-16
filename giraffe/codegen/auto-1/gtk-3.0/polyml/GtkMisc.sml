structure GtkMisc :>
  GTK_MISC
    where type 'a class_t = 'a GtkMiscClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_misc_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getAlignment_ =
        call (load_sym libgtk "gtk_misc_get_alignment")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Float.REF
             &&> FFI.PolyML.Float.REF
             --> FFI.PolyML.VOID
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_misc_get_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val setAlignment_ =
        call (load_sym libgtk "gtk_misc_set_alignment")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             --> FFI.PolyML.VOID
          )
      val setPadding_ =
        call (load_sym libgtk "gtk_misc_set_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkMiscClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
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
    fun getPadding self =
      let
        val xpad
         & ypad
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPadding_
            (
              self
               & 0
               & 0
            )
      in
        (xpad, ypad)
      end
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
    fun setPadding self xpad ypad =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
