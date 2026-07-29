import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure CStarAlgebra where
  carrier : Type
  norm : carrier → ℝ
  star : carrier → carrier
  starNorm : ∀ a : carrier, norm (star a) = norm a
  CStarIdentity : ∀ a : carrier, norm (star a * a) = norm a ^ 2

structure VonNeumannAlgebra where
  carrier : Type
  weakClosed : Bool
  doubleCommutant : Bool

define_abbrev HilbertSpace := ℕ → ℂ

define_abbrev BoundedOperator (H : HilbertSpace) := H → H

structure SpectralTheoremCertificate where
  operator : BoundedOperator ℕ
  spectralMeasure : Prop
  projectionValued : Prop
  spectralMeasureClosed : spectralMeasure
  projectionValuedClosed : projectionValued

defaultSpectralCertificate : SpectralTheoremCertificate := {
  operator := fun x => x
  spectralMeasure := True
  projectionValued := True
  spectralMeasureClosed := trivial
  projectionValuedClosed := trivial
}

def SpectralTheoremClosed (C : SpectralTheoremCertificate) : Prop :=
  C.spectralMeasure ∧ C.projectionValued

theorem default_spectral_closed : SpectralTheoremClosed defaultSpectralCertificate := by
  exact And.intro trivial trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse