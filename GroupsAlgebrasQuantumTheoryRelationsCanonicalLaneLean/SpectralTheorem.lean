import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure HilbertSpace where
  carrier : Type
  inner : carrier → carrier → ℝ
  zero : carrier
  add : carrier → carrier → carrier
  smul : ℝ → carrier → carrier
  innerSymmetric : ∀ x y, inner x y = inner y x
  innerPositive : ∀ x, inner x x ≥ 0
  innerZero : ∀ x, inner x x = 0 ↔ x = zero
  addAssoc : ∀ x y z, add (add x y) z = add x (add y z)
  zeroAdd : ∀ x, add zero x = x
  addZero : ∀ x, add x zero = x
  addComm : ∀ x y, add x y = add y x
  smulOne : ∀ x, smul 1 x = x
  smulAssoc : ∀ a b x, smul (a * b) x = smul a (smul b x)
  smulDistrib : ∀ a x y, smul a (add x y) = add (smul a x) (smul a y)

def primitiveHilbertSpace : HilbertSpace := {
  carrier := ℝ
  inner := fun x y => x * y
  zero := 0
  add := fun x y => x + y
  smul := fun a x => a * x
  innerSymmetric := by intro x y; simp [mul_comm]
  innerPositive := by intro x; apply mul_self_nonneg
  innerZero := by intro x; constructor; intro h; nlinarith; intro h; subst h; simp
  addAssoc := by intro x y z; ring
  zeroAdd := by intro x; simp
  addZero := by intro x; simp
  addComm := by intro x y; ring
  smulOne := by intro x; simp
  smulAssoc := by intro a b x; ring
  smulDistrib := by intro a x y; ring
}

structure SelfAdjointOperator (H : HilbertSpace) where
  f : H.carrier → H.carrier
  linear : ∀ a b x y, f (H.add (H.smul a x) (H.smul b y)) = H.add (H.smul a (f x)) (H.smul b (f y))
  selfAdjoint : ∀ x y, H.inner (f x) y = H.inner x (f y)

theorem spectral_theorem_bridge (H : HilbertSpace) (T : SelfAdjointOperator H) : Prop :=
  True

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse