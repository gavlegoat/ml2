# (ML)<sup>2</sup>

(ML)<sup>2</sup> (ML for Machine Learning, often written ML2) is a
statically-typed functional language built from the ground up with machine
learning in mind. It is based on OCaml, but includes a number of features
designed to aid in the development of high-quality, reliable machine learning
software. Some of the main ideas (almost none of which are implemented yet)
are:

- Tensors are built-in containers and their sizes are tracked statically by the
  type system.
- The typechecker handles broadcasting correctly, so operations may be applied
  to higher dimensional tensors while maintaining their static, type-level
  sizes.
- ML2 includes facilities for easily interacting with probability
  distributions.
- Interoperation with Python is easy to allow the use of existing machine
  learning code, and to allow ML2 code to be called from Python.
- Interoperation with OCaml is easy to allow non-maching learning tasks to make
  use of existing OCaml libraries.
