(************************************************************************)
(*         *      The Rocq Prover / The Rocq Development Team           *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

(* (c) Copyright 2006-2016 Microsoft Corporation and Inria.                  *)

Require Import ssreflect.
Require Import ssrbool TestSuite.ssr_mini_mathcomp.
Axiom daemon : False. Ltac myadmit := case: daemon.

Lemma test x : (x == x) = (x + x.+1 == 2 * x + 1).
case: (X in _ = X) / eqP => _.
match goal with |- (x == x) = true => myadmit end.
match goal with |- (x == x) = false => myadmit end.
Qed.

Lemma test1 x : (x == x) = (x + x.+1 == 2 * x + 1).
elim: (x in RHS).
match goal with |- (x == x) = _ => myadmit end.
match goal with |- forall n, (x == x) = _ -> (x == x) = _ => myadmit end.
Qed.
