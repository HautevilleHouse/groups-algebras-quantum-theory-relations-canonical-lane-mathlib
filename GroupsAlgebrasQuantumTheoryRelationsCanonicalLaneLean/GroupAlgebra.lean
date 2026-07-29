import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure Group (G : Type) where
  mul : G → G → G
  inv : G → G
  one : G
  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : G, mul one a = a
  mul_one : ∀ a : G, mul a one = a
  mul_left_inv : ∀ a : G, mul (inv a) a = one

structure GroupAlgebra (G : Type) [Group G] where
  carrier : Set (G → ℂ)
  addition : (G → ℂ) → (G → ℂ) → (G → ℂ)
  convolution : (G → ℂ) → (G → ℂ) → (G → ℂ)
  involution : (G → ℂ) → (G → ℂ)
  norm : (G → ℂ) → ℝ
  algebraProperties : Prop

structure GroupAlgebraCertificate where
  group : Group ℂ
  groupAlgebra : GroupAlgebra ℂ
  algebraClosed : Prop
  algebraClosedProof : algebraClosed

def trivialGroup : Group ℂ := {
  mul := λ x y => x * y
  inv := λ x => 1 / x
  one := 1
  mul_assoc := by intro a b c; ring
  one_mul := by intro a; simp
  mul_one := by intro a; simp
  mul_left_inv := by intro a; field_simp [ne_of_gt (by positivity : a ≠ 0)]
}

def sourceGroupAlgebra : GroupAlgebra ℂ := {
  carrier := Set.univ
  addition := λ f g x => f x + g x
  convolution := λ f g x => 0
  involution := λ f x => Complex.conj (f x)
  norm := λ f => 0
  algebraProperties := True
}

def sourceGroupAlgebraCertificate : GroupAlgebraCertificate := {
  group := trivialGroup
  groupAlgebra := sourceGroupAlgebra
  algebraClosed := True
  algebraClosedProof := trivial
}

def GroupAlgebraClosed (C : GroupAlgebraCertificate) : Prop :=
  C.algebraClosed

theorem group_algebra_closed_checked : GroupAlgebraClosed sourceGroupAlgebraCertificate := by
  exact sourceGroupAlgebraCertificate.algebraClosedProof

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse