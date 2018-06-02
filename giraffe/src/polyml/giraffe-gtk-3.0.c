/* Copyright (C) 2012, 2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gtk C interface support for Poly/ML
 */

#include <string.h>
#include <gtk/gtk.h>


/* GtkAccelKey */

GtkAccelKey *
giraffe_gtk_accel_key_new (void)
{
  return g_slice_new (GtkAccelKey);
}

void
giraffe_gtk_accel_key_copy (const GtkAccelKey *src, GtkAccelKey *dest)
{
  memcpy (dest, src, sizeof (GtkAccelKey));
}

void
giraffe_gtk_accel_key_free (GtkAccelKey *key)
{
  g_slice_free (GtkAccelKey, key);
}

guint
giraffe_gtk_accel_key_size (void)
{
  return sizeof (GtkAccelKey);
}


/* GtkBorder */

GtkBorder *
giraffe_gtk_border_new (void)
{
  return g_slice_new (GtkBorder);
}

void
giraffe_gtk_border_copy (const GtkBorder *src, GtkBorder *dest)
{
  memcpy (dest, src, sizeof (GtkBorder));
}

void
giraffe_gtk_border_free (GtkBorder *border)
{
  g_slice_free (GtkBorder, border);
}

guint
giraffe_gtk_border_size (void)
{
  return sizeof (GtkBorder);
}


/* GtkFileChooserDialog */


/* GtkFileFilter */

GtkFileFilterInfo *
giraffe_gtk_file_filter_info_new (void)
{
  return g_slice_new (GtkFileFilterInfo);
}

void
giraffe_gtk_file_filter_info_copy (const GtkFileFilterInfo *src, GtkFileFilterInfo *dest)
{
  memcpy (dest, src, sizeof (GtkFileFilterInfo));
}

void
giraffe_gtk_file_filter_info_free (GtkFileFilterInfo *info)
{
  g_slice_free (GtkFileFilterInfo, info);
}

guint
giraffe_file_filter_info_size (void)
{
  return sizeof (GtkFileFilterInfo);
}


/* GtkMessageDialog */


/* GtkRecentData */

GtkRecentData *
giraffe_gtk_recent_data_new (void)
{
  return g_slice_new (GtkRecentData);
}

void
giraffe_gtk_recent_data_copy (const GtkRecentData *src, GtkRecentData *dest)
{
  memcpy (dest, src, sizeof (GtkRecentData));
}

void
giraffe_gtk_recent_data_free (GtkRecentData *data)
{
  g_slice_free (GtkRecentData, data);
}

guint
giraffe_gtk_recent_data_size (void)
{
  return sizeof (GtkRecentData);
}


/* GtkRecentFilterInfo */

GtkRecentFilterInfo *
giraffe_gtk_recent_filter_info_new (void)
{
  return g_slice_new (GtkRecentFilterInfo);
}

void
giraffe_gtk_recent_filter_info_copy (const GtkRecentFilterInfo *src, GtkRecentFilterInfo *dest)
{
  memcpy (dest, src, sizeof (GtkRecentFilterInfo));
}

void
giraffe_gtk_recent_filter_info_free (GtkRecentFilterInfo *info)
{
  g_slice_free (GtkRecentFilterInfo, info);
}

guint
giraffe_gtk_recent_filter_info_size (void)
{
  return sizeof (GtkRecentFilterInfo);
}


/* GtkRequisition */

GtkRequisition *
giraffe_gtk_requisition_new (void)
{
  return g_slice_new (GtkRequisition);
}

void
giraffe_gtk_requisition_copy (const GtkRequisition *src, GtkRequisition *dest)
{
  memcpy (dest, src, sizeof (GtkRequisition));
}

void
giraffe_gtk_requisition_free (GtkRequisition *requisition)
{
  g_slice_free (GtkRequisition, requisition);
}

guint
giraffe_gtk_requisition_size (void)
{
  return sizeof (GtkRequisition);
}


/* GtkSettingsValue */

GtkSettingsValue *
giraffe_gtk_settings_value_new (void)
{
  return g_slice_new (GtkSettingsValue);
}

void
giraffe_gtk_settings_value_copy (const GtkSettingsValue *src, GtkSettingsValue *dest)
{
  memcpy (dest, src, sizeof (GtkSettingsValue));
}

void
giraffe_gtk_settings_value_free (GtkSettingsValue *settings_value)
{
  g_slice_free (GtkSettingsValue, settings_value);
}

guint
giraffe_gtk_settings_value_size (void)
{
  return sizeof (GtkSettingsValue);
}


/* GtkStockItem */

GtkStockItem *
giraffe_gtk_stock_item_new (void)
{
  return g_slice_new (GtkStockItem);
}

void
giraffe_gtk_stock_item_copy (const GtkStockItem *src, GtkStockItem *dest)
{
  memcpy (dest, src, sizeof (GtkStockItem));
}

void
giraffe_gtk_stock_item_free (GtkStockItem *stock_item)
{
  g_slice_free (GtkStockItem, stock_item);
}

guint
giraffe_gtk_stock_item_size (void)
{
  return sizeof (GtkStockItem);
}


/* GtkTextIter */

GtkTextIter *
giraffe_gtk_text_iter_new (void)
{
  return g_slice_new (GtkTextIter);
}

void
giraffe_gtk_text_iter_copy (const GtkTextIter *src, GtkTextIter *dest)
{
  memcpy (dest, src, sizeof (GtkTextIter));
}

void
giraffe_gtk_text_iter_free (GtkTextIter *text_iter)
{
  g_slice_free (GtkTextIter, text_iter);
}

guint
giraffe_gtk_text_iter_size (void)
{
  return sizeof (GtkTextIter);
}


/* GtkTreeIter */

GtkTreeIter *
giraffe_gtk_tree_iter_new (void)
{
  return g_slice_new (GtkTreeIter);
}

void
giraffe_gtk_tree_iter_copy (const GtkTreeIter *src, GtkTreeIter *dest)
{
  memcpy (dest, src, sizeof (GtkTreeIter));
}

void
giraffe_gtk_tree_iter_free (GtkTreeIter *tree_iter)
{
  g_slice_free (GtkTreeIter, tree_iter);
}

guint
giraffe_gtk_tree_iter_size (void)
{
  return sizeof (GtkTreeIter);
}
