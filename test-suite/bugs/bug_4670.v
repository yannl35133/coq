Require Import TestSuite.vector.
Module Bar.
  Definition foo A n (l : Vector.t A n) : True.
  Proof.
    induction l ; exact I.
  Defined.
End Bar.
