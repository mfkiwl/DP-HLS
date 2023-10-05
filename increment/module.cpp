#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include "./include/pyapi.h"
#include <string>

namespace py = pybind11;

PYBIND11_MODULE(alignhls, m) {
    m.doc() = "Python bindings for AHRunner"; // Optional module docstring

    py::class_<AHRunner>(m, "AHRunner")
        .def(py::init<>()) // Default constructor
        .def(py::init<std::string, std::string>()) // Constructor with arguments
        .def("run", py::overload_cast<>(&AHRunner::run)) // Method run()
        .def("run", py::overload_cast<std::string, std::string>(&AHRunner::run)) // Overloaded method run()
        .def("get_traceback_path", &AHRunner::get_traceback_path)
        .def("get_scores", &AHRunner::get_scores);
}