#include <stdio.h>
#include <Python.h>

static PyObject *method_log(PyObject *self, PyObject *args) {
  char *str;
  int bytes_copied = -1;

  if(!PyArg_ParseTuple(args, "s", &str)) {
    return NULL;
  }

  puts(str);

  return PyLong_FromLong(bytes_copied);
}

static PyMethodDef LogMethods[] = {
  {"log", method_log, METH_VARARGS, "log function"},
  {NULL, NULL, 0, NULL}
};


static struct PyModuleDef logmodule = {
  PyModuleDef_HEAD_INIT,
  "log",
  "log function",
  -1,
  LogMethods
};

PyMODINIT_FUNC PyInit_log() {
    return PyModule_Create(&logmodule);
}

