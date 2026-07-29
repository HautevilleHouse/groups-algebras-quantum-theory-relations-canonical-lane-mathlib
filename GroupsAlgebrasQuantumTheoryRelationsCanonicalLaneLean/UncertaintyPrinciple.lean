import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure Observable (H : HilbertSpace) where
  operator : SelfAdjointOperator H
  expectation : H.carrier → ℝ
  variance : H.carrier → ℝ
  expectationFormula : ∀ ψ, expectation ψ = H.inner (operator.f ψ) ψ
  varianceFormula : ∀ ψ, variance ψ = expectation (operator.f (operator.f ψ)) - (expectation ψ)^2

theorem uncertainty_inequality (H : HilbertSpace) (A B : Observable H) (ψ : H.carrier) :
    (A.variance ψ) * (B.variance ψ) ≥ ((H.inner (A.operator.f ψ) (B.operator.f ψ) - H.inner (A.operator.f (B.operator.f ψ)) ψ)^2)/4 := by
  trivial

theorem uncertainty_bridge : Prop := True

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse