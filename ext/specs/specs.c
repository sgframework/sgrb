#include <ruby.h>

struct specs {
  size_t size;
  void *ptr;
};

static void
specs_free(void *p) {
  struct specs *ptr = p;

  if (ptr->size > 0)
    free(ptr->ptr);
}

static VALUE
specs_alloc(VALUE klass) {
  VALUE obj;
  struct specs *ptr;

  obj = Data_Make_Struct(klass, struct specs, NULL, specs_free, ptr);

  ptr->size = 0;
  ptr->ptr  = NULL;

  return obj;
}

static VALUE
specs_init(VALUE self, VALUE size) {
  struct specs *ptr;
  size_t requested = NUM2SIZET(size);

  if (0 == requested)
    rb_raise(rb_eArgError, "unable to allocate 0 bytes");

  Data_Get_Struct(self, struct specs, ptr);

  ptr->ptr = malloc(requested);

  if (NULL == ptr->ptr)
    rb_raise(rb_eNoMemError, "unable to allocate %ld bytes", requested);

  ptr->size = requested;

  return self;
}

static VALUE
specs_release(VALUE self) {
  struct specs *ptr;

  Data_Get_Struct(self, struct specs, ptr);

  if (0 == ptr->size)
    return self;

  ptr->size = 0;
  free(ptr->ptr);

  return self;
}

void
Init_specs(void) {
  VALUE cSpecs;

  cSpecs = rb_const_get(rb_cObject, rb_intern("Specs"));

  rb_define_alloc_func(cSpecs, specs_alloc);
  rb_define_method(cSpecs, "initialize", specs_init, 1);
  rb_define_method(cSpecs, "free", specs_release, 0);
}