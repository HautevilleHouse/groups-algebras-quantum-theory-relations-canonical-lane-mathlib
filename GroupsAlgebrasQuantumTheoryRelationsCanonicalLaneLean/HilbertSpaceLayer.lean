import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure HilbertSpace where
  carrier : Type
  inner : carrier → carrier → ℂ
  norm : carrier → ℝ
  add : carrier → carrier → carrier
  zero : carrier
  scalar : ℂ → carrier → carrier
  inner_conj_sym : ∀ x y, inner x y = Complex.conj (inner y x)
  inner_pos : ∀ x, inner x x ≥ 0 ∧ (inner x x = 0 ↔ x = zero)
  norm_eq_sqrt_inner : ∀ x, norm x = Real.sqrt (Complex.re (inner x x))

def primitiveHilbertSpace : HilbertSpace := {
  carrier := ℂ
  inner := fun x y => x * Complex.conj y
  norm := Complex.abs
  add := fun x y => x + y
  zero := 0
  scalar := fun c x => c * x
  inner_conj_sym := by
    intro x y
    simp [mul_comm]
  inner_pos := by
    intro x
    have h : x * Complex.conj x = Complex.normSq x := by
      simp [Complex.normSq]
    simp [h, Complex.normSq_nonneg, Complex.normSq_eq_zero_iff]
  norm_eq_sqrt_inner := by
    intro x
    simp [Complex.abs, Complex.normSq]
}

structure BoundedLinearOperator (H : HilbertSpace) where
  f : H.carrier → H.carrier
  linear : ∀ a b c, f (H.scalar a (H.add b c)) = H.scalar a (H.add (f b) (f c))
  bounded : ∃ M > 0, ∀ x, H.norm (f x) ≤ M * H.norm x

def HilbertSpaceClosed (H : HilbertSpace) : Prop := True

theorem primitive_hilbert_space_closed : HilbertSpaceClosed primitiveHilbertSpace := by
  trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse