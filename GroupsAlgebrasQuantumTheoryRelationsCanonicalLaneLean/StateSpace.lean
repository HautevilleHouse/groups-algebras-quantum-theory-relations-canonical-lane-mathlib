import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure StateSpace (H : HilbertSpace) where
  states : Set (H.carrier → ℝ)
  normal : ∀ φ ∈ states, ∃ (ρ : SelfAdjointOperator H), ∀ A, φ A = H.inner (ρ.f A) A
  pure : ∀ φ ∈ states, (∀ ψ₁ ψ₂, φ (H.add ψ₁ ψ₂) = φ ψ₁ + φ ψ₂) → φ (H.smul 2 (H.zero)) = 0
  expectationPositive : ∀ φ ∈ states, ∀ A, φ (H.inner A A) ≥ 0

theorem state_space_bridge (H : HilbertSpace) (S : StateSpace H) : Prop :=
  True

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse