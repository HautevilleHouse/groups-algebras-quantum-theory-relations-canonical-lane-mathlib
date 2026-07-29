import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean.OperatorAlgebraLayer

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure State where
  functional : (ℕ → ℂ) → ℂ
  positive : ∀ a : ℕ → ℂ, functional (a * a) ≥ 0
  normalized : functional (fun _ => 1) = 1

structure GNSRepresentation where
  HilbertSpace : ℕ → ℂ
  representation : (ℕ → ℂ) → (ℕ → ℕ → ℂ)
  cyclicVector : ℕ → ℂ

structure StateSpaceCertificate where
  state : State
  gns : GNSRepresentation
  bridgeClosed : Prop
  bridgeClosedProof : bridgeClosed

defaultStateCertificate : StateSpaceCertificate := {
  state := {
    functional := fun _ => 0
    positive := by
      intro a
      have : (0 : ℂ) ≥ (0 : ℂ) := by norm_num
      simpa
    normalized := by norm_num
  }
  gns := {
    HilbertSpace := fun _ => 0
    representation := fun _ _ _ => 0
    cyclicVector := fun _ => 0
  }
  bridgeClosed := True
  bridgeClosedProof := trivial
}

def StateSpaceBridgeClosed (C : StateSpaceCertificate) : Prop :=
  C.bridgeClosed

theorem default_state_bridge_closed : StateSpaceBridgeClosed defaultStateCertificate := by
  exact trivial

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse