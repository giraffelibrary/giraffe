structure GdkPixbufPixbuf :>
  GDK_PIXBUF_PIXBUF
    where type 'a class = 'a GdkPixbufPixbufClass.class
    where type pixdata_t = GdkPixbufPixdataRecord.t
    where type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    where type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    where type interp_type_t = GdkPixbufInterpType.t
    where type colorspace_t = GdkPixbufColorspace.t =
  struct
    val getType_ = _import "gdk_pixbuf_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_new" :
              GdkPixbufColorspace.FFI.val_
               * GBool.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newFromBytes_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gdk_pixbuf_new_from_bytes" :
              GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p
               * GdkPixbufColorspace.FFI.val_
               * GBool.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_new_from_file" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromFileAtScale_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_gdk_pixbuf_new_from_file_at_scale" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newFromFileAtSize_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_gdk_pixbuf_new_from_file_at_size" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newFromInline_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gdk_pixbuf_new_from_inline" :
              GInt32.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newFromResource_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_new_from_resource" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromResourceAtScale_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_gdk_pixbuf_new_from_resource_at_scale" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newFromStream_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_new_from_stream" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStreamAtScale_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gdk_pixbuf_new_from_stream_at_scale" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newFromStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_new_from_stream_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val newFromXpmData_ = _import "mlton_gdk_pixbuf_new_from_xpm_data" : Utf8CPtrArray.MLton.p1 * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2 -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
    val calculateRowstride_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_calculate_rowstride" :
              GdkPixbufColorspace.FFI.val_
               * GBool.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val fromPixdata_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_from_pixdata" :
              GdkPixbufPixdataRecord.FFI.non_opt GdkPixbufPixdataRecord.FFI.p
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getFileInfo_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gdk_pixbuf_get_file_info" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GdkPixbufPixbufFormatRecord.FFI.opt GdkPixbufPixbufFormatRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getFileInfoFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_pixbuf_get_file_info_finish" :
              GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val saveToStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_save_to_stream_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val addAlpha_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_add_alpha" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GBool.FFI.val_
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val applyEmbeddedOrientation_ = _import "gdk_pixbuf_apply_embedded_orientation" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
    val composite_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10
         & x11
         & x12 =>
          (
            _import "gdk_pixbuf_composite" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12
            )
    val compositeColor_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10
         & x11
         & x12
         & x13
         & x14
         & x15
         & x16
         & x17 =>
          (
            _import "gdk_pixbuf_composite_color" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12,
              x13,
              x14,
              x15,
              x16,
              x17
            )
    val compositeColorSimple_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gdk_pixbuf_composite_color_simple" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val copy_ = _import "gdk_pixbuf_copy" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
    val copyArea_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gdk_pixbuf_copy_area" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val copyOptions_ = fn x1 & x2 => (_import "gdk_pixbuf_copy_options" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val fill_ = fn x1 & x2 => (_import "gdk_pixbuf_fill" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val flip_ = fn x1 & x2 => (_import "gdk_pixbuf_flip" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p * GBool.FFI.val_ -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val getBitsPerSample_ = _import "gdk_pixbuf_get_bits_per_sample" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getByteLength_ = _import "gdk_pixbuf_get_byte_length" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GUInt64.FFI.val_;
    val getColorspace_ = _import "gdk_pixbuf_get_colorspace" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GdkPixbufColorspace.FFI.val_;
    val getHasAlpha_ = _import "gdk_pixbuf_get_has_alpha" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GBool.FFI.val_;
    val getHeight_ = _import "gdk_pixbuf_get_height" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getNChannels_ = _import "gdk_pixbuf_get_n_channels" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getOption_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_pixbuf_get_option" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getPixels_ = fn x1 & x2 => (_import "gdk_pixbuf_get_pixels_with_length" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p * GUInt32.FFI.ref_ -> GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.FFI.out_p;) (x1, x2)
    val getRowstride_ = _import "gdk_pixbuf_get_rowstride" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getWidth_ = _import "gdk_pixbuf_get_width" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val newSubpixbuf_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_new_subpixbuf" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val readPixelBytes_ = _import "gdk_pixbuf_read_pixel_bytes" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
    val removeOption_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_pixbuf_remove_option" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val rotateSimple_ = fn x1 & x2 => (_import "gdk_pixbuf_rotate_simple" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p * GdkPixbufPixbufRotation.FFI.val_ -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val saturateAndPixelate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_pixbuf_saturate_and_pixelate" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GFloat.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val saveToBufferv_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & (x7, x8)
         & (x9, x10)
         & x11 =>
          (
            _import "mlton_gdk_pixbuf_save_to_bufferv" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GUInt64.FFI.ref_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val saveToStreamv_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & (x7, x8)
         & x9
         & x10 =>
          (
            _import "mlton_gdk_pixbuf_save_to_streamv" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val savev_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10 =>
          (
            _import "mlton_gdk_pixbuf_savev" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val scale_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "gdk_pixbuf_scale" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val scaleSimple_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_pixbuf_scale_simple" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setOption_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gdk_pixbuf_set_option" :
              GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GdkPixbufPixbufClass.class
    type pixdata_t = GdkPixbufPixdataRecord.t
    type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    type interp_type_t = GdkPixbufInterpType.t
    type colorspace_t = GdkPixbufColorspace.t
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioLoadableIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        colorspace,
        hasAlpha,
        bitsPerSample,
        width,
        height
      ) =
      (
        GdkPixbufColorspace.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        new_
        (
          colorspace
           & hasAlpha
           & bitsPerSample
           & width
           & height
        )
    fun newFromBytes
      (
        data,
        colorspace,
        hasAlpha,
        bitsPerSample,
        width,
        height,
        rowstride
      ) =
      (
        GLibBytesRecord.FFI.withPtr false
         &&&> GdkPixbufColorspace.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromBytes_
        (
          data
           & colorspace
           & hasAlpha
           & bitsPerSample
           & width
           & height
           & rowstride
        )
    fun newFromFile filename = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromFile_ (filename & [])
    fun newFromFileAtScale
      (
        filename,
        width,
        height,
        preserveAspectRatio
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromFileAtScale_
        (
          filename
           & width
           & height
           & preserveAspectRatio
           & []
        )
    fun newFromFileAtSize
      (
        filename,
        width,
        height
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromFileAtSize_
        (
          filename
           & width
           & height
           & []
        )
    fun newFromInline (data, copyPixels) =
      let
        val dataLength = LargeInt.fromInt (GUInt8CArrayN.length data)
        val retVal =
          (
            GInt32.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GBool.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> GdkPixbufPixbufClass.FFI.fromPtr true
          )
            newFromInline_
            (
              dataLength
               & data
               & copyPixels
               & []
            )
      in
        retVal
      end
    fun newFromResource resourcePath = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromResource_ (resourcePath & [])
    fun newFromResourceAtScale
      (
        resourcePath,
        width,
        height,
        preserveAspectRatio
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromResourceAtScale_
        (
          resourcePath
           & width
           & height
           & preserveAspectRatio
           & []
        )
    fun newFromStream (stream, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromStream_
        (
          stream
           & cancellable
           & []
        )
    fun newFromStreamAtScale
      (
        stream,
        width,
        height,
        preserveAspectRatio,
        cancellable
      ) =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromStreamAtScale_
        (
          stream
           & width
           & height
           & preserveAspectRatio
           & cancellable
           & []
        )
    fun newFromStreamFinish asyncResult = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromStreamFinish_ (asyncResult & [])
    fun newFromXpmData data = (Utf8CPtrArray.FFI.withPtr 0 ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromXpmData_ data
    fun calculateRowstride
      (
        colorspace,
        hasAlpha,
        bitsPerSample,
        width,
        height
      ) =
      (
        GdkPixbufColorspace.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        calculateRowstride_
        (
          colorspace
           & hasAlpha
           & bitsPerSample
           & width
           & height
        )
    fun fromPixdata (pixdata, copyPixels) =
      (
        GdkPixbufPixdataRecord.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        fromPixdata_
        (
          pixdata
           & copyPixels
           & []
        )
    fun getFileInfo filename =
      let
        val width
         & height
         & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkPixbufPixbufFormatRecord.FFI.fromOptPtr false
          )
            getFileInfo_
            (
              filename
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          width,
          height
        )
      end
    fun getFileInfoFinish asyncResult =
      let
        val width
         & height
         & retVal =
          (
            GioAsyncResultClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkPixbufPixbufFormatRecord.FFI.fromPtr false
          )
            getFileInfoFinish_
            (
              asyncResult
               & GInt32.null
               & GInt32.null
               & []
            )
      in
        (
          retVal,
          width,
          height
        )
      end
    fun saveToStreamFinish asyncResult = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) saveToStreamFinish_ (asyncResult & [])
    fun addAlpha
      self
      (
        substituteColor,
        r,
        g,
        b
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        addAlpha_
        (
          self
           & substituteColor
           & r
           & g
           & b
        )
    fun applyEmbeddedOrientation self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr true) applyEmbeddedOrientation_ self
    fun composite
      self
      (
        dest,
        destX,
        destY,
        destWidth,
        destHeight,
        offsetX,
        offsetY,
        scaleX,
        scaleY,
        interpType,
        overallAlpha
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        composite_
        (
          self
           & dest
           & destX
           & destY
           & destWidth
           & destHeight
           & offsetX
           & offsetY
           & scaleX
           & scaleY
           & interpType
           & overallAlpha
        )
    fun compositeColor
      self
      (
        dest,
        destX,
        destY,
        destWidth,
        destHeight,
        offsetX,
        offsetY,
        scaleX,
        scaleY,
        interpType,
        overallAlpha,
        checkX,
        checkY,
        checkSize,
        color1,
        color2
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        compositeColor_
        (
          self
           & dest
           & destX
           & destY
           & destWidth
           & destHeight
           & offsetX
           & offsetY
           & scaleX
           & scaleY
           & interpType
           & overallAlpha
           & checkX
           & checkY
           & checkSize
           & color1
           & color2
        )
    fun compositeColorSimple
      self
      (
        destWidth,
        destHeight,
        interpType,
        overallAlpha,
        checkSize,
        color1,
        color2
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        compositeColorSimple_
        (
          self
           & destWidth
           & destHeight
           & interpType
           & overallAlpha
           & checkSize
           & color1
           & color2
        )
    fun copy self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr true) copy_ self
    fun copyArea
      self
      (
        srcX,
        srcY,
        width,
        height,
        destPixbuf,
        destX,
        destY
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        copyArea_
        (
          self
           & srcX
           & srcY
           & width
           & height
           & destPixbuf
           & destX
           & destY
        )
    fun copyOptions self destPixbuf = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> GBool.FFI.fromVal) copyOptions_ (self & destPixbuf)
    fun fill self pixel = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) fill_ (self & pixel)
    fun flip self horizontal = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) flip_ (self & horizontal)
    fun getBitsPerSample self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getBitsPerSample_ self
    fun getByteLength self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getByteLength_ self
    fun getColorspace self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GdkPixbufColorspace.FFI.fromVal) getColorspace_ self
    fun getHasAlpha self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasAlpha_ self
    fun getHeight self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getHeight_ self
    fun getNChannels self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNChannels_ self
    fun getOption self key = (GdkPixbufPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getOption_ (self & key)
    fun getPixels self =
      let
        val length & retVal = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GUInt32.FFI.withRefVal ---> GUInt32.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 0) getPixels_ (self & GUInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getRowstride self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getRowstride_ self
    fun getWidth self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getWidth_ self
    fun newSubpixbuf
      self
      (
        srcX,
        srcY,
        width,
        height
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newSubpixbuf_
        (
          self
           & srcX
           & srcY
           & width
           & height
        )
    fun readPixelBytes self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GLibBytesRecord.FFI.fromPtr true) readPixelBytes_ self
    fun removeOption self key = (GdkPixbufPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) removeOption_ (self & key)
    fun rotateSimple self angle = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GdkPixbufPixbufRotation.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) rotateSimple_ (self & angle)
    fun saturateAndPixelate
      self
      (
        dest,
        saturation,
        pixelate
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GFloat.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        saturateAndPixelate_
        (
          self
           & dest
           & saturation
           & pixelate
        )
    fun saveToBufferv
      self
      (
        type',
        optionKeys,
        optionValues
      ) =
      let
        val buffer
         & bufferSize
         & () =
          (
            GdkPixbufPixbufClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GUInt64.FFI.withRefVal
             &&&> Utf8.FFI.withPtr 0
             &&&> Utf8CPtrArray.FFI.withPtr 0
             &&&> Utf8CPtrArray.FFI.withPtr 0
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr ~1
                   && GUInt64.FFI.fromVal
                   && ignore
          )
            saveToBufferv_
            (
              self
               & NONE
               & GUInt64.null
               & type'
               & optionKeys
               & optionValues
               & []
            )
      in
        buffer (LargeInt.toInt bufferSize)
      end
    fun saveToStreamv
      self
      (
        stream,
        type',
        optionKeys,
        optionValues,
        cancellable
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GioOutputStreamClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        saveToStreamv_
        (
          self
           & stream
           & type'
           & optionKeys
           & optionValues
           & cancellable
           & []
        )
    fun savev
      self
      (
        filename,
        type',
        optionKeys,
        optionValues
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        savev_
        (
          self
           & filename
           & type'
           & optionKeys
           & optionValues
           & []
        )
    fun scale
      self
      (
        dest,
        destX,
        destY,
        destWidth,
        destHeight,
        offsetX,
        offsetY,
        scaleX,
        scaleY,
        interpType
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         ---> I
      )
        scale_
        (
          self
           & dest
           & destX
           & destY
           & destWidth
           & destHeight
           & offsetX
           & offsetY
           & scaleX
           & scaleY
           & interpType
        )
    fun scaleSimple
      self
      (
        destWidth,
        destHeight,
        interpType
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        scaleSimple_
        (
          self
           & destWidth
           & destHeight
           & interpType
        )
    fun setOption self (key, value) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        setOption_
        (
          self
           & key
           & value
        )
    local
      open Property
    in
      val bitsPerSampleProp =
        {
          get = fn x => get "bits-per-sample" int x,
          new = fn x => new "bits-per-sample" int x
        }
      val colorspaceProp =
        {
          get = fn x => get "colorspace" GdkPixbufColorspace.t x,
          new = fn x => new "colorspace" GdkPixbufColorspace.t x
        }
      val hasAlphaProp =
        {
          get = fn x => get "has-alpha" boolean x,
          new = fn x => new "has-alpha" boolean x
        }
      val heightProp =
        {
          get = fn x => get "height" int x,
          new = fn x => new "height" int x
        }
      val nChannelsProp =
        {
          get = fn x => get "n-channels" int x,
          new = fn x => new "n-channels" int x
        }
      val pixelBytesProp =
        {
          get = fn x => get "pixel-bytes" GLibBytesRecord.tOpt x,
          new = fn x => new "pixel-bytes" GLibBytesRecord.tOpt x
        }
      val rowstrideProp =
        {
          get = fn x => get "rowstride" int x,
          new = fn x => new "rowstride" int x
        }
      val widthProp =
        {
          get = fn x => get "width" int x,
          new = fn x => new "width" int x
        }
    end
  end
