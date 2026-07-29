import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean

structure GroupAlgebra where
  group : Type
  ring : Type
  multiplication : group → group → group
  addition : ring → ring → ring
  scalar : group → ring → ring
  identity : group
  zero : ring
  one : ring
  groupAssoc : ∀ a b c : group, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  identityLeft : ∀ a : group, multiplication identity a = a
  identityRight : ∀ a : group, multiplication a identity = a
  inverse : group → group
  inverseLeft : ∀ a : group, multiplication (inverse a) a = identity
  groupRingCompatibility : ∀ g h : group, scalar (multiplication g h) = scalar g ∘ scalar h

def primitiveGroupAlgebra : GroupAlgebra := {
  group := Unit
  ring := ℕ
  multiplication := fun _ _ => ()
  addition := fun n m => n + m
  scalar := fun _ n => n
  identity := ()
  zero := 0
  one := 1
  groupAssoc := by intro a b c; rfl
  identityLeft := by intro a; rfl
  identityRight := by intro a; rfl
  inverse := fun _ => ()
  inverseLeft := by intro a; rfl
  groupRingCompatibility := by intro g h; rfl
}

end GroupsAlgebrasQuantumTheoryRelationsCanonicalLaneLean
end HautevilleHouse