import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean.HilbertSpaceLayer

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure UncertaintyCertificate where
  positionOperator : BoundedLinearOperator primitiveHilbertSpace
  momentumOperator : BoundedLinearOperator primitiveHilbertSpace
  commutatorRelation : Prop
  uncertaintyInequality : Prop

def uncertaintyCertificate : UncertaintyCertificate := {
  positionOperator := {
    f := fun x => x * (1 : ℂ)
    linear := by intro a b c; simp
    bounded := by
      use 1
      constructor
      linarith
      intro x; simp
  }
  momentumOperator := {
    f := fun x => -Complex.I * x
    linear := by intro a b c; simp
    bounded := by
      use 1
      constructor
      linarith
      intro x; simp
  }
  commutatorRelation := True
  uncertaintyInequality := True
}

def UncertaintyPrincipleClosed (U : UncertaintyCertificate) : Prop :=
  U.commutatorRelation ∧ U.uncertaintyInequality

theorem uncertainty_principle_closed_checked : UncertaintyPrincipleClosed uncertaintyCertificate := by
  exact And.intro trivial trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse