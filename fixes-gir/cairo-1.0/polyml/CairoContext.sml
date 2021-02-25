(* Copyright (C) 2014, 2016-2017, 2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CairoContext :>
  CAIRO_CONTEXT
    where type t = CairoContextRecord.t
    where type antialias_t = CairoAntialias.t
    where type fillrule_t = CairoFillRule.t
    where type linecap_t = CairoLineCap.t
    where type linejoin_t = CairoLineJoin.t
    where type operator_t = CairoOperator.t
    where type status_t = CairoStatus.t
    where type content_t = CairoContent.t
    where type pattern_t = CairoPatternRecord.t
    where type surface_t = CairoSurfaceRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "cairo_gobject_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val create_ = call (externalFunctionSymbol "cairo_create") (CairoSurfaceRecord.PolyML.cPtr --> CairoContextRecord.PolyML.cPtr)
      val status_ = call (externalFunctionSymbol "cairo_status") (CairoContextRecord.PolyML.cPtr --> CairoStatus.PolyML.cVal)
      val save_ = call (externalFunctionSymbol "cairo_save") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val restore_ = call (externalFunctionSymbol "cairo_restore") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val getTarget_ = call (externalFunctionSymbol "cairo_get_target") (CairoContextRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val pushGroup_ = call (externalFunctionSymbol "cairo_push_group") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val pushGroupWithContent_ =
        call
          (externalFunctionSymbol "cairo_push_group_with_content")
          (
            CairoContextRecord.PolyML.cPtr
             &&> CairoContent.PolyML.cVal
             --> cVoid
          )
      val popGroup_ = call (externalFunctionSymbol "cairo_pop_group") (CairoContextRecord.PolyML.cPtr --> CairoPatternRecord.PolyML.cPtr)
      val popGroupToSource_ = call (externalFunctionSymbol "cairo_pop_group_to_source") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val getGroupTarget_ = call (externalFunctionSymbol "cairo_get_group_target") (CairoContextRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val setSourceRgb_ =
        call
          (externalFunctionSymbol "cairo_set_source_rgb")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setSourceRgba_ =
        call
          (externalFunctionSymbol "cairo_set_source_rgba")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setSource_ = call (externalFunctionSymbol "cairo_set_source") (CairoContextRecord.PolyML.cPtr &&> CairoPatternRecord.PolyML.cPtr --> cVoid)
      val setSourceSurface_ =
        call
          (externalFunctionSymbol "cairo_set_source_surface")
          (
            CairoContextRecord.PolyML.cPtr
             &&> CairoSurfaceRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val getSource_ = call (externalFunctionSymbol "cairo_get_source") (CairoContextRecord.PolyML.cPtr --> CairoPatternRecord.PolyML.cPtr)
      val setAntialias_ = call (externalFunctionSymbol "cairo_set_antialias") (CairoContextRecord.PolyML.cPtr &&> CairoAntialias.PolyML.cVal --> cVoid)
      val getAntialias_ = call (externalFunctionSymbol "cairo_get_antialias") (CairoContextRecord.PolyML.cPtr --> CairoAntialias.PolyML.cVal)
      val setDash_ =
        call
          (externalFunctionSymbol "cairo_set_dash")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDoubleCArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val getDashCount_ = call (externalFunctionSymbol "cairo_get_dash_count") (CairoContextRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getDash_ =
        call
          (externalFunctionSymbol "cairo_get_dash")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDoubleCArrayN.PolyML.cInPtr
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val setFillRule_ = call (externalFunctionSymbol "cairo_set_fill_rule") (CairoContextRecord.PolyML.cPtr &&> CairoFillRule.PolyML.cVal --> cVoid)
      val getFillRule_ = call (externalFunctionSymbol "cairo_get_fill_rule") (CairoContextRecord.PolyML.cPtr --> CairoFillRule.PolyML.cVal)
      val setLineCap_ = call (externalFunctionSymbol "cairo_set_line_cap") (CairoContextRecord.PolyML.cPtr &&> CairoLineCap.PolyML.cVal --> cVoid)
      val getLineCap_ = call (externalFunctionSymbol "cairo_get_line_cap") (CairoContextRecord.PolyML.cPtr --> CairoLineCap.PolyML.cVal)
      val setLineJoin_ = call (externalFunctionSymbol "cairo_set_line_join") (CairoContextRecord.PolyML.cPtr &&> CairoLineJoin.PolyML.cVal --> cVoid)
      val getLineJoin_ = call (externalFunctionSymbol "cairo_get_line_join") (CairoContextRecord.PolyML.cPtr --> CairoLineJoin.PolyML.cVal)
      val setLineWidth_ = call (externalFunctionSymbol "cairo_set_line_width") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val getLineWidth_ = call (externalFunctionSymbol "cairo_get_line_width") (CairoContextRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setMiterLimit_ = call (externalFunctionSymbol "cairo_set_miter_limit") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val getMiterLimit_ = call (externalFunctionSymbol "cairo_get_miter_limit") (CairoContextRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setOperator_ = call (externalFunctionSymbol "cairo_set_operator") (CairoContextRecord.PolyML.cPtr &&> CairoOperator.PolyML.cVal --> cVoid)
      val getOperator_ = call (externalFunctionSymbol "cairo_get_operator") (CairoContextRecord.PolyML.cPtr --> CairoOperator.PolyML.cVal)
      val setTolerance_ = call (externalFunctionSymbol "cairo_set_tolerance") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val getTolerance_ = call (externalFunctionSymbol "cairo_get_tolerance") (CairoContextRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val clip_ = call (externalFunctionSymbol "cairo_clip") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val clipPreserve_ = call (externalFunctionSymbol "cairo_clip_preserve") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val clipExtents_ =
        call
          (externalFunctionSymbol "cairo_clip_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val inClip_ =
        call
          (externalFunctionSymbol "cairo_in_clip")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val resetClip_ = call (externalFunctionSymbol "cairo_reset_clip") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val fill_ = call (externalFunctionSymbol "cairo_fill") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val fillPreserve_ = call (externalFunctionSymbol "cairo_fill_preserve") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val fillExtents_ =
        call
          (externalFunctionSymbol "cairo_fill_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val inFill_ =
        call
          (externalFunctionSymbol "cairo_in_fill")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val mask_ = call (externalFunctionSymbol "cairo_mask") (CairoContextRecord.PolyML.cPtr &&> CairoPatternRecord.PolyML.cPtr --> cVoid)
      val maskSurface_ =
        call
          (externalFunctionSymbol "cairo_mask_surface")
          (
            CairoContextRecord.PolyML.cPtr
             &&> CairoSurfaceRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val paint_ = call (externalFunctionSymbol "cairo_paint") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val paintWithAlpha_ = call (externalFunctionSymbol "cairo_paint_with_alpha") (CairoContextRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val stroke_ = call (externalFunctionSymbol "cairo_stroke") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val strokePreserve_ = call (externalFunctionSymbol "cairo_stroke_preserve") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val strokeExtents_ =
        call
          (externalFunctionSymbol "cairo_stroke_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val inStroke_ =
        call
          (externalFunctionSymbol "cairo_in_stroke")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val copyPage_ = call (externalFunctionSymbol "cairo_copy_page") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val showPage_ = call (externalFunctionSymbol "cairo_show_page") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val hasCurrentPoint_ = call (externalFunctionSymbol "cairo_has_current_point") (CairoContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCurrentPoint_ =
        call
          (externalFunctionSymbol "cairo_get_current_point")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val newPath_ = call (externalFunctionSymbol "cairo_new_path") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val newSubPath_ = call (externalFunctionSymbol "cairo_new_sub_path") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val closePath_ = call (externalFunctionSymbol "cairo_close_path") (CairoContextRecord.PolyML.cPtr --> cVoid)
      val arc_ =
        call
          (externalFunctionSymbol "cairo_arc")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val arcNegative_ =
        call
          (externalFunctionSymbol "cairo_arc_negative")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val curveTo_ =
        call
          (externalFunctionSymbol "cairo_curve_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val lineTo_ =
        call
          (externalFunctionSymbol "cairo_line_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val moveTo_ =
        call
          (externalFunctionSymbol "cairo_move_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val rectangle_ =
        call
          (externalFunctionSymbol "cairo_rectangle")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val relCurveTo_ =
        call
          (externalFunctionSymbol "cairo_rel_curve_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val relLineTo_ =
        call
          (externalFunctionSymbol "cairo_rel_line_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val relMoveTo_ =
        call
          (externalFunctionSymbol "cairo_rel_move_to")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val pathExtents_ =
        call
          (externalFunctionSymbol "cairo_path_extents")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
    end
    type t = CairoContextRecord.t
    type antialias_t = CairoAntialias.t
    type fillrule_t = CairoFillRule.t
    type linecap_t = CairoLineCap.t
    type linejoin_t = CairoLineJoin.t
    type operator_t = CairoOperator.t
    type status_t = CairoStatus.t
    type content_t = CairoContent.t
    type pattern_t = CairoPatternRecord.t
    type surface_t = CairoSurfaceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun create target = (CairoSurfaceRecord.FFI.withPtr false ---> CairoContextRecord.FFI.fromPtr true) create_ target
    fun status cr = (CairoContextRecord.FFI.withPtr false ---> CairoStatus.FFI.fromVal) status_ cr
    fun save cr = (CairoContextRecord.FFI.withPtr false ---> I) save_ cr
    fun restore cr = (CairoContextRecord.FFI.withPtr false ---> I) restore_ cr
    fun getTarget cr = (CairoContextRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr false) getTarget_ cr
    fun pushGroup cr = (CairoContextRecord.FFI.withPtr false ---> I) pushGroup_ cr
    fun pushGroupWithContent cr content =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> CairoContent.FFI.withVal
         ---> I
      )
        pushGroupWithContent_
        (cr & content)
    fun popGroup cr = (CairoContextRecord.FFI.withPtr false ---> CairoPatternRecord.FFI.fromPtr true) popGroup_ cr
    fun popGroupToSource cr = (CairoContextRecord.FFI.withPtr false ---> I) popGroupToSource_ cr
    fun getGroupTarget cr = (CairoContextRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr false) getGroupTarget_ cr
    fun setSourceRgb cr (red, green, blue) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setSourceRgb_
        (
          cr
           & red
           & green
           & blue
        )
    fun setSourceRgba cr (red, green, blue, alpha) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setSourceRgba_
        (
          cr
           & red
           & green
           & blue
           & alpha
        )
    fun setSource cr source = (CairoContextRecord.FFI.withPtr false &&&> CairoPatternRecord.FFI.withPtr false ---> I) setSource_ (cr & source)
    fun setSourceSurface cr (surface, x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> CairoSurfaceRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setSourceSurface_
        (
          cr
           & surface
           & x
           & y
        )
    fun getSource cr = (CairoContextRecord.FFI.withPtr false ---> CairoPatternRecord.FFI.fromPtr false) getSource_ cr
    fun setAntialias cr antialias = (CairoContextRecord.FFI.withPtr false &&&> CairoAntialias.FFI.withVal ---> I) setAntialias_ (cr & antialias)
    fun getAntialias cr = (CairoContextRecord.FFI.withPtr false ---> CairoAntialias.FFI.fromVal) getAntialias_ cr
    fun setDash cr (dashes, offset) =
      let
        val numDashes = LargeInt.fromInt (GDoubleCArrayN.length dashes)
      in
        (
          CairoContextRecord.FFI.withPtr false
           &&&> GDoubleCArrayN.FFI.withPtr 0
           &&&> GInt.FFI.withVal
           &&&> GDouble.FFI.withVal
           ---> I
        )
          setDash_
          (
            cr
             & dashes
             & numDashes
             & offset
          )
      end
    fun getDashCount cr = (CairoContextRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getDashCount_ cr
    fun getDash cr =
      let
        val count = LargeInt.toInt (getDashCount cr)
        val dashes
         & offset
         & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDoubleCArrayN.FFI.withNewPtr
             &&&> GDouble.FFI.withRefVal
             ---> GDoubleCArrayN.FFI.fromPtr ~1 && GDouble.FFI.fromVal && I
          )
            getDash_
            (
              cr
               & count
               & GDouble.null
            )
      in
        (dashes count, offset)
      end
    fun setFillRule cr fillRule = (CairoContextRecord.FFI.withPtr false &&&> CairoFillRule.FFI.withVal ---> I) setFillRule_ (cr & fillRule)
    fun getFillRule cr = (CairoContextRecord.FFI.withPtr false ---> CairoFillRule.FFI.fromVal) getFillRule_ cr
    fun setLineCap cr lineCap = (CairoContextRecord.FFI.withPtr false &&&> CairoLineCap.FFI.withVal ---> I) setLineCap_ (cr & lineCap)
    fun getLineCap cr = (CairoContextRecord.FFI.withPtr false ---> CairoLineCap.FFI.fromVal) getLineCap_ cr
    fun setLineJoin cr lineJoin = (CairoContextRecord.FFI.withPtr false &&&> CairoLineJoin.FFI.withVal ---> I) setLineJoin_ (cr & lineJoin)
    fun getLineJoin cr = (CairoContextRecord.FFI.withPtr false ---> CairoLineJoin.FFI.fromVal) getLineJoin_ cr
    fun setLineWidth cr width = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setLineWidth_ (cr & width)
    fun getLineWidth cr = (CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getLineWidth_ cr
    fun setMiterLimit cr limit = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setMiterLimit_ (cr & limit)
    fun getMiterLimit cr = (CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getMiterLimit_ cr
    fun setOperator cr op' = (CairoContextRecord.FFI.withPtr false &&&> CairoOperator.FFI.withVal ---> I) setOperator_ (cr & op')
    fun getOperator cr = (CairoContextRecord.FFI.withPtr false ---> CairoOperator.FFI.fromVal) getOperator_ cr
    fun setTolerance cr tolerance = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setTolerance_ (cr & tolerance)
    fun getTolerance cr = (CairoContextRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getTolerance_ cr
    fun clip cr = (CairoContextRecord.FFI.withPtr false ---> I) clip_ cr
    fun clipPreserve cr = (CairoContextRecord.FFI.withPtr false ---> I) clipPreserve_ cr
    fun clipExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            clipExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
    fun inClip cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        inClip_
        (
          cr
           & x
           & y
        )
    fun resetClip cr = (CairoContextRecord.FFI.withPtr false ---> I) resetClip_ cr
    fun fill cr = (CairoContextRecord.FFI.withPtr false ---> I) fill_ cr
    fun fillPreserve cr = (CairoContextRecord.FFI.withPtr false ---> I) fillPreserve_ cr
    fun fillExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            fillExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
    fun inFill cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        inFill_
        (
          cr
           & x
           & y
        )
    fun mask cr pattern = (CairoContextRecord.FFI.withPtr false &&&> CairoPatternRecord.FFI.withPtr false ---> I) mask_ (cr & pattern)
    fun maskSurface cr (surface, surface_x, surface_y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> CairoSurfaceRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        maskSurface_
        (
          cr
           & surface
           & surface_x
           & surface_y
        )
    fun paint cr = (CairoContextRecord.FFI.withPtr false ---> I) paint_ cr
    fun paintWithAlpha cr alpha = (CairoContextRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) paintWithAlpha_ (cr & alpha)
    fun stroke cr = (CairoContextRecord.FFI.withPtr false ---> I) stroke_ cr
    fun strokePreserve cr = (CairoContextRecord.FFI.withPtr false ---> I) strokePreserve_ cr
    fun strokeExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            strokeExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
    fun inStroke cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        inStroke_
        (
          cr
           & x
           & y
        )
    fun copyPage cr = (CairoContextRecord.FFI.withPtr false ---> I) copyPage_ cr
    fun showPage cr = (CairoContextRecord.FFI.withPtr false ---> I) showPage_ cr
    fun hasCurrentPoint cr = (CairoContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal) hasCurrentPoint_ cr
    fun getCurrentPoint cr =
      let
        val x & y & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getCurrentPoint_
            (
              cr
               & GDouble.null
               & GDouble.null
            )
      in
        (x, y)
      end
    fun newPath cr = (CairoContextRecord.FFI.withPtr false ---> I) newPath_ cr
    fun newSubPath cr = (CairoContextRecord.FFI.withPtr false ---> I) newSubPath_ cr
    fun closePath cr = (CairoContextRecord.FFI.withPtr false ---> I) closePath_ cr
    fun arc cr (xc, yc, radius, angle1, angle2) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        arc_
        (
          cr
           & xc
           & yc
           & radius
           & angle1
           & angle2
        )
    fun arcNegative cr (xc, yc, radius, angle1, angle2) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        arcNegative_
        (
          cr
           & xc
           & yc
           & radius
           & angle1
           & angle2
        )
    fun curveTo cr (x1, y1, x2, y2, x3, y3) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        curveTo_
        (
          cr
           & x1
           & y1
           & x2
           & y2
           & x3
           & y3
        )
    fun lineTo cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        lineTo_
        (
          cr
           & x
           & y
        )
    fun moveTo cr (x, y) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        moveTo_
        (
          cr
           & x
           & y
        )
    fun rectangle cr (x, y, width, height) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        rectangle_
        (
          cr
           & x
           & y
           & width
           & height
        )
    fun relCurveTo cr (dx1, dy1, dx2, dy2, dx3, dy3) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        relCurveTo_
        (
          cr
           & dx1
           & dy1
           & dx2
           & dy2
           & dx3
           & dy3
        )
    fun relLineTo cr (dx, dy) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        relLineTo_
        (
          cr
           & dx
           & dy
        )
    fun relMoveTo cr (dx, dy) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        relMoveTo_
        (
          cr
           & dx
           & dy
        )
    fun pathExtents cr =
      let
        val x1 & y1 & x2 & y2 & () =
          (
            CairoContextRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            pathExtents_
            (
              cr
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (x1, y1, x2, y2)
      end
  end
