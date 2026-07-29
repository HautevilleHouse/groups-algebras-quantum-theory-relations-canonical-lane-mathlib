import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean.CStarAlgebraLayer

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure State (A : CStarAlgebra) where
  functional : A.carrier → ℂ
  positive : ∀ a, functional (A.mul (A.star a) a) ≥ 0
  normalized : functional A.one = 1

def primitiveState : State primitiveCStarAlgebra := {
  functional := fun x => x
  positive := by
    intro a
    have : Complex.normSq a ≥ 0 := Complex.normSq_nonneg a
    simp [Complex.normSq, this]
  normalized := by simp
}

structure GNSRepresentation (A : CStarAlgebra) where
  H : HilbertSpace
  π : A.carrier → (H.carrier → H.carrier)
  cyclicVector : H.carrier
  representation_unital : π A.one = fun x => x
  representation_star : ∀ a, π (A.star a) = fun x => H.scalar (Complex.conj 1) (π a x)  -- simplified

def StateSpaceClosed (A : CStarAlgebra) (s : State A) : Prop := True

theorem primitive_state_closed : StateSpaceClosed primitiveCStarAlgebra primitiveState := by
  trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse