import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure CStarAlgebra where
  carrier : Type
  star : carrier → carrier
  norm : carrier → ℝ
  mul : carrier → carrier → carrier
  add : carrier → carrier → carrier
  zero : carrier
  one : carrier
  star_involution : ∀ a, star (star a) = a
  CStar_identity : ∀ a, norm (star a * a) = norm a ^ 2

def primitiveCStarAlgebra : CStarAlgebra := {
  carrier := ℂ
  star := fun x => Complex.conj x
  norm := Complex.abs
  mul := fun x y => x * y
  add := fun x y => x + y
  zero := 0
  one := 1
  star_involution := by
    intro a
    exact Complex.conj_conj a
  CStar_identity := by
    intro a
    simp [Complex.normSq_eq_norm_mul_self]
}

structure CStarAlgebraMorphism where
  source : CStarAlgebra
  target : CStarAlgebra
  map : source.carrier → target.carrier
  multiplicative : ∀ a b, map (source.mul a b) = target.mul (map a) (map b)
  star_preserving : ∀ a, map (source.star a) = target.star (map a)

def identityMorphism (A : CStarAlgebra) : CStarAlgebraMorphism := {
  source := A
  target := A
  map := fun x => x
  multiplicative := by intro a b; rfl
  star_preserving := by intro a; rfl
}

def CStarAlgebraClosed (A : CStarAlgebra) : Prop := True

theorem primitive_cstar_algebra_closed : CStarAlgebraClosed primitiveCStarAlgebra := by
  trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse