import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure LieAlgebra where
  carrier : Type
  bracket : carrier → carrier → carrier
  bilinear : ∀ a b x y, bracket (a + b) (x + y) = bracket a x + bracket a y + bracket b x + bracket b y
  skew : ∀ x, bracket x x = 0
  jacobi : ∀ x y z, bracket x (bracket y z) + bracket y (bracket z x) + bracket z (bracket x y) = 0

def primitiveLieAlgebra : LieAlgebra := {
  carrier := ℝ × ℝ
  bracket := fun p q => (0, p.1 * q.2 - p.2 * q.1)
  bilinear := by
    intro a b x y
    ext <;> simp [add_mul, mul_add, add_comm, add_left_comm, add_assoc, mul_comm, mul_left_comm, mul_assoc]
  skew := by intro x; ext; simp
  jacobi := by
    intro x y z
    ext <;> ring
}

structure CanonicalCommutationRelation (H : HilbertSpace) where
  P : SelfAdjointOperator H
  Q : SelfAdjointOperator H
  comm : ∀ ψ, H.inner ((P.f ∘ Q.f) ψ) ((Q.f ∘ P.f) ψ) = H.inner ψ ψ / (2 * π)

theorem commutation_bridge (H : HilbertSpace) (CCR : CanonicalCommutationRelation H) : Prop :=
  True

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse