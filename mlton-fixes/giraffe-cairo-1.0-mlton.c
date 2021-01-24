#include "mlton/cvector.h"
#include "mlton/cvectorvector.h"

void
mlton_cairo_set_dash (cairo_t *cr,
                      SML_CVECTOR_VAL(double, dashes),
                      int num_dashes,
                      double offset)
{
  cairo_set_dash (cr, GET_SML_CVECTOR_VAL(double, dashes), num_dashes, offset);
}

void
mlton_cairo_get_dash (cairo_t *cr,
                      SML_CVECTOR_VAL(double, dashes),
                      double *offset)
{
  cairo_get_dash (cr, GET_SML_CVECTOR_VAL(double, dashes), offset);
}
