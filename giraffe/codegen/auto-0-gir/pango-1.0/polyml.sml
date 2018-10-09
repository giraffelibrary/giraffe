use "PANGO_GLYPH-sig.sml";
use "PANGO_GLYPH_UNIT-sig.sml";
use "PANGO_ALIGNMENT-sig.sml";
use "PANGO_ANALYSIS_RECORD-sig.sml";
use "PANGO_ANALYSIS-sig.sml";
use "PANGO_ATTR_LIST_RECORD-sig.sml";
use "PANGO_ATTR_LIST-sig.sml";
use "PANGO_ATTR_TYPE-sig.sml";
use "PANGO_ATTRIBUTE_RECORD-sig.sml";
use "PANGO_ATTRIBUTE-sig.sml";
use "PANGO_BIDI_TYPE-sig.sml";
use "PANGO_COLOR_RECORD-sig.sml";
use "PANGO_COLOR-sig.sml";
use "PANGO_CONTEXT_CLASS-sig.sml";
use "PANGO_CONTEXT-sig.sml";
use "PANGO_COVERAGE_LEVEL-sig.sml";
use "PANGO_DIRECTION-sig.sml";
use "PANGO_ELLIPSIZE_MODE-sig.sml";
use "PANGO_ENGINE_CLASS-sig.sml";
use "PANGO_ENGINE-sig.sml";
use "PANGO_ENGINE_LANG_CLASS-sig.sml";
use "PANGO_ENGINE_LANG-sig.sml";
use "PANGO_ENGINE_SHAPE_CLASS-sig.sml";
use "PANGO_ENGINE_SHAPE-sig.sml";
use "PANGO_FONT_CLASS-sig.sml";
use "PANGO_FONT-sig.sml";
use "PANGO_FONT_DESCRIPTION_RECORD-sig.sml";
use "PANGO_FONT_DESCRIPTION-sig.sml";
use "PANGO_FONT_FACE_CLASS-sig.sml";
use "PANGO_FONT_FACE-sig.sml";
use "PANGO_FONT_FAMILY_CLASS-sig.sml";
use "PANGO_FONT_FAMILY-sig.sml";
use "PANGO_FONT_MAP_CLASS-sig.sml";
use "PANGO_FONT_MAP-sig.sml";
use "PANGO_FONT_MASK-sig.sml";
use "PANGO_FONT_METRICS_RECORD-sig.sml";
use "PANGO_FONT_METRICS-sig.sml";
use "PANGO_FONTSET_CLASS-sig.sml";
use "PANGO_FONTSET-sig.sml";
use "PANGO_FONTSET_SIMPLE_CLASS-sig.sml";
use "PANGO_FONTSET_SIMPLE-sig.sml";
use "PANGO_GLYPH_ITEM_RECORD-sig.sml";
use "PANGO_GLYPH_ITEM-sig.sml";
use "PANGO_GLYPH_STRING_RECORD-sig.sml";
use "PANGO_GLYPH_STRING-sig.sml";
use "PANGO_GRAVITY-sig.sml";
use "PANGO_GRAVITY_HINT-sig.sml";
use "PANGO_ITEM_RECORD-sig.sml";
use "PANGO_ITEM-sig.sml";
use "PANGO_LANGUAGE_RECORD-sig.sml";
use "PANGO_LANGUAGE-sig.sml";
use "PANGO_LAYOUT_CLASS-sig.sml";
use "PANGO_LAYOUT-sig.sml";
use "PANGO_LAYOUT_ITER_RECORD-sig.sml";
use "PANGO_LAYOUT_ITER-sig.sml";
use "PANGO_LAYOUT_LINE_RECORD-sig.sml";
use "PANGO_LAYOUT_LINE-sig.sml";
use "PANGO_LOG_ATTR_RECORD-sig.sml";
use "PANGO_LOG_ATTR-sig.sml";
use "PANGO_MATRIX_RECORD-sig.sml";
use "PANGO_MATRIX-sig.sml";
use "PANGO_RECTANGLE_RECORD-sig.sml";
use "PANGO_RECTANGLE-sig.sml";
use "PANGO_RENDER_PART-sig.sml";
use "PANGO_RENDERER_CLASS-sig.sml";
use "PANGO_RENDERER-sig.sml";
use "PANGO_SCRIPT-sig.sml";
use "PANGO_STRETCH-sig.sml";
use "PANGO_STYLE-sig.sml";
use "PANGO_TAB_ALIGN-sig.sml";
use "PANGO_TAB_ARRAY_RECORD-sig.sml";
use "PANGO_TAB_ARRAY-sig.sml";
use "PANGO_UNDERLINE-sig.sml";
use "PANGO_VARIANT-sig.sml";
use "PANGO_WEIGHT-sig.sml";
use "PANGO_WRAP_MODE-sig.sml";
use "PANGO_LAYOUT_RUN_RECORD-sig.sml";
use "PANGO-sig.sml";
use "polyml/PangoGlyph.sml";
use "polyml/PangoGlyphUnit.sml";
use "polyml/PangoAlignment.sml";
use "polyml/PangoAnalysisRecord.sml";
use "polyml/PangoAttrListRecord.sml";
use "polyml/PangoAttrType.sml";
use "polyml/PangoAttributeRecord.sml";
use "polyml/PangoBidiType.sml";
use "polyml/PangoColorRecord.sml";
use "polyml/PangoContextClass.sml";
use "polyml/PangoCoverageLevel.sml";
use "polyml/PangoDirection.sml";
use "polyml/PangoEllipsizeMode.sml";
use "polyml/PangoEngineClass.sml";
use "polyml/PangoFontClass.sml";
use "polyml/PangoFontDescriptionRecord.sml";
use "polyml/PangoFontFaceClass.sml";
use "polyml/PangoFontFamilyClass.sml";
use "polyml/PangoFontMapClass.sml";
use "polyml/PangoFontMask.sml";
use "polyml/PangoFontMetricsRecord.sml";
use "polyml/PangoFontsetClass.sml";
use "polyml/PangoGlyphItemRecord.sml";
use "polyml/PangoGlyphStringRecord.sml";
use "polyml/PangoGravityHint.sml";
use "polyml/PangoItemRecord.sml";
use "polyml/PangoLanguageRecord.sml";
use "polyml/PangoLayoutClass.sml";
use "polyml/PangoLayoutIterRecord.sml";
use "polyml/PangoLayoutLineRecord.sml";
use "polyml/PangoLogAttrRecord.sml";
use "polyml/PangoMatrixRecord.sml";
use "polyml/PangoRectangleRecord.sml";
use "polyml/PangoRenderPart.sml";
use "polyml/PangoRendererClass.sml";
use "polyml/PangoStretch.sml";
use "polyml/PangoStyle.sml";
use "polyml/PangoTabAlign.sml";
use "polyml/PangoTabArrayRecord.sml";
use "polyml/PangoUnderline.sml";
use "polyml/PangoVariant.sml";
use "polyml/PangoWeight.sml";
use "polyml/PangoWrapMode.sml";
use "polyml/PangoLayoutRunRecord.sml";
use "polyml/PangoAnalysis.sml";
use "polyml/PangoAttrList.sml";
use "polyml/PangoAttribute.sml";
use "polyml/PangoColor.sml";
use "polyml/PangoEngine.sml";
use "polyml/PangoEngineLangClass.sml";
use "polyml/PangoEngineShapeClass.sml";
use "polyml/PangoFont.sml";
use "polyml/PangoFontFace.sml";
use "polyml/PangoFontFamily.sml";
use "polyml/PangoFontMap.sml";
use "polyml/PangoFontMetrics.sml";
use "polyml/PangoFontset.sml";
use "polyml/PangoFontsetSimpleClass.sml";
use "polyml/PangoGlyphItem.sml";
use "polyml/PangoGlyphString.sml";
use "polyml/PangoItem.sml";
use "polyml/PangoLayout.sml";
use "polyml/PangoLayoutLine.sml";
use "polyml/PangoLogAttr.sml";
use "polyml/PangoMatrix.sml";
use "polyml/PangoRectangle.sml";
use "polyml/PangoRenderer.sml";
use "polyml/PangoScript.sml";
use "polyml/PangoTabArray.sml";
use "polyml/PangoEngineLang.sml";
use "polyml/PangoEngineShape.sml";
use "polyml/PangoFontsetSimple.sml";
use "polyml/PangoGravity.sml";
use "polyml/PangoLanguage.sml";
use "polyml/PangoLayoutIter.sml";
use "polyml/PangoContext.sml";
use "polyml/PangoFontDescription.sml";
use "polyml/Pango.sml";
