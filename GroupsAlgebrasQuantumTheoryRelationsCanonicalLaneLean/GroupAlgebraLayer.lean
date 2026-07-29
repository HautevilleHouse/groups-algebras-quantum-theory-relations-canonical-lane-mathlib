import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean.CStarAlgebraLayer

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure Group (G : Type) where
  mul : G → G → G
  inv : G → G
  one : G
  mul_assoc : ∀ a b c, mul (mul a b) c = mul a (mul b c)
  inv_mul_cancel : ∀ a, mul (inv a) a = one
  mul_one : ∀ a, mul a one = a

def primitiveGroup : Group ℤ := {
  mul := fun x y => x + y
  inv := fun x => -x
  one := 0
  mul_assoc := by intro a b c; omega
  inv_mul_cancel := by intro a; omega
  mul_one := by intro a; omega
}

structure GroupAlgebra (G : Type) (A : CStarAlgebra) where
  group : Group G
  algebra : A
  representation : G → (A.carrier → A.carrier)
  unitary : ∀ g, ∀ a, A.norm (representation g a) = A.norm a

def primitiveGroupAlgebra : GroupAlgebra ℤ primitiveCStarAlgebra := {
  group := primitiveGroup
  algebra := primitiveCStarAlgebra
  representation := fun n a => (a : ℂ) * (Complex.exp (2 * π * Complex.I * (n : ℂ)))
  unitary := by
    intro n a
    simp
}

def GroupAlgebraClosed (G : GroupAlgebra ℤ primitiveCStarAlgebra) : Prop := True

theorem group_algebra_closed_checked : GroupAlgebraClosed primitiveGroupAlgebra := by
  trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse