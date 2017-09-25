structure GtkTargetList :>
  GTK_TARGET_LIST
    where type t = GtkTargetListRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class
    where type target_entry_t = GtkTargetEntryRecord.t =
  struct
    structure GtkTargetEntryRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GtkTargetEntryRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GtkTargetEntryRecordCVectorN = CVectorN(GtkTargetEntryRecordCVectorNType)
    val getType_ = _import "gtk_target_list_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_target_list_new" :
              GtkTargetEntryRecordCVectorN.MLton.p1
               * GtkTargetEntryRecordCVectorN.FFI.notnull GtkTargetEntryRecordCVectorN.MLton.p2
               * GUInt.FFI.val_
               -> GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val add_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_target_list_add" :
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
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
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GUInt.FFI.val_
               * GBool.FFI.val_
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
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GUInt.FFI.val_
               * GBool.FFI.val_
               * GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTable_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_target_list_add_table" :
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GtkTargetEntryRecordCVectorN.MLton.p1
               * GtkTargetEntryRecordCVectorN.FFI.notnull GtkTargetEntryRecordCVectorN.MLton.p2
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTextTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_text_targets" : GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val addUriTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_uri_targets" : GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "gtk_target_list_remove" : GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p -> unit;) (x1, x2)
    type t = GtkTargetListRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type target_entry_t = GtkTargetEntryRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new targets =
      let
        val ntargets = LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
        val retVal = (GtkTargetEntryRecordCVectorN.FFI.withPtr &&&> GUInt.FFI.withVal ---> GtkTargetListRecord.FFI.fromPtr true) new_ (targets & ntargets)
      in
        retVal
      end
    fun add
      self
      (
        target,
        flags,
        info
      ) =
      (
        GtkTargetListRecord.FFI.withPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        add_
        (
          self
           & target
           & flags
           & info
        )
    fun addImageTargets self (info, writable) =
      (
        GtkTargetListRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        addImageTargets_
        (
          self
           & info
           & writable
        )
    fun addRichTextTargets
      self
      (
        info,
        deserializable,
        buffer
      ) =
      (
        GtkTargetListRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GtkTextBufferClass.FFI.withPtr
         ---> I
      )
        addRichTextTargets_
        (
          self
           & info
           & deserializable
           & buffer
        )
    fun addTable self targets =
      let
        val ntargets = LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
        val () =
          (
            GtkTargetListRecord.FFI.withPtr
             &&&> GtkTargetEntryRecordCVectorN.FFI.withPtr
             &&&> GUInt.FFI.withVal
             ---> I
          )
            addTable_
            (
              self
               & targets
               & ntargets
            )
      in
        ()
      end
    fun addTextTargets self info = (GtkTargetListRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) addTextTargets_ (self & info)
    fun addUriTargets self info = (GtkTargetListRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) addUriTargets_ (self & info)
    fun remove self target = (GtkTargetListRecord.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> I) remove_ (self & target)
  end
