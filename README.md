# Observational Coq

Observational Coq is an extension of Coq that implements the observational type
theory which is described in
[Observational Equality meets CIC](https://link.springer.com/chapter/10.1007/978-3-031-57262-3_12).

## Features

### Observational Equality

The core language is extended with two new primitives:
```
obseq : forall (A : Type), A -> A -> SProp
Notation "a ~ b" := obseq _ a b.

cast : forall (A B : Type) (e : A ~ B), A -> B
Notation "e # t" := cast _ _ e t.
```
The observational equality `a ~ b` is intended as a replacement for the usual
equality of Coq. It satisfies the extensionality of functions (`funext`) as well
as the extensionality of propositions (`propext`), and by virtue of being a
strict proposition, it satisfies the principle of uniqueness of identity proofs
(UIP).

Unlike the inductive equality, observational equality does not support large
elimination via pattern-matching. Instead, you may use the `cast` operator to
perform coercions between two observationally equal types, which is just as
expressive as pattern-matching.

The file observational.v contains a handful of examples for the basic
manipulation of observational equality.

### Inductive Types

In order to use inductive types with observational equality, you should
activate the flag `Set Observational Inductives`. This way, Coq will
automatically generate new observational principles at every inductive
declaration. For instance, if you define the type of lists as follows:
```
Set Observational Inductives.
Inductive list (A : Type) :=
| nil : list A
| cons : A -> list A -> list A.
```
Then Coq will generate the observational principle `obseq_cons_0` which
has type `list A ~ list B -> A ~ B`.

Quotient types should be supported in the near future.

### Compatibility

Observational Coq is an experimental branch. For the time being, it is
incompatible with several other features of Coq, including coinductive types,
sections, and extraction.

Observational Coq is also incompatible with the universe Prop, for theoretical
reasons. You should use SProp instead.

## Installation

Information on how to build and install from sources can be found in
[`INSTALL.md`](INSTALL.md).

## Documentation

The sources of the documentation can be found in directory [`doc`](doc).
See [`doc/README.md`](/doc/README.md) to learn more about the documentation,
in particular how to build it. The
documentation of the last released version is available on the Coq
web site at [coq.inria.fr/documentation](http://coq.inria.fr/documentation).
See also [Cocorico](https://github.com/coq/coq/wiki) (the Coq wiki),
and the [Coq FAQ](https://github.com/coq/coq/wiki/The-Coq-FAQ),
for additional user-contributed documentation.

The documentation of the master branch is continuously deployed.  See:
- [Reference Manual (master)][refman-master]
- [Documentation of the standard library (master)][stdlib-master]
- [Documentation of the ML API (master)][api-master]

[api-master]: https://coq.github.io/doc/master/api/
[refman-master]: https://coq.github.io/doc/master/refman/
[stdlib-master]: https://coq.github.io/doc/master/stdlib/

## Questions and discussion

We have a number of channels to reach the user community and the
development team:

- Our [Zulip chat][zulip-link], for casual and high traffic discussions.
- Our [Discourse forum][discourse-link], for more structured and easily browsable discussions and Q&A.
- Our historical mailing list, the [Coq-Club](https://sympa.inria.fr/sympa/info/coq-club).

See also [coq.inria.fr/community](https://coq.inria.fr/community.html), which
lists several other active platforms.

## Bug reports

Please report any bug / feature request in [our issue tracker](https://github.com/coq/coq/issues).

To be effective, bug reports should mention the OCaml version used
to compile and run Coq, the Coq version (`coqtop -v`), the configuration
used, and include a complete source example leading to the bug.

## Contributing to Coq

Guidelines for contributing to Coq in various ways are listed in the [contributor's guide](CONTRIBUTING.md).

Information about release plans is at https://github.com/coq/coq/wiki/Release-Plan

## Supporting Coq

Help the Coq community grow and prosper by becoming a sponsor! The [Coq
Consortium](https://coq.inria.fr/consortium) can establish sponsorship contracts
or receive donations. If you want to take an active role in shaping Coq's
future, you can also become a Consortium member. If you are interested, please
get in touch!
