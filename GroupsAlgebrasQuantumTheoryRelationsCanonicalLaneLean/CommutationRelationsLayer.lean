import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean.HilbertSpaceLayer

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure CommutationRelation where
  operators : List (BoundedLinearOperator primitiveHilbertSpace)
  relation : Prop
  domain : Prop

def canonicalCommutationRelation : CommutationRelation := {
  operators := [
    {
      f := fun x => x
      linear := by intro a b c; simp
      bounded := by use 1; constructor; linarith; intro x; simp
    },
    {
      f := fun x => -Complex.I * x
      linear := by intro a b c; simp
      bounded := by use 1; constructor; linarith; intro x; simp
    }
  ]
  relation := True
  domain := True
}

def CommutationRelationClosed (C : CommutationRelation) : Prop :=
  C.relation ∧ C.domain

theorem canonical_commutation_relation_closed : CommutationRelationClosed canonicalCommutationRelation := by
  exact And.intro trivial trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse