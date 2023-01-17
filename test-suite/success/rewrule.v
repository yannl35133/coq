Inductive rewrite {A : Type} (a: A) (b: A) := rewrite_intro.
Notation "a == b" := (rewrite_intro a b) (at level 80).

Axiom pplus : nat -> nat -> nat.
Notation "a ++ b" := (pplus a b).

Definition addn0 := fun n => n ++ 0 == n.
Definition addnS := fun n n' => n ++ S n' == S (n ++ n').
Definition add0n := fun n => 0 ++ n == n.
Definition addSn := fun n n' => S n ++ n' == S (n ++ n').

Rewrite Rule addn0.
Rewrite Rule addnS.
Rewrite Rule add0n.
Rewrite Rule addSn.

Check eq_refl : 5 + 10 = 15.
Check (fun _ _ => eq_refl) : forall n n', S (S n) ++ S n' = S (S (S (n ++ n'))).
Check (fun _ _ _ => eq_refl) : forall n n' n'', S (S n) ++ S n' ++ S (S n'') = S (S (S (S (S (n ++ n' ++ n''))))).

Axiom raise : forall P: Type, P.

Definition raise_bool := fun P p p' =>
  match raise bool as b return P with
    true => p | false => p'
  end == raise (let b := raise bool in P).

Rewrite Rule raise_bool.

Check eq_refl : match raise bool as b return b = b with true | false => eq_refl end = raise (let b := raise bool in b = b).
