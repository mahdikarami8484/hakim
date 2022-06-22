Import /Arith.

Theorem sigma_is_zero: ∀ a: ℤ, ∀ f: ℤ -> ℤ, eq ℤ (sigma a a f) 0.
Proof. intros. lia. Qed.
Theorem sigma_atom: ∀ a: ℤ, ∀ f: ℤ -> ℤ, eq ℤ (sigma a (a+1) f) (f a).
Proof. intros. lia. Qed.
Theorem sigma_atom_minus: ∀ a: ℤ, ∀ f: ℤ -> ℤ, eq ℤ (sigma (a-1) a f) (f (a-1)).
Proof. intros. lia. Qed.
Theorem sigma_plus: ∀ a b c: ℤ, ∀ f: ℤ -> ℤ, eq ℤ (sigma a b f + sigma b c f) (sigma a c f).
Proof. intros. lia. Qed.
Theorem sigma_plus2: ∀ a b: ℤ, ∀ f g: ℤ -> ℤ, (sigma a b f + sigma a b g) = (sigma a b (λ i: ℤ, f i + g i)).
Proof. intros. lia. Qed.
Theorem sigma_factor: ∀ a b c: ℤ, ∀ f: ℤ -> ℤ, c * sigma a b f = sigma a b (λ i: ℤ, c * f i).
Proof. intros. lia. Qed.
Theorem sigma_f_equal: ∀ a b: ℤ, a ≤ b -> ∀ f g: ℤ -> ℤ, (∀ i, a ≤ i -> i < b -> f i = g i) -> sigma a b f = sigma a b g.
Proof.
    intros a.
    apply z_induction_simple.
    Switch 1.
    intros.
    lia.
    intros.
    replace #1 (sigma a (n + 1) f) with (sigma a n f + f n).
    lia.
    replace #1 (sigma a (n + 1) g) with (sigma a n g + g n).
    lia.
    replace #1 (sigma a n f) with (sigma a n g).
    apply H0.
    intros.
    apply H1.
    apply (lt_trans ?0 n ?2 ?3 ?4).
    lia.
    assumption.
    assumption.
    replace #1 (f n) with (g n).
    apply H1.
    lia.
    assumption.
    lia.
Qed.
Todo sigma_neg1: ∀ n: ℤ, ∀ f: ℤ -> ℤ, sigma (-n) 0 (λ i: ℤ, - f i) = sigma 0 (n+1) f.
Todo sigma_shift: ∀ a b c: ℤ, ∀ f: ℤ -> ℤ, sigma a b (λ i: ℤ, f (i+c)) = sigma (a+c) (b+c) f.
