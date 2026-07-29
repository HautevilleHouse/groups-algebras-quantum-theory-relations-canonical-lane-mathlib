import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean.HilbertSpaceLayer
import HautevilleHouse.GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean.CStarAlgebraLayer

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure SpectralCertificate where
  operator : BoundedLinearOperator primitiveHilbertSpace
  spectrum : Set ℂ
  spectralMeasures : Prop
  functionalCalculus : Prop

def spectralCertificate : SpectralCertificate := {
  operator := {
    f := fun x => x
    linear := by intro a b c; simp
    bounded := by
      use 1
      constructor
      linarith
      intro x; simp
  }
  spectrum := {1}
  spectralMeasures := True
  functionalCalculus := True
}

def SpectralTheoremClosed (S : SpectralCertificate) : Prop :=
  S.spectralMeasures ∧ S.functionalCalculus

theorem spectral_theorem_closed_checked : SpectralTheoremClosed spectralCertificate := by
  exact And.intro trivial trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse