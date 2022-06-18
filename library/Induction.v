Import /Function.

Axiom z_recdep_simple: ∀ k: ℤ, ∀ P: ℤ -> U, ∀ a: P k, ∀ b: (∀ n: ℤ, k ≤ n -> P n -> P (n+1)), ∃ f: (∀ n: ℤ, k ≤ n -> P n), ∀ n: ℤ, (∀ kp: k ≤ k, f k kp = a) ∧ ∀ kp: k ≤ n, ∀ kp2: k ≤ n + 1, f (n+1) kp2 = b n kp (f n kp).

Theorem z_induction_simple: ∀ k: ℤ, ∀ P: ℤ -> U, P k -> (∀ n: ℤ, k ≤ n -> P n -> P (n+1)) -> (∀ n: ℤ, k ≤ n -> P n).
Proof.
    intros.
    add_from_lib z_recdep_simple.
    add_hyp z_recdep_simple_ex := (z_recdep_simple (k)).
    add_hyp z_recdep_simple_ex_ex := (z_recdep_simple_ex (P)).
    add_hyp z_recdep_simple_ex_ex_ex := (z_recdep_simple_ex_ex (H)).
    add_hyp z_recdep_simple_ex_ex_ex_ex := (z_recdep_simple_ex_ex_ex (H0)).
    destruct z_recdep_simple_ex_ex_ex_ex with (ex_ind ? ?) to (f f_property).
    apply f.
    assumption.
Qed.
Theorem z_induction_strong: ∀ k: ℤ, ∀ P: ℤ -> U, (∀ n: ℤ, k ≤ n -> (∀ m: ℤ, k ≤ m -> m < n -> P m) -> P n) -> (∀ n: ℤ, k ≤ n -> P n).
Proof.
    intros.
    add_hyp (∀ n, k ≤ n -> ∀ m, k ≤ m -> m < n -> P m).
    Switch 1.
    apply (H1 (n + 1) ?2 ?4 ?6 ?8).
    lia.
    assumption.
    lia.
    apply z_induction_simple.
    intros.
    Switch 1.
    intros.
    lia.
    add_hyp (m < n0 ∨ m = n0).
    lia.
    destruct H5 with (or_ind ? ?).
    replace #1 (m) with (n0).
    assumption.
    apply H.
    assumption.
    assumption.
    apply H2.
    assumption.
    assumption.
Qed.

Todo z_recursion_simple: ∀ k: ℤ, ∀ B: U, ∀ a: B, ∀ b: ℤ -> B -> B, ∃ f: ℤ -> B, f k = a ∧ ∀ n: ℤ, k ≤ n -> f (n+1) = b n (f n).
