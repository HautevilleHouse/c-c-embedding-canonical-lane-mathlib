import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCE embedding

def ConstrainedCceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cce_endgame (A : AdmissibleClass) :
    ConstrainedCceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CCE embedding
end HautevilleHouse
