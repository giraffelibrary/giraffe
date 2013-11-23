structure GtkTargetList :>
  GTK_TARGET_LIST
    where type record_t = GtkTargetListRecord.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t =
  struct
    val getType_ = _import "gtk_target_list_get_type" : unit -> GObjectType.C.val_;
    val add_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_target_list_add" :
              GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addImageTargets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_target_list_add_image_targets" :
              GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * FFI.UInt.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addRichTextTargets_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_target_list_add_rich_text_targets" :
              GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * FFI.UInt.C.val_
               * FFI.Bool.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTextTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_text_targets" : GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val addUriTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_uri_targets" : GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "gtk_target_list_remove" : GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> unit;) (x1, x2)
    type record_t = GtkTargetListRecord.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun add self target flags info =
      (
        GtkTargetListRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        add_
        (
          self
           & target
           & flags
           & info
        )
    fun addImageTargets self info writable =
      (
        GtkTargetListRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        addImageTargets_
        (
          self
           & info
           & writable
        )
    fun addRichTextTargets self info deserializable buffer =
      (
        GtkTargetListRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addRichTextTargets_
        (
          self
           & info
           & deserializable
           & buffer
        )
    fun addTextTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt.C.withVal ---> I) addTextTargets_ (self & info)
    fun addUriTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt.C.withVal ---> I) addUriTargets_ (self & info)
    fun remove self target = (GtkTargetListRecord.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) remove_ (self & target)
  end
