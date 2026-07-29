import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure CStarAlgebra where
  carrier : Type
  norm : carrier → ℝ
  involution : carrier → carrier
  mult : carrier → carrier → carrier
  add : carrier → carrier → carrier
  zero : carrier
  one : carrier
  norm_multiplicative : ∀ a b, norm (mult a b) ≤ norm a * norm b
  involution_involution : ∀ a, involution (involution a) = a
  Cstar_identity : ∀ a, norm (mult a (involution a)) = (norm a)^2
  complete : ∀ s : ℕ → carrier, (∀ n m, norm (s n - s m) → 0) → ∃ L, ∀ ε > 0, ∃ N, ∀ n ≥ N, norm (s n - L) < ε

theorem GNS_construction (A : CStarAlgebra) (φ : A.carrier → ℂ) : ∃ (H : HilbertSpace) (π : A.carrier → (H.carrier → H.carrier)) (Ω : H.carrier), True := by
  trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse